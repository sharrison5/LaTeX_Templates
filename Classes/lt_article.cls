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

%\RequirePackage[compact]{titlesec}
\RequirePackage{titlesec}
% For defaults (see "Standard Classes" appendix of titlesec manual)

%Modify the titleformat so sections are printed in blue
%Equivalent format to using \RequirePackage[small]{titlesec}
%\titleformat*{\section}{\sffamily \large \bfseries \color{SteelBlue4}}
\titleformat*{\section}{\sffamily \scshape \Large \color{SteelBlue4}}

%\titleformat*{\subsection}{\sffamily \normalsize \bfseries \color{SteelBlue4}}
\titleformat*{\subsection}{\sffamily \large \color{SteelBlue4}}

%\titleformat*{\subsubsection}{\sffamily \normalsize \bfseries}
\titleformat*{\subsubsection}{\sffamily \normalsize \itshape}

%Change caption spacing slightly
%\addtolength{\belowcaptionskip}{-1em}

% }}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
