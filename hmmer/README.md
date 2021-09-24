# esl-seqstat

This workflow counts the residues in the fasta files in data/*fa.
Sums all of the counts at the end to produce a single value.

To generate test data run init.sh with the number of sequences you'd like to generate.
(requires easel installed on system)
```
cd data
bash init.sh 1000
```

This will create a number of dummy fasta files that the `nextflow` command below will
process.

To run the workflow locally:
```
nextflow run workflow.nf -params-file .yaml
```
To run with the docker image:
```
nextflow run workflow.nf -params-file params.yaml -profile docker
```

You can also provide a custom value for `target_files` on the command line:
```
nextflow run workflow.nf --target_files "data/*.txt"
```



