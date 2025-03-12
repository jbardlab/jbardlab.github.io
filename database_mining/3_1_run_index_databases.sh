#!/bin/bash
image_path="/scratch/group/jbardlab/colabfold/colabfold_docker:v0.1.sif"
input_dir="/scratch/group/jbardlab/colabfold/colabfold_databases/poxviridae/pox_db/Poxviridae_expdb"
output_dir="/scratch/group/jbardlab/colabfold/colabfold_databases/poxviridae/pox_db/Poxviridae_expdb/Poxviridae_db_index"
prefix="/input_dir/Poxviridae_db"

singularity exec --nv \
    -B "${input_dir}:/input_dir" \
    -B "${output_dir}:/output_dir"\
    "${image_path}"  \
    /bin/bash -c "mmseqs createindex ${prefix} ${output_dir} --remove-tmp-files 1 --split 1 --index-subset 2"
