#!/bin/bash

source `dirname ${BASH_SOURCE}`/args.sh "${@}"

echo "Example invocation: ./test.sh -n onprem --version test --pull-secret gcr-json-key --postgres-password admin --postgres-username admin --environment-dns onprem.dev.polaris.synopsys.com --environment-name onprem  --smtp-host smtp.sendgrid.net --smtp-port 2525 --smtp-username apikey --smtp-password "SG.xxxx" --native "


set -x

### Create namespace
kubectl create ns "$_arg_namespace"

TLSOUT_CRT=tls.crt
TLSOUT_KEY=tls.key
### Generate the TLS certificate and key
openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out "$TLSOUT_CRT" -keyout "$TLSOUT_KEY" -subj '/CN=www.mydom.com/O=My Company Name LTD./C=US/ST=MA/OU=j'

### Create the TLS certificate secret
kubectl create secret tls -n "$_arg_namespace" swip-ingress-tls --cert="$TLSOUT_CRT" --key="$TLSOUT_KEY"

### Create generic secrets for coverity... 
echo "for this to work, you need to get coverity-license from senthil/jeremy"
kubectl create -n "$_arg_namespace" -f coverity-license.yaml

### Get pull secrets 
echo "for this to work, you need to get polaris-keyfile.json from senthil/jeremy"
### Create pull secrets 
kubectl create secret docker-registry "$_arg_pull_secret" --docker-server=https://gcr.io --docker-username="_json_key" --docker-password="$(cat polaris-keyfile.json)" --docker-email="cloudnative-ro@polaris-dev-233821.iam.gserviceaccount.com" -n "$_arg_namespace"

### Create tools store sync secret... TODO: Need to be removed once the tools sync job is fixed
echo "for this to work, you need to get tools secret file from senthil/jeremy.... contact them and then continue"
read x
kubectl create -f tools-store-sync.yaml -n "$_arg_namespace"


./synopsysctl create polaris native "$_arg_namespace" --environment-dns "$_arg_environment_dns" --environment-name "$_arg_environment_name" --eventstore-size "$_arg_eventstore_size" --format "$_arg_format" --postgres-username "$_arg_postgres_username" --postgres-password "$_arg_postgres_password" --postgres-size "$_arg_postgres_size" --pull-secret "$_arg_pull_secret" --smtp-host "$_arg_smtp_host" --smtp-port $_arg_smtp_port --smtp-username "$_arg_smtp_username" --smtp-password "$_arg_smtp_password" --storage-class "$_arg_storage_class" --target "$_arg_target" --uploadserver-size "$_arg_uploadserver_size" --version "$_arg_version" > /tmp/deploy-polaris.yml ; 

echo "Created polaris deployment at /tmp/deploy-polaris.yml.... applying in 1 second..."

sleep 1

cat /tmp/deploy-polaris.yml | kubectl apply -f - -n "$_arg_namespace" --validate=false



