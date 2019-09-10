#!/bin/bash

### Create generic secrets for coverity.
kubectl create secret generic -n onprem coverity-license --from-literal=license=coverity
kubectl create secret docker-registry gcr-json-key --docker-server=https://gcr.io --docker-username="_json_key" --docker-password="$(cat polaris-keyfile.json)" --docker-email="cloudnative-ro@polaris-dev-233821.iam.gserviceaccount.com" -n onprem
kubectl create secret generic -n default tools-store-sync
kubectl create secret tls swip-ingress-tls --cert=tls.crt --key=tls.key

### Create a secret... 
openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out tls.crt -keyout tls.key

echo "Get the secret for image pull from Jeremy/Senthil/Jay/... press any key when ready"
read x
kubectl create -f secret.yml

/usr/local/bin/synopsysctl create polaris native default --version test --pull-secret gcr-json-key --postgres-password admin --postgres-username admin --environment-dns onprem.dev.polaris.synopsys.com --environment-name onprem  --smtp-host mailhost.internal.synopsys.com --smtp-port 25 --smtp-username root --smtp-password root| kubectl apply -f - -n default --validate=false

kubectl get secret | grep -q auth
kubectl get pods | grep -q polaris
