openssl genrsa -out users-data/${USERNAME}.key 2048
openssl req -new -key users-data/${USERNAME}.key  -out users-data/${USERNAME}.csr -subj "/CN=${USERNAME}/O=dev"
sudo openssl x509 -req -in users-data/${USERNAME}.csr -CA /home/sirfacu/.minikube/ca.crt -CAkey /home/sirfacu/.minikube/ca.key -CAcreateserial -out users-data/${USERNAME}.crt -days 500
openssl x509 -in users-data/${USERNAME}.crt -noout -text | grep "Subject:"
kubectl config set-cluster sirfacuk8s --server=https://192.168.49.2:8443 --certificate-authority=/home/sirfacu/.minikube/ca.crt
kubectl config set-credentials user_${USERNAME} --client-certificate=users-data/${USERNAME}.crt  --client-key=users-data/${USERNAME}.key 
kubectl config set-context user_${USERNAME} --cluster sirfacuk8s --user=user_${USERNAME}
# for para crear dinamicamente usuarios
#export username_list="juan pedrito fulanito"
#for user in $username_list; do export USERNAME=$user; envsubst < ../script-crear-users.sh  > $user.sh; chmod +x $user.sh ; sh $user.sh; rm -rf $user.sh ;done
#eliminacion de los usuarios creados
#for user in $username_list; do export USERNAME=$user; kubectl config delete-context user_$user ;done