import boto3
import json
from botocore.exceptions import ClientError

class ConfigurationData:
    
    def get_parameter_store_values():
        try:
            ssm_client = boto3.client('ssm')
            parameter_name = "prod-anonymizer-serverless"
            
            response = ssm_client.get_parameter(
                Name=parameter_name,
                WithDecryption=True
            )
            
            json_data = json.loads(response['Parameter']['Value'])
            return json_data
            
        except ClientError as e:
            print(f"Error obteniendo parámetros del Parameter Store: {e}")
            return {}
        except Exception as e:
            print(f"Error inesperado: {e}")
            return {}

    def values_data():
        ps_values = ConfigurationData.get_parameter_store_values()
        # Valores por defecto
        default_values = {
            "host": "localhost",
            "user": "user_migration_adminhr",
            "password": "PON_PASSWORD_AQUI",
            "db": "bitnami_moodle",
            "port": "3306"
        }
        
        if ps_values:
            default_values.update({
                "host": ps_values.get('learn_host', default_values['host']),
                "user": ps_values.get('learn_user', default_values['user']),
                "password": ps_values.get('learn_password', default_values['password']),
                "db": ps_values.get('learn_db', default_values['db']),
                "port": ps_values.get('learn_port', default_values['port'])
            })
            print("✅ Configuración cargada desde Parameter Store")
        else:
            print("⚠️  Usando configuración por defecto (Parameter Store no disponible)")
        
        values = {
            "database_connection": default_values
        }
        return values

    def variables_enviroment():
        values = ConfigurationData.values_data()
        values = values['database_connection']
        return values
        