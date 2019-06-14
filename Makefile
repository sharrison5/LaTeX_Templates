# Makefile
# Sam Harrison 2019
# MIT License: a full version of the license is included in the LICENSE file.

###############################################################################
# Convention used here:
# ${HOME} for imported environment variables
# $(OBJS) for variables defined in this file
###############################################################################

TEXINPUTS := ${PWD}/LaTeX_Templates/StyleFiles:${PWD}/LaTeX_Templates/Classes:${TEXINPUTS}
export TEXINPUTS
# No quotes!
# https://tex.stackexchange.com/a/50721
# https://stackoverflow.com/a/23332194

# Hook for adding extra args at the command line
TEXTRAS ?=

###############################################################################
# Build rules

.DEFAULT_GOAL := help
.PHONY: clean cleaner help

help:
	@echo "make [-B] [TEXTRAS=\"[-g|-gg] [-pv]\"] <document.pdf>"
	@echo "make clean[er] file=<document.tex>"

# Make PDFs from .tex files
# $<: the name of the prerequisite of the rule (a .tex file)
%.pdf: %.tex
	latexmk -lualatex $(TEXTRAS) -cd $<

# Clean up
# https://tex.stackexchange.com/a/83384
clean:
	latexmk -lualatex -bibtex -cd -c $(file)

cleaner:
	latexmk -lualatex -bibtex -cd -C $(file)

###############################################################################
