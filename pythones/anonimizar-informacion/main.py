import pymysql
import pandas as pd
import time
from dbconnection import ConfigurationData
from datetime import datetime as dt


class Main:
    def __init__(self, companies):
        self.companies_migrate = companies
        self.listaIdsUsers = []
        self.listaUserNames = []
        self.listaMails = []

        start_time = time.time()

    def connection(self):
        # Configuración de conexión
        values = ConfigurationData.variables_enviroment()
        host = values["host"]
        user = values["user"]
        password = values["password"]
        port = values["port"]
        db = values["db"]
        
        conn = pymysql.connect(
            host=host,
            user=user,
            passwd=password,
            port=int(port),
            connect_timeout=25,
            db=db
        )
        cursor = conn.cursor()
        return conn, cursor

    def smart_query(self, query, conn, table_name, limite_registros=10000):
        try:
            print(f"🔍 Evaluando cantidad de registros en {table_name}...")
            
            count_query = f"SELECT COUNT(*) as total FROM ({query}) as subquery"
            count_df = pd.read_sql(count_query, conn)
            total_records = count_df['total'].iloc[0]
            
            print(f"📊 Total de registros encontrados: {total_records:,}")
            
            if total_records < limite_registros:
                print(f"✅ Usando join_query (registros < {limite_registros:,})")
                return self.join_query(query, conn, table_name)
            else:
                print(f"⚡ Usando simple_query (registros >= {limite_registros:,})")
                return self.simple_query(query, conn, table_name)
                
        except Exception as e:
            print(f"❌ Error en smart_query: {e}")
            print("🔄 Fallback a join_query...")
            return self.join_query(query, conn, table_name)

    def simple_query(self, query, conn, table_name):
        if conn is not None:
            try:
                print("Ejecutando consulta en la tabla:", table_name)

                start_time = time.time()
                df_lista = []
                tiempos = []
                chunksize = 50000
                offset = 0
                total_filas = 0

                while True:
                    consulta = f"{query} LIMIT {offset}, {chunksize}"
                    df = pd.read_sql(consulta, conn)
                    if len(df) == 0:
                        break

                    df_lista.append(df)
                    tiempos.append(time.time() - start_time)
                    offset += chunksize
                    total_filas += len(df)

                    print(
                        f"[Filas procesadas: {total_filas} | Tiempo de ejecución: {tiempos[-1]:.3f}s]",
                        end="\r",
                    )

                print("")

                df = pd.concat(df_lista, ignore_index=True)
                print("")
                return df
            except pymysql.Error as e:
                print(f"Error al ejecutar la consulta: {e}")
                return None

            finally:
                conn.close()

    def join_query(self, query, conn, table_name):
        if conn is not None:
            try:
                print("Ejecutando consulta en la tabla: " + table_name)
                start_time = time.time()
                df = pd.read_sql(query, conn)
                tiempo_ejecucion = round(time.time() - start_time, 3)

                print(
                    "[Filas procesadas:",
                    str(len(df)),
                    " | ",
                    "Tiempo de ejecución:",
                    tiempo_ejecucion,
                    "s]",
                    "\n",
                )
                return df
            except pymysql.Error as e:
                print(f"Error al ejecutar la consulta: {e}")
                return None
            finally:
                conn.close()

########################################################################################
    # CONSULTAS A REALIZAR EN LA BD 
########################################################################################
    def mdl_user(self):
        conn, cursor = self.connection()
        query = (
            """select mu.id 
            from bitnami_moodle.mdl_user mu
            join bitnami_moodle.mdl_u_user_additional_info muuai on mu.id = muuai.mdl_user_id 
            where muuai.mdl_u_company_id in ("""
            + str(self.companies_migrate)[1:-1] 
            + ")"
        )
        df = self.smart_query(query, conn, "mdl_user")
        
        self.listaIdsUsers = df['id'].tolist()
        self.listaUserNames = [f"anonimous_{x}_1876" for x in range(0, len(self.listaIdsUsers))]
        self.listaMails = [f"anonimous_{x}_1876@fulanito.com" for x in range(0, len(self.listaIdsUsers))]
        
        return self.listaIdsUsers
    
    def users(self):
        return self.mdl_user()

    def anonimizarTabla_mdl_user(self):
        conn, cursor = self.connection()
        self.users()  
        
        print("-------------------------------------------------------------------------------")
        print("                            Usuarios a actualizar tabla mdl_user")
        print("-------------------------------------------------------------------------------")
        print("Cantidad   : ", str(len(self.listaIdsUsers)))
        print("Usuarios:   "+ str(self.listaIdsUsers))
        print("-------------------------------------------------------------------------------")
        
        sqlCommand = """UPDATE bitnami_moodle.mdl_user SET 
            username=%s, 
            mnethostid=0, 
            email=%s, 
            lang='No Data', 
            confirmed=1, 
            policyagreed=0, 
            password='No Data', 
            idnumber='1234', 
            firstname='Proyecto Limpieza', 
            lastname='Datos Personales', 
            emailstop=0, 
            icq='No Data', 
            skype='No Data', 
            yahoo='No Data', 
            aim='No Data', 
            msn='No Data', 
            phone1='No Data', 
            phone2='No Data', 
            institution='No Data', 
            department='No Data', 
            address='No Data', 
            calendartype='No Data', 
            theme='No Data', 
            timezone='No Data', 
            currentlogin=0, 
            secret='No Data', 
            picture='0', 
            url='No Data', 
            description='Limpieza datos personales',
            descriptionformat='No Data', 
            mailformat='No Data', 
            maildigest='No Data', 
            maildisplay='No Data', 
            autosubscribe='No Data', 
            trackforums='No Data', 
            trustbitmask=0, 
            imagealt='No Data', 
            lastnamephonetic='No Data', 
            firstnamephonetic='No Data', 
            middlename='No Data', 
            alternatename='No Data', 
            moodlenetprofile='No Data', 
            birthdate=0 
            WHERE id = %s;"""
        
        cursor.executemany(sqlCommand, list(zip(self.listaUserNames, self.listaMails, self.listaIdsUsers)))
        conn.commit()
        print("Se actualizan los usuarios correctamente.")
        cursor.close()
        conn.close()

    def anonimizarTabla_mdl_u_user_additional_info(self):
        conn, cursor = self.connection()
        backup_query = f"""
            SELECT * FROM bitnami_moodle.mdl_u_user_additional_info 
            WHERE mdl_user_id IN ({str(self.listaIdsUsers)[1:-1]})
        """
        self.save_backup_data("mdl_u_user_additional_info", backup_query, conn)
        conn.close()
        
        conn, cursor = self.connection()
        self.users()  
        
        print("-------------------------------------------------------------------------------")
        print("             Usuarios a actualizar tabla mdl_u_user_additional_info")
        print("-------------------------------------------------------------------------------")
        print("Cantidad   : ", str(len(self.listaIdsUsers)))
        print("Usuarios:   "+ str(self.listaIdsUsers))
        print("-------------------------------------------------------------------------------")
        
        sqlCommand = """UPDATE bitnami_moodle.mdl_u_user_additional_info SET 
            linkedin_url='No Data', 
            duration_in_minutes=0, 
            gender='No Data', 
            educationlevel='No Data', 
            knowledge_areas='No Data', 
            personal_mail='No Data', 
            phone='No Data', 
            dark_mode=0, 
            onboarding_is_skipped=0, 
            onboarding_skipped_updated_at=0, 
            custom_id='No Data',
            custom_date=0, 
            company_level='No Data' 
            WHERE mdl_user_id = %s;"""
        
        cursor.executemany(sqlCommand, [(user_id,) for user_id in self.listaIdsUsers])
        
        conn.commit()
        print("Se actualizan los usuarios correctamente.")
        
        cursor.close()
        conn.close()

    def anonimizarTabla_ubits_user(self):
        conn, cursor = self.connection()
        backup_query = f"""
            SELECT * FROM adminhr.ubits_user 
            WHERE mdl_user_id IN ({str(self.listaIdsUsers)[1:-1]}) AND status=1
        """
        self.save_backup_data("ubits_user", backup_query, conn)
        conn.close()
        
        conn, cursor = self.connection()
        self.users()  
        
        print("-------------------------------------------------------------------------------")
        print("             Usuarios a actualizar tabla ubits_user")
        print("-------------------------------------------------------------------------------")
        print("Cantidad   : ", str(len(self.listaIdsUsers)))
        print("Usuarios:   "+ str(self.listaIdsUsers))
        print("-------------------------------------------------------------------------------")
        
        sqlCommand = """UPDATE adminhr.ubits_user SET 
            email=%s, 
            personal_email=%s, 
            username=%s, 
            firstname='Proyecto Limpieza', 
            lastname='Datos Personales', 
            birthdate=0, 
            birthday=0, 
            column_a='No Data', 
            column_b='No Data', 
            department='No Data', 
            dni='No Data', 
            gender='No Data', 
            lang='No Data', 
            location_id=5, 
            user_acceptance_of_terms=0 
            WHERE mdl_user_id = %s and status=1"""
        
        cursor.executemany(sqlCommand, list(zip(self.listaMails, self.listaMails, self.listaUserNames, self.listaIdsUsers)))
        
        conn.commit()
        print("Se actualizan los usuarios correctamente.")
        
        cursor.close()
        conn.close()

    def anonimizarTabla_goals_user(self):
        conn, cursor = self.connection()
        backup_query = f"""
            SELECT * FROM goals.user 
            WHERE user_id IN ({str(self.listaIdsUsers)[1:-1]})
        """
        self.save_backup_data("goals_user", backup_query, conn)
        conn.close()
        
        conn, cursor = self.connection()
        self.users()  
        
        print("-------------------------------------------------------------------------------")
        print("             Usuarios a actualizar tabla goals.user")
        print("-------------------------------------------------------------------------------")
        print("Cantidad   : ", str(len(self.listaIdsUsers)))
        print("Usuarios:   "+ str(self.listaIdsUsers))
        print("-------------------------------------------------------------------------------")
        
        sqlCommand = """UPDATE goals.user SET 
            username=%s,  
            email=%s, 
            full_name='Proyecto Limpieza Datos Personales', 
            is_suspended=0, 
            is_onboarding_shown=0, 
            created_at="2000-01-01 00:00:00", 
            updated_at="2000-01-01 00:00:00", 
            deleted_at="2000-01-01 00:00:00" 
            WHERE user_id = %s"""
        
        cursor.executemany(sqlCommand, list(zip(self.listaUserNames, self.listaMails, self.listaIdsUsers)))
        
        conn.commit()
        print("Se actualizan los usuarios correctamente.")
        
        cursor.close()
        conn.close()

########################################################################################
# Función principal para anonimizar los datos
########################################################################################
    def anonimizarInfoEmpresas(self):
      self.anonimizarTabla_mdl_user()
      self.anonimizarTabla_mdl_u_user_additional_info()
      self.anonimizarTabla_ubits_user()
      self.anonimizarTabla_goals_user()

    def save_backup_data(self, table_name, query, conn):
        try:
            print(f"💾 Guardando backup de {table_name}...")
            df = pd.read_sql(query, conn)

            # Crear nombre del archivo
            filename = f"anonymizer_{table_name}_bk.csv"

            # Guardar en CSV
            df.to_csv(filename, index=False)
            print(f"✅ Backup guardado en: {filename} ({len(df)} registros)")

            return filename
        except Exception as e:
            print(f"❌ Error guardando backup de {table_name}: {e}")
            return None