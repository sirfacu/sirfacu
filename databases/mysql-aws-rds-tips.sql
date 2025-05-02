## configuracion rds mysql para logs de querys mas lentos

general_log = 1
general_log_file = Especifica el archivo de logs (e.g., /rdsdbdata/log/general/mysql-general.log)
log_output = FILE
log_error = Especifica el archivo de logs de errores (e.g., /rdsdbdata/log/error/mysql-error.log)
log_queries_not_using_indexes = 1 (opcional, para registrar consultas que no usan índices)
slow_query_log = 1
long_query_time = 2 (para registrar consultas que tardan más de 2 segundos)