#!/usr/bin/env nextflow

process MANIFEST_RS {
    conda "./env.yaml"

    output:
    path "test.bed"

    script:
    """
    test-manifest.rs
    """
}

workflow {
    MANIFEST_RS()
}
