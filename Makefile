# Makefile
# Sam Harrison 2019
# MIT License: a full version of the license is included in the LICENSE file.

###############################################################################
# Convention used here:
# ${HOME} for imported environment variables
# $(OBJS) for variables defined in this file
###############################################################################

# Where are we?
# https://stackoverflow.com/a/324782
TEMPLATE_DIR := $(dir $(abspath $(firstword $(MAKEFILE_LIST))))

TEXINPUTS := $(TEMPLATE_DIR)/StyleFiles:$(TEMPLATE_DIR)/Classes:${TEXINPUTS}
export TEXINPUTS
# No quotes!
# https://tex.stackexchange.com/a/50721
# https://stackoverflow.com/a/23332194

TEXENGINE ?= -lualatex
TEXOPTIONS := -bibtex -cd -r $(TEMPLATE_DIR)/latexmkrc

# Hook for adding extra args at the command line
TEXTRAS ?=

###############################################################################
# Build rules

.DEFAULT_GOAL := help
.PHONY: help pdf html docx clean cleaner check-file check-bib

help:
	@echo "make help"
	@echo "make pdf [TEXTRAS=\"[-g|-gg] [-pv]\"] file=<document.tex>"
	@echo "make clean[er] file=<document.tex>"
	@echo "make html file=<document.tex>"
	@echo "make docx file=<document.tex> bibliography=<document.bib>"
	@echo ""
	@echo "TEXINPUTS=\"$(TEXINPUTS)\""

# Make PDFs from .tex files
pdf: check-file
	latexmk $(TEXENGINE) $(TEXOPTIONS) $(TEXTRAS) $(file)

# Make HTML from .tex files via `htlatex`
html: check-file
	make4ht $(TEXTRAS) --format html5 --loglevel info \
	    --build-file $(TEMPLATE_DIR)/build.mk4 \
	    --output-dir $(file:.tex=/) $(file)

# Make Word document from .tex files via `pandoc`
docx: check-file check-bib
	pandoc --to=docx \
	    --filter=pandoc-crossref \
	    --citeproc --bibliography=$(bibliography) \
	    --output=$(file:.tex=.docx) $(file)

# Clean up
# https://tex.stackexchange.com/a/83384
clean: check-file
	latexmk $(TEXENGINE) $(TEXOPTIONS) -c $(file)

cleaner: check-file
	latexmk $(TEXENGINE) $(TEXOPTIONS) -C $(file)

# Test that required variables are set
# https://stackoverflow.com/q/4728810
check-file:
ifndef file
	$(error `file` is undefined)
endif
check-bib:
ifndef bibliography
	$(error `bibliography` is undefined)
endif

###############################################################################
