#! /bin/bash -x
dnf update -y
dnf install python3 -y
dnf install python-pip -y
pip3 install Flask==2.3.3
pip3 install Flask-MySql
pip3 install boto3
dnf install git -y
echo "phonebook-app.cbanmzptkrzf.us-east-1.rds.amazonaws.com" > /home/ec2-user/dbserver.endpoint
cd /home/ec2-user
TOKEN=$(aws --region=us-east-1 ssm get-parameter --name /clarusway/phonebook/token --with-decryption --query 'Parameter.Value' --output text)
git clone https://$TOKEN@github.com/awsdevopsteam/phonebook-web-app.git
python3 /home/ec2-user/phonebook-web-app/solution_with_parameter_store/phonebook-app.py 

