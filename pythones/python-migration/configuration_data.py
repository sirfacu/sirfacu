class ConfigurationData:
    def values_data():
        values = {
        "db_connection": {
            "host_db": "test-upgrade-db-cluster.cluster-cjqpovg6bsbu.us-east-1.rds.amazonaws.com",
            "user_db":"moodle_dev_admin",
            "pwd":"ufTZG4VcB2pGesB8",
            "database":"bitnami_moodle",
            "port":"3306",
          }
        }
        return values

    def variables_enviroment():
        values = ConfigurationData.values_data()
        values = values['db_connection']
        return values
        