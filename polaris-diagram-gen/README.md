# This is just a small example of how to graphically visualize polaris service/secret/volume dependencies.

In this folder are some JQ examples
that will generate diagrams from
k8s objects in polaris for helping
to maintain the content on the
polaris-contrib wiki

# To generate this diagram

```
cat out.json | jq '.items[] | "\(.metadata.name)\" -> \(.spec.volumes[] | [.name] | join("","") ),"'.
```
