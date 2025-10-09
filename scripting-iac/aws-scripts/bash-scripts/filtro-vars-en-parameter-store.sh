# Definir el perfil y la región
AWS_PROFILE="default"
AWS_REGION="us-east-1"

> parameter-store-founds.log
while IFS= read -r linea
do
  count=0
  for param in $(aws ssm describe-parameters --query 'Parameters[].Name' --output text --region $AWS_REGION --profile $AWS_PROFILE); do
    echo "Evaluando domain: "$CYAN$linea$RESET" en parameter store "$ROJO$param$RESET
    param_value=$(aws ssm get-parameter --name "$param" --with-decryption --query 'Parameter.Value' --output text --region $AWS_REGION --profile $AWS_PROFILE) 
    
    if echo "$param_value" | grep -q $linea; then
      echo "Dato encontrado en el parameter:" $ROJO$param$RESET >> parameter-store-founds.log
    fi
  
  done
done < domains.txt


