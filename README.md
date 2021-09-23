# Nextflow Skeletons

Some simple Nextflow workflows that illustrate common patterns. These are
intended to be used as templates for more useful workflows.

## Nextflow

See https://nextflow.io for installation instructions.

## Char Counts

This workflow, defined in `char_counts.nf`, counts the characters in its input
files in parallel and then sums all of the counts at the end.

To generate test data:

```
cd fixtures/char_counts
python init.py
```

This will create 5000 dummy files that the `nextflow` command below will
process.

To run the workflow locally:

```
nextflow run char_count.nf -params-file char_count_params.yaml
```

You can also provide a custom value for `target_files` on the command line:

```
nextflow run char_counts.nf --target_files "fixtures/char_counts/*.txt"
```

