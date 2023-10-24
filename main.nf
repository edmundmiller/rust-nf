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

csv = file("https://github.com/BurntSushi/rust-csv/raw/master/examples/data/smallpop.csv")

process PRE_BUILD {
    beforeScript "cd ${projectDir}/before_example && cargo build --release"

    input:
    path csv

    script:
    """
    ${projectDir}/before_example/target/release/before_example < $csv
    """
}

workflow {
    MANIFEST_RS()
    OUTER_LINE_DOC()
    PRE_BUILD(csv)
}
