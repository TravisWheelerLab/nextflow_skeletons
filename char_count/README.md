# Char Count

This workflow counts the characters in its input files in parallel and then sums
all of the counts at the end to produce a single value.

![graph.jpg](Workflow Graph)

To generate test data:

```
cd data
python init.py
```

This will create a number of dummy files that the `nextflow` command below will
process.

To run the workflow locally:

```
nextflow run char_count.nf -params-file char_count_params.yaml
```

You can also provide a custom value for `target_files` on the command line:

```
nextflow run char_counts.nf --target_files "data/*.txt"
```


