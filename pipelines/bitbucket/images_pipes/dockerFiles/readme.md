This way every images were created to be used

main tools:

- jq: to deal with json files and capture data from them
- curl: ideal to test url and responses
- aws-cli: CLI to handle AWS resources
- bash: pretty terminal
- dos2unix: To restablished the format of a file commonly manipulated by windows and that can't be parsed correctly in unix (common issue from analytic script files)
- python 3 and pip:  tools commmonly used to deal with python files
- net-tools: a full set of tools used to troubleshooting common network issues

FROM node:21

RUN apt-get update
RUN apt-get -y install curl unzip bash jq dos2unix python3 python3-pip 
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install


FROM node:18

RUN apt-get update
RUN apt-get -y install curl unzip bash jq dos2unix python3 python3-pip 
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install


FROM node:20

RUN apt-get update
RUN apt-get -y install curl unzip bash jq dos2unix python3 python3-pip 
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

FROM node:16

RUN apt-get update
RUN apt-get -y install curl unzip bash jq dos2unix python3 unzip python3-pip 
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
RUN python3 -m pip install boto3
