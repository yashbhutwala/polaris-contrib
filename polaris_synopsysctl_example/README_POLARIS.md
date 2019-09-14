Reading time: 5 minutes.

This is not officially supported installation path, but rather, an example for advanced kubernetes users of blackduck
Who want to get up and running with blackduck using raw
yAMl flies (kubernetes).

# On prem raw installation

These directions are for dev/test only, for now.

- git clone synopsys-operator
- cd `/cmd/synopsysctl`
- `go build`
- get the image pull secrets via direct message from jeremyD or j
- unzip
- run `synopsysctl-jay`
- `./synopsysctl create polaris native default --version test --pull-secret gcr-json-key --postgres-password admin --postgres-username admin --environment-dns onprem.dev.polaris.synopsys.com --environment-name onprem  --smtp-host mailhost.internal.synopsys.com --smtp-port 25 --smtp-username root --smtp-password root| kubectl apply -f - -n default --validate=false`
