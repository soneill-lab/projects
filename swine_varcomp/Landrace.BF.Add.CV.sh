for data in 1 2 3 4 5 6 7 8 9 10
do 
# Get PEBV
./mmap --ped pedigree.file --phenotype_filename Landrace_Backfat_Filtered --trait yd --covariate_filename Landrace.IBC.csv --covariates F  --estimate_variance_components --variance_component_filename Landrace.add.grm.bin Landrace.sow.i.bin --subject_set Landrace.BF_T$data.csv --variance_component_label A S --file_suffix Landrace.BF_add.CV$data --num_mkl_threads 20 --num_em_reml_burnin 2 --use_em_ai_reml --single_pedigree --use_dpotrs

done

# Get inbreeding effect
./mmap --ped pedigree.file --phenotype_filename Landrace_Backfat_Filtered --trait yd --covariate_filename Landrace.IBC.csv --covariates F  --estimate_variance_components --variance_component_filename Landrace.add.grm.bin Landrace.sow.i.bin --variance_component_label A S --file_suffix Landrace.BF_add.CV.Adj --num_mkl_threads 20 --num_em_reml_burnin 2 --use_em_ai_reml --single_pedigree --use_dpotrs
