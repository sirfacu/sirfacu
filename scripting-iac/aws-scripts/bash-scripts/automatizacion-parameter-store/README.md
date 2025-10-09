* * * Parameter Store resources
This section will explain how to create a new parameter store and configurations:

1. PREPARING THE ENVIRONMENT

    The follow tools are required:
        - sops

    To install sops please check PORJECT_BASE/readme.txt         

    Import the GPG_KEY from the infra drive using these command: {infra_key} is an example

    # gpg --import {infra_key}.key
    # gpg --allow-secret-key-import --import {infra_key}.key

    Go to pulumi/parameter-store folder and execute:
    # source deploy.sh
    be ensure that the PGP_ID variable correspond with the correct PGP key ID

2. HOW TO CREATE A NEW PARAMETER STORE

follow this steps to create a new parameter store
    - Execute the function initPS
        # initPS {team}-{env}   #replace team and env with yours values
    - Decrypt the paramSecureFile
        # decryptFile definitions/paramsSecure.json
    - Include your parameter store definitions as below:

            {
                app_name:{
                    key: secret_to_save
                }
            }
    - Encrypt the file again
        # encryptFile definitions/paramsSecure.json
    - Execute the exec_deploy command
        # exec_deploy
         The definitions/tmp file contains the json files to create the parameters store
        # once executed you will receive a message like this:

        " 
        Don't Forget check if this(these) line(s) exists in your index.ts file
           const jelper_ps = new parameterStore("jelper"); 
           const org_chart_ps = new parameterStore("org_chart"); 
        DONE!  everything is ready to execute your pulumi up 
        "

    - You must check that those lines exist in the index.ts file and finally execute the pulumi up command to persist your changes.

        # pulumi up
    
    - Once you deploy your changes
        
        # restoreFiles
    
    - and commit your changes to bitbucket the unique files that could be have some changes are: paramsSecure.json and index.ts

        # git add paramsSecure.json
        # git add index.ts
        # git commit -m "your comment here"
        # git push

3. ABOUT THE DEPLOY SCRIPT

    These are the main functions that deploy.sh file  define

    # encryptFile 
        Receive as parameter the file to encrypt and use the variable PGP_ID defined within the deploy.sh file to encrypt the file
        the result of the encription is saved in the same file received as parameter

        Usage:

        encryptFile path/to/myfile

    # decryptFile
        Receive as parameter the file to decrypt and use the variable PGP_ID defined within the deploy.sh file to decrypt the file
        the result of the decryption is saved in the same file received as parameter

        Usage:

        decryptFile path/to/myfile
        
    # initPS
        this function validate if exist or not the pulumi configuration file Pulumi.{team}-{env}.yaml if doesn't exist it will create during the execution

        Usage:

        initPS {team} {env}

    # exec_deploy
        This function use the file paramsSecure.json (must be encrypted) to create the json files required to create the parameter store 
        this will create as many files as configs<=>APPNAME exist in the paramsSecure.json
        it will create a temporally folder definitions/tmp and then will save files APP_NAME-conf.json the APPNAME
        
        Usage:

        exec_deploy

    # restoreFiles
        This function delete the files/folders created with exec_deploy and call to encrypt function to encrypt the paramsSecure.yaml File again

    # validateConfigFiles
        This function is used to validate if a file exist receive as parameter the file to valide

