process MANIFEST_RS {
    conda "./env.yaml"

    script:
    """
    test-manifest.rs
    """
}

workflow {
    MANIFEST_RS()
}
