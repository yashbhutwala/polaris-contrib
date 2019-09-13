
# On prem raw installation

These directions are for dev/test only, for now.

- git clone synopsys-operator
- cd `/cmd/synopsysctl`
- `go build`
- get the image pull secrets via direct message from jeremyD or j
- unzip
- run `synopsysctl-jay`
- `./synopsysctl create polaris native default --version test --pull-secret gcr-json-key --postgres-password admin --postgres-username admin --environment-dns onprem.dev.polaris.synopsys.com --environment-name onprem  --smtp-host mailhost.internal.synopsys.com --smtp-port 25 --smtp-username root --smtp-password root| kubectl apply -f - -n default --validate=false`
