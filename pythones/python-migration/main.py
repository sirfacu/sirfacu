import pymysql
from datetime import datetime
from tqdm import tqdm_notebook
from configuration_data import ConfigurationData


class Main:
    def __init__(self, companies):
        self.procedures
        #self.companies_anonymous = companies
        #self.listaIdsUsers = self.mdl_user()# vienen los ids
        #self.listaUserNames = [f"anonimous_{x}" for x in range(0,len(self.listaIdsUsers))] # crea una lista de usernames anonimous_{x}
        #self.listaMails = [ f"anonimous_{x}@fulanito.com" for x in range(0,len(self.listaIdsUsers))] #crea una lista de los email sanonimous_{x}@fulanito.com

    def connection(self):
        values = ConfigurationData.variables_enviroment()
        conn = pymysql.connect(
            host = values["host_db"],
            user = values["user_db"],
            passwd = values["pwd"],
            db=values["database"],
            port =int(values["port"]),
        )
        cursor = conn.cursor()
        return conn, cursor
  
    def mdl_user(self):
        conn, cursor = self.connection() 
        query = (
            """select mu.id 
            from
            bitnami_moodle.mdl_user mu
            join bitnami_moodle.mdl_u_user_additional_info muuai on mu.id = muuai.mdl_user_id 
            where 
            muuai.mdl_u_company_id in ("""
            + str(self.companies_anonymous)[1:-1] 
            + ")"
        )
        try:
            cursor.execute(query)
            print(f"Cantidad de usuarios: {cursor.rowcount}")
            result = cursor.fetchall()
            user_ids = [row[0] for row in result]
        except pymysql.Error as e:
            print(f"Error al ejecutar consulta de usuarios {e}")
        cursor.close()
        conn.close()
        return user_ids
    
    def update_mdl_user(self):
        conn, cursor = self.connection()
        query2 = """UPDATE bitnami_moodle.mdl_user SET 
            username=%s, 
            mnethostid=0, 
            email=%s, 
            lang='No Data', 
            confirmed=1, 
            policyagreed=0, 
            password='No Data' , 
            idnumber='1234', 
            firstname='Proyecto Limpieza' , 
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
        try:
            cursor.executemany(query2, list(zip(self.listaUserNames, self.listaMails, self.listaIdsUsers)))
            print(f"Cantidad de registros afectados: {cursor.rowcount}")
            conn.commit()
            print("Se actualizan los usuarios correctamente.")
        except pymysql.Error as e:
            print(f"Error al actualizar el registro bitnami_moodle.mdl_user {e}")
        #Cierre Sesión.
        cursor.close()
        conn.close()

    def update_mdl_u_user_additional_info(self):
        conn, cursor = self.connection()
        query2 = """UPDATE bitnami_moodle.mdl_u_user_additional_info SET facebook_url='No Data',
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
            WHERE 
            mdl_user_id = %s;"""
        try:
            cursor.executemany(query2, list(self.listaIdsUsers))
            print(f"Cantidad de registros afectados: {cursor.rowcount}")
            conn.commit()
            print("Se actualizan los usuarios correctamente.")
        except pymysql.Error as e:
            print(f"Error al actualizar en bitnami_moodle.mdl_u_user_additional_info {e}")
        cursor.close()
        conn.close()

    def update_ubits_user(self):
        conn, cursor = self.connection()
        query2 = """UPDATE adminhr.ubits_user SET 
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
        WHERE 
        mdl_user_id = %s and status=1
        ;"""
        try:
            for email, personalEmail, username, user_id in zip(self.listaMails, self.listaMails, self.listaUserNames, self.listaIdsUsers):
                    print(f"Se va a actualizar el usuario {username} con id {user_id} con el correo {personalEmail}")
                    cursor.execute(query2, (email,personalEmail,username, user_id))
                    conn.commit()
            #cursor.executemany(query2, list(zip(self.listaMails, self.listaMails, self.listaUserNames, self.listaIdsUsers)))
            #print(f"Cantidad de registros afectados: {cursor.rowcount}")
            #conn.commit()
        except pymysql.Error as e:
            print(f"Error al actualizar el registro ubits_user {e}")
        print("Se actualizan los usuarios correctamente.")
        cursor.close()
        conn.close()
    
    def update_goals_user(self):
        conn, cursor = self.connection()
        query2 = """UPDATE goals.user SET 
        username=%s,  
        email=%s, 
        full_name='Proyecto Limpieza Datos Personales', 
        is_suspended=0, 
        is_onboarding_shown=0, 
        created_at="2000-01-01 00:00:00", 
        updated_at="2000-01-01 00:00:00", 
        deleted_at="2000-01-01 00:00:00" 
        WHERE 
        user_id = %s """
        try:
            cursor.executemany(query2, list(zip(self.listaUserNames, self.listaMails, self.listaIdsUsers)))
            print(f"Cantidad de registros afectados: {cursor.rowcount}")
            conn.commit()
            print("Se actualizan los usuarios correctamente.")
        except pymysql.Error as e:
            print(f"Error al actualizar el registro con goals.user {e}")
        cursor.close()
        conn.close()

    def procedures(self):
        conn, cursor = self.connection()
        cursor.execute("SHOW PROCEDURE STATUS")
        procedures = cursor.fetchall()

        # Buscar la palabra clave en cada procedimiento
        for procedure in procedures:
            procedure_name = procedure[1]
            print("ingrese")

            cursor.execute(f"SHOW CREATE PROCEDURE {procedure_name}")
            procedure_definition = cursor.fetchone()[1]
            #if "ubits" in procedure_definition:
            print(procedure_definition)
########################################################################################
###  EJECUCION DE TABLAS A ANONIMIZAR
########################################################################################
    def execute_process(self):
        print("-------------------------------------------------------------------------------")
        print("            Usuarios a actualizar tabla bitnami_moodle.mdl_user                ")
        print("-------------------------------------------------------------------------------")
        print("La hora de inicio es: ",datetime.now().strftime("%H:%M:%S") )
        #self.update_mdl_user()
        print("La hora de fin es: ",datetime.now().strftime("%H:%M:%S") )
        print("-------------------------------------------------------------------------------")
        print("      Usuarios a actualizar tabla bitnami_moodle.mdl_u_user_additional_info    ")
        print("-------------------------------------------------------------------------------")
        print("La hora de inicio es: ",datetime.now().strftime("%H:%M:%S") )
        #self.update_mdl_u_user_additional_info()
        print("La hora de fin es: ",datetime.now().strftime("%H:%M:%S") )
        print("-------------------------------------------------------------------------------")
        print("             Usuarios a actualizar tabla adminhr.ubits_user                    ")
        print("-------------------------------------------------------------------------------")
        print("La hora de inicio es: ",datetime.now().strftime("%H:%M:%S") )
        self.update_ubits_user()
        print("La hora de fin es: ",datetime.now().strftime("%H:%M:%S") )
        print("-------------------------------------------------------------------------------")
        print("                   Usuarios a actualizar tabla goals.user                      ")
        print("-------------------------------------------------------------------------------")
        print("La hora de inicio es: ",datetime.now().strftime("%H:%M:%S") )
        #self.update_goals_user()
        print("La hora de fin es: ",datetime.now().strftime("%H:%M:%S") )