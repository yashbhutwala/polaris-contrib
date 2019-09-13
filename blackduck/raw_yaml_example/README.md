This is not officially supported installation path, but rather, an example for advanced kubernetes users of blackduck.

# Raw yaml installation example

You can use the raw yamls in this repository to install a hub.

If you want to update this example with a different base yaml froma  more recent release, you can
grab the latest YAMLs from https://github.com/blackducksoftware/releases/.

This is meant as an example for advanced users who want to operationalized blackduck.

It is highly recommended to use the `synopsysctl` installation tool, which can generate

these artifacts for you, however.

# Whats in this example

This example has 

- a raw "blackduck_base" yaml file, which has all blackduck definitions with reasonable
defaults.
- a kustomization.yaml file which can be used as an example to borrow from, which sets the
namespace value in the blackduck base file.

Note that since we support openshift, we also have a `routes` object, but failure to create this
on non-openshift clusters is not a problem, at all.

# Example

In this example, we take raw YAML input and replace it using kustomize as well as sed.  We
use kustomize for the parameters which are native to kustomize (for example namespaces), and
sed to replace the escaped parameters in the yaml files.

Note that `YmxhY2tkdWNrCg==/g` is the base64 encoded value of the string 'blackduck', which is what we
use as the password for this toy installation.  Please use a more sophisticated password in the real world :).

```
PASSWORD=`cat blackduck | base64`
kubectl kustomize ./ | sed 's/${NAME}/generic/g' | sed 's/${ADMIN_DB_PASSWORD}/YmxhY2tkdWNrCg==/g' | sed 's/${POSTGRES_DB_PASSWORD}/YmxhY2tkdWNrCg==/g' | sed 's/${USER_DB_PASSWORD}/YmxhY2tkdWNrCg==/g'
```
