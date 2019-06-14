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

TEXOPTIONS = -lualatex -bibtex -cd -r LaTeX_Templates/latexmkrc

# Hook for adding extra args at the command line
TEXTRAS ?=

###############################################################################
# Build rules

.DEFAULT_GOAL := help
.PHONY: build clean cleaner help

help:
	@echo "make build [TEXTRAS=\"[-g|-gg] [-pv]\"] file=<document.tex>"
	@echo "make clean[er] file=<document.tex>"

# Make PDFs from .tex files
build:
	latexmk $(TEXOPTIONS) $(TEXTRAS) $(file)

# Clean up
# https://tex.stackexchange.com/a/83384
clean:
	latexmk $(TEXOPTIONS) -c $(file)

cleaner:
	latexmk $(TEXOPTIONS) -C $(file)

###############################################################################
