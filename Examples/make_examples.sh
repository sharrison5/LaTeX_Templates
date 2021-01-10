# make_examples.sh
# Sam Harrison 2021
# MIT License: a full version of the license is included in the LICENSE file.

#------------------------------------------------------------------------------
# Full article

make -f ../Makefile pdf \
    TEXTRAS="-pv" \
    file=Article.tex
make -f ../Makefile clean \
    file=Article.tex

#------------------------------------------------------------------------------
# Minimal article

# `.docx`
make -f ../Makefile docx \
    file=MinimalArticle.tex \
    bibliography=PlaceholderBibliography.bib

# HTML
make -f ../Makefile html \
    file=MinimalArticle.tex
make -f ../Makefile clean \
    file=MinimalArticle.tex
rm  MinimalArticle.4ct MinimalArticle.4tc MinimalArticle.css \
    MinimalArticle.dvi MinimalArticle.html MinimalArticle.idv \
    MinimalArticle.lg MinimalArticle.tmp MinimalArticle.xref

# Plain LaTeX
make -f ../Makefile pdf \
    TEXENGINE="-pdf" TEXTRAS="-pv" \
    file=MinimalArticle.tex
make -f ../Makefile clean \
    file=MinimalArticle.tex

#------------------------------------------------------------------------------
