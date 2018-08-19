# LaTeX Templates

A collection of LaTeX templates and style files, all meant for use with the
[LuaTeX](http://www.luatex.org/) engine.

LuaTeX is used because of its Unicode and font support (via `fontspec` and
`unicode-math`), and preferred over XeTeX because of the more advanced features
available in the `microtype` package.

To compile the examples:
```
latexmk -lualatex -outdir=Templates/ Templates/Article.tex
```

--------------------
### Installing extra fonts

The default serif font is *GaramondNo8 with expert features* via the
`garamondx` package. The `getnonfreefonts` script can be used to install the
extra fonts which cannot be bundled with TeX Live. To do this use the
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

###### Colophon
Sam Harrison, 2018, MIT License.
A full version of the license is included in the [LICENSE file](LICENSE).

Written in [Markown (CommonMark)](http://commonmark.org/) using the
[live testing tool](http://try.commonmark.org/).
