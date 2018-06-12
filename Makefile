BUILD = build
HTML = html
CHAPTERS = ./markdown/%.md
CSS = css/main.css

all:
	# Generate pdf of markdown notes
	pandoc -o 2015-09-21-hdp-lda-gibbs-sampler.pdf 2015-09-21-hdp-lda-gibbs-sampler.md --verbose

markdown: markdown/dirichlet-distribution-dirichlet-process.md \
		  markdown/sampling-from-a-hierarchical-dirichlet-process.md \
		  markdown/nonparametric-latent-dirichlet-allocation.md


markdown/dirichlet-distribution-dirichlet-process.md:
	jupyter-nbconvert --to html \ --output-dir=$(MARKDOWN_DIR) \
		--output=dirichlet-distribution-dirichlet-process \
	 	2015-07-28-dirichlet-distribution-dirichlet-process.ipynb


markdown/sampling-from-a-hierarchical-dirichlet-process.md:
	jupyter-nbconvert --to markdown --output-dir=$(MARKDOWN_DIR) \
		--output=sampling-from-a-hierarchical-dirichlet-process \
		2015-07-30-sampling-from-a-hierarchical-dirichlet-process.ipynb


markdown/nonparametric-latent-dirichlet-allocation.md:
	jupyter-nbconvert --to markdown --output-dir=$(MARKDOWN_DIR) \
		--output=sampling-from-a-hierarchical-dirichlet-process \
		2015-08-03-nonparametric-latent-dirichlet-allocation.ipynb


html: $(BUILD)/$(HTML)/dirichlet-distribution-dirichlet-process.html \
		  $(BUILD)/$(HTML)/sampling-from-a-hierarchical-dirichlet-process.html \
		  $(BUILD)/$(HTML)/nonparametric-latent-dirichlet-allocation.html


$(BUILD)/$(HTML)/dirichlet-distribution-dirichlet-process.html:
	jupyter-nbconvert --ExecutePreprocessor.timeout=180 --to html \
		--output-dir $(BUILD)/$(HTML) \
		--output dirichlet-distribution-dirichlet-process \
	 	--execute 2015-07-28-dirichlet-distribution-dirichlet-process.ipynb


$(BUILD)/$(HTML)/sampling-from-a-hierarchical-dirichlet-process.html:
	jupyter-nbconvert --ExecutePreprocessor.timeout=180 --to html \
		--output-dir $(BUILD)/$(HTML) \
		--output sampling-from-a-hierarchical-dirichlet-process \
	 	--execute 2015-07-30-sampling-from-a-hierarchical-dirichlet-process.ipynb


$(BUILD)/$(HTML)/nonparametric-latent-dirichlet-allocation.html:
	jupyter-nbconvert --ExecutePreprocessor.timeout=180 --to html \
		--output-dir $(BUILD)/$(HTML) \
		--output nonparametric-latent-dirichlet-allocation \
	 	--execute 2015-08-03-nonparametric-latent-dirichlet-allocation.ipynb

clean:
	rm -r $(BUILD)
	rm -r $(MARKDOWN_DIR)


.PHONY: markdown html
