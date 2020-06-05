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

\ProvidesClass{lt_article}[2020/06/05 Custom article format]

% }}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\LoadClassWithOptions{article}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Prerequisites {{{

\RequirePackage{lt_basics}
\RequirePackage{lt_bib}
\RequirePackage{lt_floats}

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

% }}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Redefine author/thanks commands {{{

% Useful background on \maketitle and \thanks
% https://tex.stackexchange.com/a/452985
% https://tex.stackexchange.com/a/289545

% Useful \if commands
\RequirePackage{ifthen}  % https://tex.stackexchange.com/a/13867
\RequirePackage{etoolbox}
% Command to append the expanded version of a macro to another macro
% Fragile! Second macro must be the first thing that appears
% https://tex.stackexchange.com/a/401230
\newcommand*{\append}[2]{%
    \expandafter\g@addto@macro\expandafter#1\expandafter{#2}%
}

%------------------------------------------------------------------------------
% Redefine \author {{{

% Still works as before i.e. \author{Name1, Name2}
% But can now add affiliations more naturally i.e.
% \author[1,2]{Name1}
% \author[2,3]{Name2}
% Interface inspired by the authblk package
% https://stackoverflow.com/a/7314951
% https://tex.stackexchange.com/a/281515
% https://tex.stackexchange.com/a/317781
\let\lt@firstAuthors\@empty
\let\lt@lastAuthor\@empty
\renewcommand*{\author}[2][\@empty]{%
    % First, add superscript if optional argument provided
    \let\lt@currentAuthor\@empty%
    \ifthenelse{\equal{#1}{\@empty}}{%
        \renewcommand*{\lt@currentAuthor}{#2}%
    }{%
        \renewcommand*{\lt@currentAuthor}{
            #2\textsuperscript{\textcolor{MidText}{#1}}%
        }%
    }%
    % Then add to storage
    \ifthenelse{\equal{\lt@firstAuthors}{\@empty}}{%
        \append{\lt@firstAuthors}{\lt@currentAuthor}%
    }{%
        \ifthenelse{\equal{\lt@lastAuthor}{\@empty}}{%
            \append{\lt@lastAuthor}{\lt@currentAuthor}%
        }{%
            \g@addto@macro{\lt@firstAuthors}{, }%
            \append{\lt@firstAuthors}{\lt@lastAuthor}%
            \let\lt@lastAuthor\@empty%
            \append{\lt@lastAuthor}{\lt@currentAuthor}%
        }%
    }%
}

% Finally, decide how we put the pieces together for printing
\renewcommand*{\@author}{%
    %\show\lt@firstAuthors
    %\show\lt@lastAuthor
    %\show\lt@currentAuthor
    \ifthenelse{\equal{\lt@lastAuthor}{\@empty}}{%
        \lt@firstAuthors%
    }{%
        \lt@firstAuthors\ \& \lt@lastAuthor%
    }%
}

% }}}
%------------------------------------------------------------------------------
% \affiliation and \corresponding {{{

% Store everything provided by \affiliation{}
\let\lt@affiliations\@empty
\newcommand*{\affiliation}[1]{%
    \g@addto@macro{\lt@affiliations}{%
        \protect\stepcounter{footnote}%
        \protect\footnotetext{#1}%
    }
}

% Store corresponding author
\newcommand*{\corrmark}{\dagger}
\newcommand*{\corresponding}[1]{%
    \newcommand*{\lt@corresponding}{#1}%
}

\newcommand*{\printAffiliations}{%
    % Affiliations
    \renewcommand*{\thefootnote}{\alph{footnote}}%
    \renewcommand*{\@makefnmark}{%
        \textsuperscript{\sffamily\textcolor{MidText}{\@thefnmark}}%
    }%
    \lt@affiliations%
    % Corresponding
    \ifdef{\lt@corresponding}{%
        \renewcommand*{\@makefnmark}{%
            \textsuperscript{\sffamily\textcolor{MidText}{\corrmark}}%
        }%
        \protect\footnotetext{\lt@corresponding\smallskip}%
    }{%
    }%
    % Reset everything
    \setcounter{footnote}{0}%
    \renewcommand*{\thefootnote}{\arabic{footnote}}%
    \renewcommand*{\@makefnmark}{%
        \textsuperscript{\@thefnmark}%
    }%
}

% }}}
%------------------------------------------------------------------------------

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
\titleformat*{\section}      {\sffamily \Large \color{AccentColour}}
\titleformat*{\subsection}   {\sffamily \large \color{AccentColour}}
\titleformat*{\subsubsection}{\sffamily \normalsize \itshape}

% Colour figure captions too
\captionsetup{labelfont+={color=AccentColour}}

% }}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Abstract formatting {{{

\if@twocolumn
    \renewenvironment*{abstract}{%
        \begin{adjustwidth}{\parindent}{\parindent}
            \subsection*{Abstract}\vspace{-1ex}
            \sffamily \bfseries
    }{%
        \end{adjustwidth}%
    }
\else
    \renewenvironment*{abstract}{%
        \begin{adjustwidth}{2\parindent}{2\parindent}
            \subsection*{Abstract}\vspace{-1ex}
            \sffamily \small
    }{%
        \end{adjustwidth}%
    }
\fi

% }}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Header & footer formatting {{{

% Commands to get header text, in the same way as e.g. \title{}
% https://stackoverflow.com/q/2833954
% \header{blah} stores blah as the output of \@header{}
\newcommand*{\header}[1]{\renewcommand*{\@header}{#1}}
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
\renewcommand*{\sectionmark}[1]{\markboth{\thesection.~#1}{}}
% This also stops these being uppercase, so we need to fix the bibliography too
\renewcommand*{\abx@MakeMarkcase}[1]{#1}
% https://tex.stackexchange.com/a/432120
% https://github.com/plk/biblatex/issues/627

% Define the main page style
%\fancypagestyle{fancy}{    % This breaks things
    \fancyhf{}  % Clear all header/footer fields
    \rhead{\sffamily \textcolor{AccentColour}{\@header}}
    \lhead{\sffamily \textcolor{LightText}{\leftmark}}
    \renewcommand*{\headrulewidth}{0.75pt}
    \cfoot{\thepage}
%}

% And redefine the plain style for the title page
\fancypagestyle{plain}{
    \fancyhf{}  % Clear all header/footer fields
    \rhead{\sffamily \textcolor{LightText}{\@header}}
    \renewcommand*{\headrulewidth}{0.75pt}
    \cfoot{\thepage}
}

\setlength{\headheight}{1.2\baselineskip}

% }}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
