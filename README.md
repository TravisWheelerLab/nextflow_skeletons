# Nextflow Skeletons

Some simple Nextflow workflows that illustrate common patterns. These are
intended to be used as templates for more useful workflows.

## About Nextflow

Nextflow provides a language and tools to construct pipelines, composed of
arbitrary data and commands, and run them in various environments. See
https://nextflow.io for more information and installation instructions.

One of the major advantages of Nextflow (and other, similar systems) is that a
workflow can generally run in a variety of environments, such as AWS or a
cluster, with very little modification.

## Anatomy of a Workflow

Each workflow consists of several common files. These are described below.

**workflow.nf** - this is where the workflow is defined. It is written in a
domain specific language (DSL) used by Nextflow to define how data flow from
operation to operation.

**nextflow.config** - this file defines configuration options for different
environments (such as local or AWS). Each set of options is called a *profile*,
and this can be set from the command line using the `-profile` option when
running the workflow. The name of this file causes it to be picked up by
Nextflow automatically, to use a different name, specify the file with the
`-config` option on the command line.

**params.yaml** - contains workflow parameters, such as where to find the
necessary input files. Parameters can also be set on the command line by using a
double dash along with the parameter name (`--foo`, for example). Specify which
params file to use for a given run with the `-params-file` option.

## Running a Workflow

Run a workflow using the `nextflow run` command:

```
nextflow run workflow.nf -params-file params.yaml -profile local
```

### AWS Batch

It is possible to run a workflow in AWS using the Batch service. Creating the
necessary resources within your AWS account to allow this requires a few steps
that are described elsewhere. However, once this is done, there are just two
steps required to run any of the workflows in this repo in AWS:

  1. Configure AWS credentials using environment variables
  2. Pass the `-profile aws_batch` flag to `nextflow run`

The following environment variables are required:

  * `AWS_ACCESS_KEY_ID`
  * `AWS_SECRET_ACCESS_KEY`
  * `AWS_DEFAULT_REGION`

The last can usually be set to `us-east-1`. The others can be found in your AWS
user settings.

## Skeletons

**char_count/** - count characters in files and sum the counts. This is a good
place to start since the basic patterns on display here are quite common.

