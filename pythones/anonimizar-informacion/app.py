import pymysql
from dbconnection import ConfigurationData
import main

# Lista de compañías
#companies =[24,462,124,82,2923,66,1835,2901,2902] # COMPAÑIAS POR DEFECTO DE UBITS CON LAS DE QA HACE PRUEBAS
companies = [1397]
#companies = [1,25]

print("🚀 Iniciando proceso de anonimización...")
def genConnetion():
    dbConfigurationData = ConfigurationData.variables_enviroment()
    
    print(f"🔧 DEBUG - Host: {dbConfigurationData['host']}")
    print(f"🔧 DEBUG - User: {dbConfigurationData['user']}")
    print(f"🔧 DEBUG - Port: {dbConfigurationData['port']}")
    print(f"🔧 DEBUG - Database: {dbConfigurationData['db']}")
    print(f"🔧 DEBUG - Password: {'*' * len(dbConfigurationData['password'])}")
    
    conn = pymysql.connect(
        host= dbConfigurationData["host"],
        user= dbConfigurationData["user"],
        passwd= dbConfigurationData["password"],
        port=int(dbConfigurationData["port"]),
        db=dbConfigurationData["db"],
    )
    cursor = conn.cursor()
    return conn, cursor

dbconn , dbcursor = genConnetion()
companiesQuery = (
    """ SELECT id , alias as company_name
    FROM  adminhr.company
    WHERE id in (""" + str(companies)[1:-1] + """)"""
)

dbcursor.execute(companiesQuery)
companiesList = dbcursor.fetchall()
companies = [comp_id[0] for comp_id in companiesList]

dbconn.close()

main_functions = main.Main(companies)
print(f"📋 Compañías a procesar: {companies}")
print(f"🏢 Nombres de empresas: {[comp[1] for comp in companiesList]}")

try:
    print("🔍 PASO 1: Obteniendo usuarios...")
    lista_ids = main_functions.mdl_user()
    
    print("\n📊 cantidad de usuarios:")
    print("-" * 40)
    print(f"✅ Total de usuarios encontrados: {len(lista_ids)}")
    print(f"📝 Lista de IDs (primeros 10): {lista_ids[:10]}...")
    print(f"👤 Lista de usernames (primeros 10): {main_functions.listaUserNames[:10]}...")
    print(f"📧 Lista de emails (primeros 10): {main_functions.listaMails[:10]}...")
    
    print("\n🚀 PASO 2: Ejecutando proceso completo de anonimización...")
    print("="*60)
    result = main_functions.anonimizarInfoEmpresas()
    
    print("\n✅ PROCESO COMPLETADO:")
    print("="*60)
    print(f"🎯 Total de usuarios procesados: {len(main_functions.listaIdsUsers)}")
    print(f"📊 Resultado del proceso: {result}")
    
except Exception as e:
    print(f"❌ Error ejecutando el proceso: {e}")
    print("🔧 Verifica la configuración de la base de datos")