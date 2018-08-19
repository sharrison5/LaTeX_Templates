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

###### Colophon
Sam Harrison, 2018, MIT License.
A full version of the license is included in the [LICENSE file](LICENSE).

Written in [Markown (CommonMark)](http://commonmark.org/) using the
[live testing tool](http://try.commonmark.org/).
