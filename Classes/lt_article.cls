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

\ProvidesClass{lt_article}[2018/08/29 Custom article format]

% }}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\LoadClassWithOptions{article}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Prerequisites {{{

\RequirePackage{lt_basics}

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
% Header & footer formatting {{{

% Commands to get header text, in the same way as e.g. \title{}
% https://stackoverflow.com/q/2833954
% \header{blah} stores blah as the output of \@header{}
\newcommand{\header}[1]{\renewcommand{\@header}{#1}}
\newcommand{\@header}{}   % Put the default header in these braces if required

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

% }}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
