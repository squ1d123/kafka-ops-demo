#!/bin/bash
set -x

kafka_terraform_version=0.1.4
terraform_plugs_dir="/var/jenkins_home/.terraform.d/plugins"
kafka_terraform_path="${terraform_plugs_dir}/terraform-provider-kafka"

mkdir -p $terraform_plugs_dir

if [ ! -f $kafka_terraform_path ]; then
    cd $terraform_plugs_dir
    curl -LO "https://github.com/Mongey/terraform-provider-kafka/releases/download/v${kafka_terraform_version}/terraform-provider-kafka_${kafka_terraform_version}_linux_amd64.tar.gz"
    tar -xvf terraform-provider-kafka_${kafka_terraform_version}_linux_amd64.tar.gz
    rm -f LICENSE README.md terraform-provider-kafka_${kafka_terraform_version}_linux_amd64.tar.gz
fi

exec /sbin/tini -- /usr/local/bin/jenkins.sh $@
