#!/bin/sh

aws="/usr/bin/aws --region ap-northeast-1"
logger="logger -t $0"

get_instance_id()
{
    instance_id=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
}

get_redis_endpoint()
{
    redis_endpoint=$(${aws} ec2 describe-instances \
                  --instance-id ${instance_id} \
                  --query 'Reservations[].Instances[].Tags[?Key==`Redis_endpoint`].Value' \
                  --output text)
}

set_redis_endpoint()
{
    sed -i -e "s/REDIS_HOST.*$/REDIS_HOST: '${redis_endpoint}'/g" docker-compose.yml
}

${logger} "start $0"

${logger} "install docker and docker-compose"
yum -y install docker
systemctl start docker
systemctl enable docker
curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

${logger} "install app"
yum -y install git
cd ~
git clone https://github.com/tetsis/simple-chat.git
cd simple-chat

${logger} "get info"
get_instance_id
get_redis_endpoint

${logger} "set environment"
set_redis_endpoint

${logger} "run app"
docker-compose up -d

${logger} "finished $0"

exit 0
