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

process OUTER_LINE_DOC {
    conda "./env.yaml"

    output:
    path "test.bed"

    script:
    """
    test-outer-line-doc.rs
    """
}

workflow {
    MANIFEST_RS()
    OUTER_LINE_DOC()
}
