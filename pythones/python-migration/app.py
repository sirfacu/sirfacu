import main
from IPython.display import display
import pymysql # libreria para crear conexion a base de datos
from configuration_data import ConfigurationData #Carga los datos de conexion

#COMPANIAS POR DEFECTO PARA UBITS 25,462, 124, 82, 2923, 66, 1835, 2901, 2902

def genConnection():
        # Ambiente a conectarse
        values = ConfigurationData.variables_enviroment()
        conn = pymysql.connect(
            host = values["host_db"],
            user = values["user_db"],
            passwd = values["pwd"],
            port =int(values["port"]),
            db=values["database"],
        )
        cursor = conn.cursor()
        return conn, cursor
## inicio del archivo
dbconn , dbcursor = genConnection()#se crea la conexion
companiesQuery = (
        """SELECT id 
        FROM adminhr.company
        WHERE id not in (25,462, 124, 82, 2923, 66, 1835, 2901, 2902)""") # COMPAÑIAS POR DEFECTO DE UBITS CON LAS DE QA
        #WHERE id in (company_ids)""") # cambiando este where con el activo se puede manejar para solo modificar una o varias especificamente

#se realiza la carga de las compañias siempre excluyendo las por defecto
dbcursor.execute(companiesQuery)
companiesList = dbcursor.fetchall()
companies= [comp_id[0] for comp_id in companiesList]
dbconn.close()
# constructor de la clase main
main_functions = main.Main(companies)

#EJECUTAR TODO
#print(main_functions.execute_process())