#!/bin/bash
# Pasos para generar los certificados para que se firmen por el CA del cluster y nos permitan login en el mismo.
# 1. Crear un certificado CA
sudo openssl genrsa -out sirfacu.key 2048
# 2. Crear un CSR 
# 2.1 El Common Name o CN, es para k8s el nombre_del_usuario
# 2.2 El Organization Unit o OU, es para k8s el gropo al que pertenece el usuario
# Tener bastante en cuenta esto si vamos a gestionar usuarios de esta forma
sudo openssl req -new -key sirfacu.crt  -out sirfacu.csr -subj "/CN=sirfacu/O=dev"
# 3. Firmar el csr con el ca del k8s
# 3.1 ejecutar:
 k8s config view | grep certificate-authority 
# k8s config view
# apiVersion: v1
# clusters:
# - cluster:
#     certificate-authority: /home/sirfacu/.minikube/ca.crt

# 4. tomar la data que dice certificate-authority y ejecutar el comando para crear el crt firmado por k8s
sudo openssl x509 -req -in sirfacu.csr -CA /home/sirfacu/.minikube/ca.crt -CAkey /home/sirfacu/.minikube/ca.key -CAcreateserial -out sirfacu.crt
# 5 Validar
sudo openssl x509 -in sirfacu.crt -noout -text | grep "Subject:"
#salida esperada: Subject: CN = sirfacu, O = dev
#Comando para seterar el cluster 
kubectl config set-cluster sirfacuk8s --server=https://192.168.49.2:8443 --certificate-authority=/ca.crt

#Agregamos credenciales para lordfacu con la llave y certificados creados
kubectl config set-credentials lordfacu --client-certificate=/test/sirfacu.crt  --client-key=/test/sirfacu.key 
#output: User "lordfacu" set.

#Configuramos el contexto en el cluster NOMBRE_CONFIGURABLE
kubectl config set-context lordfacu --cluster sirfacuk8s --user=lordfacu
#output: Context "lordfacu" created.

#Configuramos kubectl para que tome las credenciales configuradas de k8s
kubectl config use-context lordfacu
#output: Switched to context "lordfacu".