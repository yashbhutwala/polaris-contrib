#!/bin/bash

kubectl create -f secret.yml
/usr/local/bin/synopsysctl create polaris native default --version test --pull-secret gcr-json-key --postgres-password admin --postgres-username admin --environment-dns onprem.dev.polaris.synopsys.com --environment-name onprem  --smtp-host mailhost.internal.synopsys.com --smtp-port 25 --smtp-username root --smtp-password root| kubectl apply -f - -n default --validate=false

kubectl get secret | grep -q auth
kubectl get pods | grep -q polaris
