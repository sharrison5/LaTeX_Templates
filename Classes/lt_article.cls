% lt_article.cls
% Sam Harrison 2018
% MIT License: a full version of the license is included in the LICENSE file.

% For TeXShop, TeXWorks, etc
% !TEX encoding = UTF-8 Unicode
% !TEX spellcheck = en-GB

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Package info {{{

% Requires at least LaTeX version 2e.
\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{lt_article}[2018/09/21 Custom article format]

% }}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\LoadClassWithOptions{article}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Prerequisites {{{

\RequirePackage{lt_basics}
\RequirePackage{lt_bib}

% }}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title formatting {{{

\RequirePackage{titling}

% Move title upwards
\setlength{\droptitle}{-4.0em}

% And apply formatting
% Use adjustwidth to stop title/authors filling all the way to the left
\pretitle{\begin{adjustwidth}{2em}{} \begin{flushright} \sffamily \LARGE}
\posttitle{\end{flushright} \end{adjustwidth} \vspace{1em}}

\preauthor{\begin{adjustwidth}{4em}{} \begin{flushright} \sffamily \large}
\postauthor{\end{flushright} \end{adjustwidth}}

\predate{\begin{adjustwidth}{4em}{} \begin{flushright} \sffamily}
\postdate{\end{flushright} \end{adjustwidth}} % \vspace{1em}}

% And change affiliation symbols to letters
\thanksmarkseries{alph}
\thanksheadextra{\sffamily}{}
\thanksfootextra{\sffamily}{}

% }}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Section heading formatting {{{

% Use sans-serif font for headings
\if@twocolumn
    % And use more compact spacing if in two column mode
    \RequirePackage[sf,compact]{titlesec}
\else
    \RequirePackage[sf]{titlesec}
\fi

% And add some colour
% For defaults (see "Standard Classes" appendix of titlesec manual)
\titleformat*{\section}      {\sffamily \Large \color{SteelBlue4}}
\titleformat*{\subsection}   {\sffamily \large \color{SteelBlue4}}
\titleformat*{\subsubsection}{\sffamily \normalsize}

% }}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Abstract formatting {{{

\RequirePackage[runin]{abstract}

%\renewcommand{\absnamepos}{flushleft}
%\setlength{\abstitleskip}{0.0em}
\AtBeginDocument{\setlength{\abstitleskip}{-\absparindent}}
\renewcommand{\abstractnamefont}{\sffamily \large \color{SteelBlue4}}
\renewcommand{\abstracttextfont}{\sffamily \small}

% }}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Header & footer formatting {{{

% Commands to get header text, in the same way as e.g. \title{}
% https://stackoverflow.com/q/2833954
% \header{blah} stores blah as the output of \@header{}
\newcommand*{\header}[1]{\renewcommand{\@header}{#1}}
\newcommand*{\@header}{}    % Put the default header in these braces if required

\RequirePackage{fancyhdr}
\pagestyle{fancy}   % Use the fancy style (redefined below)
% Default LaTeX page styles:
%     empty      - nowt
%     plain      - just page number, set by maketitle
%     headings   - chapter names etc
%     myheadings - some user customisation possible

% Redefine \sectionmark so that it puts the section info in \leftmark
% Must be after \pagestyle{fancy} so defaults are set
\renewcommand{\sectionmark}[1]{\markboth{\thesection.~#1}{}}
% This also stops these being uppercase, so we need to fix the bibliography too
\renewcommand*{\abx@MakeMarkcase}[1]{#1}
% https://tex.stackexchange.com/a/432120
% https://github.com/plk/biblatex/issues/627

% Define the main page style
%\fancypagestyle{fancy}{    % This breaks things
    \fancyhf{}  % Clear all header/footer fields
    \rhead{\sffamily \textcolor{SteelBlue4}{\@header}}
    \lhead{\sffamily \textcolor{lightgray}{\leftmark}}
    \renewcommand{\headrulewidth}{0.75pt}
    \cfoot{\thepage}
%}

% And redefine the plain style for the title page
\fancypagestyle{plain}{
    \fancyhf{}  % Clear all header/footer fields
    \rhead{\sffamily \textcolor{lightgray}{\@header}}
    \renewcommand{\headrulewidth}{0.75pt}
    \cfoot{\thepage}
}

\setlength{\headheight}{1.2\baselineskip}

% }}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
