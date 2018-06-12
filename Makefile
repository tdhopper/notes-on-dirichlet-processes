MARKDOWN_DIR=markdown
BUILD = build
BOOKNAME = my-book
TITLE = title.txt
METADATA = metadata.xml
CHAPTERS = ./markdown/%.md
TOC = --toc --toc-depth=2
COVER_IMAGE = images/cover.jpg
LATEX_CLASS = report

all:
	# Generate pdf of markdown notes
	pandoc -o 2015-09-21-hdp-lda-gibbs-sampler.pdf 2015-09-21-hdp-lda-gibbs-sampler.md --verbose

.PHONY: markdown
markdown: markdown/dirichlet-distribution-dirichlet-process.md \
		  markdown/sampling-from-a-hierarchical-dirichlet-process.md \
		  markdown/nonparametric-latent-dirichlet-allocation.md


markdown/dirichlet-distribution-dirichlet-process.md:
	jupyter-nbconvert --to markdown --output-dir=$(MARKDOWN_DIR) \
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

clean:
	rm -r $(BUILD)
	rm -r $(MARKDOWN_DIR)

html: $(BUILD)/html/$(BOOKNAME).html

$(BUILD)/html/$(BOOKNAME).html:
	mkdir -p $(BUILD)/html
	pandoc $(TOC) --standalone --to=html5 -o $@ $(MARKDOWN_DIR)/*.md
	cp -r markdown/* build/html/

.PHONY: markdown book clean html
