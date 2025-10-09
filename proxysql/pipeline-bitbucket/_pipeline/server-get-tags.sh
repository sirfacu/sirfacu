#!/usr/bin/env bash
set -e

if [[ ! -f /home/ssm-user/.server-tags ]]; then
    # get info from instance tags
    IN=`curl -Ss  http://169.254.169.254/latest/meta-data/instance-id`
    RG=`curl -Ss  http://169.254.169.254/latest/meta-data/placement/region`
    TG=`aws ec2 describe-tags --region $RG --filters "Name=resource-id,Values=$IN" --query Tags[*].[Key,Value] --output text`

    # volcamos los tags del server a un archivo para poder reusarlas mas adelante
    echo -e "$TG" | awk '{gsub(/[^a-zA-Z]+/,"_",$1);print "TAG_"toupper($1)"="$2}' > /home/ssm-user/.server-tags

    echo "REGION=$RG" >> /home/ssm-user/.server-tags
    echo "ARTIFACT_SRC=xxx" >> /home/ssm-user/.server-tags

    ARCH=`arch`
    if [[ "$ARCH" == "x86_64" ]]; then
        ARCH='amd64'
    fi
    echo "ARCH=$ARCH" >> /home/ssm-user/.server-tags

fi

# la ubicacion del artifact
SRC=`readlink -f "$0"`
SRC=`dirname "$SRC"`
SRC=`dirname "$SRC"`
sed -i "s#ARTIFACT_SRC=.*#ARTIFACT_SRC=$SRC#" /home/ssm-user/.server-tags

echo "TAGS LOADED" >> /etc/proxysql-codedeploy.log
cat /home/ssm-user/.server-tags >> /etc/proxysql-codedeploy.log
