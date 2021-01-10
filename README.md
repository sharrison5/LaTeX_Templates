# LaTeX Templates

A collection of LaTeX templates and style files, all meant for use with the
[LuaTeX](http://www.luatex.org/) engine.

LuaTeX is used because of its Unicode and font support (via
[`fontspec`](https://ctan.org/pkg/fontspec)
and [`unicode-math`](https://ctan.org/pkg/unicode-math)), and preferred over
XeTeX because of the more advanced features available in the
[`microtype`](https://ctan.org/pkg/microtype) package.

```shell
git clone --recurse-submodules \
    https://github.com/sharrison5/LaTeX_Templates.git

# To use the provided Makefile
make -f LaTeX_Templates/Makefile
make -f LaTeX_Templates/Makefile pdf file=<document.tex>
make -f LaTeX_Templates/Makefile pdf [TEXTRAS="[-g|-gg] [-pv]"] file=<document.tex>
make clean[er] file=<document.tex>

# To compile the examples
cd LateX_Templates/Examples/
./make_examples.sh
```

The simplest way to get started is to copy one of the files from
[`Templates/`](Templates/), or to have a look in [`Examples/`](Examples/).

Note that to use the templates we need to set the `TEXINPUTS` variable so that
the classes and style files can actually be found. This is done automatically
when using `make`. For more information see
[here](https://texfaq.org/FAQ-tempinst) and
[here](https://stackoverflow.com/a/4483042).

--------------------
### Alternative formats

Using a stripped down article format, it is possible to produce either `.docx`
files via [pandoc](https://pandoc.org/) (version >= 2.11, along with
`pandoc-crossref`), or HTML via [TeX4ht](https://tug.org/tex4ht/).

A complete example can be found in
[`Examples/MinimalArticle.tex`](Examples/MinimalArticle.tex).
In short, the simplified preamble should be something like the following:
```tex
\documentclass[a4paper, 11pt]{article}
\usepackage{lt_minimal}
\usepackage{lt_bib}
\usepackage{lt_maths}
\newcommand*{\printAffiliations}{}

% Note \affiliation, \corresponding, and \header should be left unset
% Can only be one instance of \author (as per the original command)
```

It should now be possible to use `make` as per the following:
```shell
make pdf TEXENGINE="-pdf" file=<document.tex>  # latexmk option for pdflatex
make html file=<document.tex>
make docx file=<document.tex> bibliography=<document.bib>
```

--------------------
### Installing extra fonts

The `getnonfreefonts` script can be used to install some extra fonts which
cannot be bundled with TeX Live (e.g. Garamond No. 8). To do this use the
following:
```
# From https://tex.stackexchange.com/a/47504

# Install script
curl -O http://tug.org/fonts/getnonfreefonts/install-getnonfreefonts
sudo texlua install-getnonfreefonts
rm install-getnonfreefonts

# And add fonts
getnonfreefonts --help
sudo getnonfreefonts --sys --lsfonts
sudo getnonfreefonts --sys <font>|--all
```

--------------------
### Compressing generated PDFs

The easiest way to do this is to use [Ghostscript](https://ghostscript.com/).
The command is:
```
gs -sDEVICE=pdfwrite -dPDFSETTINGS=<quality> -o <output.pdf> <input.pdf>
```
Where the `<quality>` setting can be any of `/screen`, `/ebook`, `/printer` or
`/prepress`. The forward slash is important!

For more information see e.g. [here](https://tex.stackexchange.com/a/41273).

--------------------

###### Colophon
Sam Harrison, 2018, MIT License.
A full version of the license is included in the [LICENSE file](LICENSE).

Written in [Markown (CommonMark)](http://commonmark.org/) using the
[live testing tool](http://try.commonmark.org/).
