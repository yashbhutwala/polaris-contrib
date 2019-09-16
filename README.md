# This is a home for SE and Customer support scripts for blackduck and polaris related deployment artifacts.

We will be expanding it in the future to have use cases, scripts, hacks, deployment stories, and kustomizations.

# DISCLAIMER

These examples are not a part of any official synopsys/blackduck release, and aren't supported as production
deployment tooling by blackduck/polaris engineering teams.  Please only use these if you know what you are doing, and consult your support contacts before using them  to install or modify a production instance of blackduck/polaris.  These examples are mostly intended for learning.

That said, these should be very useful for helping you learn how to install blackduck, or polaris, in a production setting!

-------------------------------------------


# Contents 

This repo has **Scripts/Tutorials** alongside a **Wiki** . 

## Scripts and Tutorials

The **top level directory** has several self explanatory tutorials, scripts, and other one off tools with examples for
customer success, proof of concepts, generic installation walkthroughs

## Docs

We also have **a wiki** with several articles for learning about polaris and blackduck deployments in kubernetes environments: 
https://github.com/blackducksoftware/polaris-contrib/wiki


-------------------------------------------

# Philosophy

We've created this repository because customers have a broad range of deployment models and tool integrations which don't always fit neatly into the standard SDLC pipeline for an enterprise grade software delivery model.

As you peruse these artifacts, you might find some recipes are overspecified, underdocumented, not fully supported, or highly biased to a particular use case.  That is *intentional*, as these are *reusable* artifacts where we take lessons from internal engineering, performance configurations, customer configurations, and innovation which happens in the field, so that we can reuse and share different product delivery and configuration models with customers and internal engineering as they evolve.

Thus, the following philosophical approach is taken to the curation of the artifacts in this repository.

- *Customer success* and satisfaction is the driving factor behind engineering artifacts.
- Building a *community* around our core engineering products which demonstrates the flexibility of our platform to accomodate use cases in a fine grained way is a good thing. 
- *Redundancy is okay* if it increases the understandability of the product from a customers perspective.
- Documentation is a living, breathing artifact that should evolve at the *pace of business*.
- In a microservices delivery model, deployment technology evolves at the *pace of business*.

# This is not officially supported by the Engineering team at Synopsys, but rather, a jointly owned repo to innovate on deployment and support recipes.

Owners: Viral, Murat.
