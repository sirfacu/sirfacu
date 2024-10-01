openssl genrsa -out ${USERNAME}.key 2048
openssl req -new -key ${USERNAME}.key  -out ${USERNAME}.csr -subj "/CN=${USERNAME}/O=test"
sudo openssl x509 -req -in ${USERNAME}.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out ${USERNAME}.crt -days 500
openssl x509 -in ${USERNAME}.crt -noout -text | grep "Subject:"
kubectl config set-cluster prueba --server=https://dev-test-dns-1qskx4lt.hcp.eastus.azmk8s.io:443 --certificate-authority=ca.crt
kubectl config set-credentials user_${USERNAME} --client-certificate=${USERNAME}.crt  --client-key=${USERNAME}.key 
kubectl config set-context user_${USERNAME} --cluster prueba --user=user_${USERNAME}
# for para crear dinamicamente usuarios
#for user in sirfacu-test; do export USERNAME=$user; envsubst < ../script-crear-users.sh  > $user.sh; chmod +x $user.sh ; sh $user.sh ;done