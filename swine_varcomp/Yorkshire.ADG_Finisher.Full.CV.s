for data in 1 2 3 4 5 6 7 8 9 10
do 
# Get PEBV
./mmap --ped pedigree.file --phenotype_filename Yorkshire_ADG_Finisher_Filtered --trait yd --covariate_filename Yorkshire.IBC.csv --covariates F  --estimate_variance_components --variance_component_filename yorkshire.add.grm.bin yorkshire.dom.grm.bin yorkshire.AA.grm.bin yorkshire.AD.grm.bin yorkshire.DD.grm.bin yorkshire.sow.i.bin  --subject_set Yorkshire_ADG_Finisher_T$data.csv --variance_component_label A D AA AD DD S --file_suffix Yorkshire_ADG_Finisher_full.CV$data --num_mkl_threads 20 --num_em_reml_burnin 2 --use_em_ai_reml --single_pedigree --use_dpotrs

done


# Get inbreeding effect
./mmap --ped pedigree.file --phenotype_filename Yorkshire_ADG_Finisher_Filtered --trait yd --covariate_filename Yorkshire.IBC.csv --covariates F  --estimate_variance_components --variance_component_filename  yorkshire.add.grm.bin yorkshire.dom.grm.bin yorkshire.AA.grm.bin yorkshire.AD.grm.bin yorkshire.DD.grm.bin yorkshire.sow.i.bin --variance_component_label A D AA AD DD S --file_suffix Yorkshire.ADG_Finisher_full.CV.Adj --num_mkl_threads 20 --num_em_reml_burnin 2 --use_em_ai_reml --single_pedigree --use_dpotrs



