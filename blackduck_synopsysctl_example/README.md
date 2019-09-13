Reading time: 5 minutes.

# Synopsysctl 

This is an example of how to use synopsysctl, the preffered installation tool for blackduck.

Its extremely easy... lets go !

In this example, we'll deploy a blackduck instance by *first* creating a SINGLE NAMESPACE operator.

The purpose of this operator is simply to deploy one blackduck instance, in a specific namespace, and
is relevant to users who only need one instance of blackduck running.

## Installing blackduck, and the blackduck operator, in 5 minutes.

```
wget https://github.com/blackducksoftware/synopsys-operator/releases/download/2019.8.3/synopsysctl-darwin-amd64.zip
unzip synopsysctl-darwin-amd64.zip
mv synopsysctl-darwin-amd64.zip /usr/local/bin/synopsysctl

# deploy a secure, namespace scoped operator.  This will only do things in the jay namespace.
./synopsysctl deploy --enable-blackduck=true --namespace=jay

# Finally, install blackduck in the same namespace.  The operator will see the CRD created below, and create a blackduck instance.
./synopsysctl create blackduck jay --admin-password=blackduck --postgres-password=blackduck --user-password=blackduck  --namespace=jay
```

After  a few minutes:

```
kubectl get pods -n jay
```

And you will see your running blackduck instance!


