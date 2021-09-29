#!/usr/bin/env nextflow

target_files = Channel.fromPath( params.target_files )

process count_residues {
    input:
    path target_file from target_files

    output:
    stdout into residue_counts

    """
    esl-seqstat ${target_file} | grep -i residues | awk '{print \$4}'
    """
}

process sum_counts {
    input:
    path counts_file from residue_counts.collectFile()

    output:
    env total into total_count

    """
    for count in \$(cat ${counts_file}); do
        total=\$((\${total:-0} + \$count))
    done
    """
}

total_count.view { "total characters: $it" }
