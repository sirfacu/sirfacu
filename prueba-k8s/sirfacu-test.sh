openssl genrsa -out sirfacu-test.key 2048
openssl req -new -key sirfacu-test.key  -out sirfacu-test.csr -subj "/CN=sirfacu-test/O=test"
sudo openssl x509 -req -in sirfacu-test.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out sirfacu-test.crt -days 500
openssl x509 -in sirfacu-test.crt -noout -text | grep "Subject:"
kubectl config set-cluster prueba --server=https://dev-test-dns-1qskx4lt.hcp.eastus.azmk8s.io:443 --certificate-authority=ca.crt
kubectl config set-credentials user_sirfacu-test --client-certificate=sirfacu-test.crt  --client-key=sirfacu-test.key 
kubectl config set-context user_sirfacu-test --cluster prueba --user=user_sirfacu-test
# for para crear dinamicamente usuarios
#for user in sirfacu-test; do export USERNAME=; envsubst < ../script-crear-users.sh  > .sh; chmod +x .sh ; sh .sh ;done