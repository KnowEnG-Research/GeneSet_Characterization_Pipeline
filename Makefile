MKDIR_P = mkdir -p
RMR = rm -rf
GZIP_D = gzip -d
INPUT_DATA_DIR = ./input_data
RUN_DIR = ./run_dir
RESULTS_DIR = $(RUN_DIR)/results
BENCHMARKS = ./test/benchmarks/
SCRIPT = ./src/geneset_characterization.py


all: decompress_input_data create_run_dir copy_run_files

run_fisher:
	python3 $(SCRIPT) -run_directory $(RUN_DIR) -run_file fisher_run_file.yml 

run_drawer:
	python3 $(SCRIPT) -run_directory $(RUN_DIR) -run_file DRaWR_run_file.yml

decompress_input_data:
	$(GZIP_D) $(INPUT_DATA_DIR)/*
 
create_input_data:
	$(MKDIR_P) $(INPUT_DATA_DIR)	

create_run_dir:
	$(MKDIR_P) $(RESULTS_DIR) 

copy_run_files:
	cp $(BENCHMARKS)/*.yml $(RUN_DIR) 

clean_dir_recursively:
	$(RMR) $(RUN_DIR)


 
