rule all:
    input: "result.txt"

rule generate:
    output: "result.txt"
    shell:
        "echo 'Docker test success' > {output}"
