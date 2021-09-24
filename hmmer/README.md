# esl-seqstat
This workflow counts the residues in the fasta files in data/*fa.
Sums the counts at the end to produce a single value.

To generate test data run ```data/init.sh``` with the number of sequences you'd like to generate.
### easel installed locally
```
cd data
bash init.sh 1000
```
### with docker
```
docker pull tcolligan4/hmmer_ncbi_codeathon
cd data
docker run --workdir /data --mount type=bind,src=$PWD,dst=/data tcolligan4/hmmer_ncbi_codeathon bash init.sh 1000
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



