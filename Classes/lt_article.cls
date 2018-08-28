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

\ProvidesClass{lt_article}[2018/08/28 Custom article format]

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

%Commands to get header text
%http://stackoverflow.com/questions/2833954/how-do-i-create-a-command-like-title-in-latex
\def\@header{} %Can put a default header in these braces if required
\newcommand{\header}[1]{
  \def\@header{#1}
}

\RequirePackage{fancyhdr}
% Page styles:
%     empty - nowt
%     plain - just page number
%     headings - chapter names etc
%     myheadings - user
%     fancy - as defined for all but plain pages
%     fancyplain - defines a generic and plain style

\pagestyle{fancy} % Use the fancy style
% Set the page style for the style we have selected
\fancyhf{} % clear all header and footer fields
\rhead{\sffamily \textcolor{SteelBlue4}{\@header}}
\cfoot{\thepage}
\setlength{\headheight}{15.2pt}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0pt}

% And redefine the plain style
\fancypagestyle{plain}{
\fancyhf{} % clear all header and footer fields
%\rhead{\sffamily \textcolor{SteelBlue4}{\@header}}
\cfoot{\thepage}
\setlength{\headheight}{15.2pt}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0pt}
}

% }}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
