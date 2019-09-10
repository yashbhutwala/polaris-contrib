#!/bin/bash

TLSOUT_CRT=tls.crt
TLSOUT_KEY=tls.key
### Create a secret... 
openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out $TLSOUT_CRT -keyout $TLSOUT_KEY

### Create generic secrets for coverity.
kubectl create secret generic -n onprem coverity-license --from-literal=license=coverity

### Get pull secrets 
echo "for this to work, you need polaris-keyfile.json, get it from senthil/jeremy"
kubectl create secret docker-registry gcr-json-key --docker-server=https://gcr.io --docker-username="_json_key" --docker-password="$(cat polaris-keyfile.json)" --docker-email="cloudnative-ro@polaris-dev-233821.iam.gserviceaccount.com" -n onprem

kubectl create secret generic -n default tools-store-sync
kubectl create secret tls swip-ingress-tls --cert=$TLSOUT_CRT --key=$TLSOUT_KEY

/usr/local/bin/synopsysctl create polaris native default --version test --pull-secret gcr-json-key --postgres-password admin --postgres-username admin --environment-dns onprem.dev.polaris.synopsys.com --environment-name onprem  --smtp-host mailhost.internal.synopsys.com --smtp-port 25 --smtp-username root --smtp-password root| kubectl apply -f - -n default --validate=false

kubectl get secret | grep -q auth
kubectl get pods | grep -q polaris
