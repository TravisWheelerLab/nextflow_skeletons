#!/usr/bin/env nextflow

target_files = Channel.fromPath( params.target_files )

process count_letters {
    input:
    path target_file from target_files

    output:
    stdout into character_counts

    """
    wc -m ${target_file} | awk '{ print \$1 }'
    """
}

process sum_counts {
    input:
    path counts_file from character_counts.collectFile()

    output:
    env total into total_count

    """
    for count in \$(cat ${counts_file}); do
        total=\$((\${total:-0} + \$count))
    done
    """
}

total_count.view { "total characters: $it" }
