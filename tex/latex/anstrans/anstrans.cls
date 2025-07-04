%  American Nuclear Society Transaction template
%  by Seth R. Johnson, based on the ANS transaction guidelines
%
% For further updates, see http://reference-man.com/projects.html#anstemplate
%
% Usage: \documentclass{anstrans}
%  Define \title and \author as usual, and also define \institute and \email .
%  For two-column tables, use the table* environment. Multiple authors should
%  look like 
%   {Seth R. Johnson \and Edward W. Larsen}
%
% v1.1.5: Increasing column separation
% v1.1.4: Added disclaimer option (thanks to Aaron Bevill)
% v1.1.3: Improved header behavior
% v1.1.2: Improved spacing for standards compliance
%         now commas separate author names
%         Added support for proper equation numbering in appendices
% v1.1.1: Figure and table captions are now flush with the left as the
%         standards specify. Now uses the ``txfonts'' package for much improved
%         Times-compatible math font.
%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]

\ProvidesClass{anstrans}[2011/06/07 v1.1.4 ANS Transaction class]

%%%%%%%%%%% TYPE AND GEOMETRY %%%%%%%%%%%
\LoadClass[twocolumn,10pt]{article}

\pagestyle{empty}						%no page numbering

\RequirePackage[text={7in,9in},centering,columnsep=18pt]{geometry}

% ams math must be loaded before txfonts
\usepackage{amsmath}
\usepackage[pdftex,dvipsnames]{xcolor,colortbl} %change font color
%\usepackage[hidelinks]{hyperref}
\usepackage{hyperref}
\hypersetup{colorlinks,linkcolor=black,citecolor=black,urlcolor=blue} 
\usepackage[colorinlistoftodos,prependcaption,textsize=tiny,textwidth=15mm]{todonotes} %makes colored boxes for commenting
\usepackage[font=itshape,vskip=5pt]{quoting}

%%%%% colors
%http://latexcolor.com/
%https://en.wikibooks.org/wiki/LaTeX/Colors#:~:text=black%2C%20blue%2C%20brown%2C%20cyan,be%20available%20on%20all%20systems.
\definecolor{aliceblue}{rgb}{0.94, 0.97, 1.0}
\definecolor{antiquewhite}{rgb}{0.98, 0.92, 0.84}
\definecolor{lightmauve}{rgb}{0.86, 0.82, 1.0}
\definecolor{brilliantlavender}{rgb}{0.96, 0.73, 1.0}
\definecolor{brandeisblue}{rgb}{0.0, 0.44, 1.0}
\definecolor{darkmidnightblue}{rgb}{0.0, 0.2, 0.4}
%%%%%%

%%%%%% user added 
\usepackage[capitalise,noabbrev]{cleveref}
\usepackage{nameref}
%\usepackage{parskip}
\usepackage[font=itshape]{quoting}
%%%%%%%

% Use Times for math font and text font.
\RequirePackage[T1]{fontenc}
\RequirePackage{txfonts}
% bold math must be loaded after Times font
\usepackage{bm}

%%%%%%%%%%% INCLUDE PACKAGES %%%%%%%%%%%
\RequirePackage{cuted} % defines 'strip' environment for single column
\RequirePackage{indentfirst}	% indent the leading paragraph

%%%%%%%%%%% REQUIRED VARIABLES %%%%%%%%%%%
\newif\if@institutedefined
\@institutedefinedfalse
\def\@institute{\PackageWarning{anstrans}{No institute has been defined.}}
\newcommand{\institute}[1]{\def\@institute{#1}\@institutedefinedtrue}

\newif\if@emaildefined
\@emaildefinedfalse
\def\@email{\PackageWarning{anstrans}{No email address has been defined.}}
\newcommand{\email}[1]{\def\@email{#1}\@emaildefinedtrue}

\newif\if@disclaimerdefined
\@disclaimerdefinedfalse
\def\@disclaimer{}
\newcommand{\disclaimer}[1]{\def\@disclaimer{#1}\@disclaimerdefinedtrue}

%%%%%%%%%%% PARAGRAPH FORMATTING %%%%%%%%%%%
\setlength{\parindent}{0.25in}

%% For more aesthetically pleasing but looser spacing (more pages),
%% comment these lines:
\AtBeginDocument{\setlength{\baselineskip}{11pt}}
\setlength{\lineskip}{0pt plus 2pt minus 2pt}
\setlength{\parskip}{0pt}

%%%%%%%%%%% SECTIONING %%%%%%%%%%%
\setcounter{secnumdepth}{-2} %hide all section heading numbers

\renewcommand\section{\@startsection
	{section}{1}{0pt}%		%name, level, indent
	{-\baselineskip}%		%beforeskip
	{.75\baselineskip}%		%afterskip
	{\reset@font\bf\MakeUppercase}%
}

\renewcommand\subsection{\@startsection
	{subsection}{1}{0pt}%		%name, level, indent
	{-\baselineskip}%		%beforeskip
	{.71\baselineskip}%		%afterskip
	{\reset@font\bf}%
}

\renewcommand\subsubsection{\@startsection
	{subsubsection}{1}{0pt}%		%name, level, indent
	%{subsubsection}{1}{-\parindent}%		%name, level, indent
	{-.75\baselineskip}%		%beforeskip
	{.5\baselineskip}%		%afterskip
	{\reset@font\itshape}%
}

\renewcommand\paragraph{\@startsection
	{paragraph}{1}{0pt}%		%name, level, indent
	%{subsubsection}{1}{-\parindent}%		%name, level, indent
	{-.25\baselineskip}%		%beforeskip
    {-0.5em}
%	{0.25\baselineskip}%		%afterskip
	{\reset@font\bf\itshape}%
}

\renewcommand\subparagraph{\@startsection
	{subparagraph}{1}{0pt}%		%name, level, indent
	%{subsubsection}{1}{-\parindent}%		%name, level, indent
	{-.25\baselineskip}%		%beforeskip
    {-0.5em}
%	{0.25\baselineskip}%		%afterskip
	{\reset@font\itshape}%
}

\renewcommand{\quote}{\list{}{\rightmargin=\leftmargin\topsep=3pt}\item\relax}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% APPENDIX %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% appendix needs equations labeled A.1 etc., but shouldn't look like 
%   A   MY FIRST APPENDIX
\let\@oldappendix\appendix
\renewcommand\appendix{%
\setcounter{secnumdepth}{-1}%keep section headings
\renewcommand\theequation{\thesection.\arabic{equation}}
\@oldappendix
\renewcommand\section{%
\addtocounter{section}{1}%
\setcounter{equation}{0}%reset equation counter
\@startsection%
	{section}{1}{0pt}%		%name, level, indent
	{-\baselineskip}%		%beforeskip
	{.75\baselineskip}%		%afterskip
	{\reset@font\bf\MakeUppercase}%
}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% BIBLIOGRAPHY %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\@biblabel[1]{#1.} %change from [x] to x.

%% reduce spacing in bibliography; thanks to Jose Carlos Santos.
\let\@oldthebibliography=\thebibliography
\let\@endoldthebibliography=\endthebibliography
\let\@olditemsep=\itemsep
\renewenvironment{thebibliography}[1]{%
	\begin{@oldthebibliography}{#1}%
		\setlength{\itemsep}{-\@olditemsep}%
}%
{%
	\@endoldthebibliography%
	\end{@oldthebibliography}%
}

%%%%%%%%%%% CHANGE TABLE/FIGURE STYLE %%%%%%%%%%%
\renewcommand{\figurename}{Fig.}
\renewcommand{\tablename}{TABLE}

\setlength{\abovecaptionskip}{0.25\baselineskip}
\setlength{\belowcaptionskip}{0.25\baselineskip}
\setlength{\textfloatsep}{0.5\baselineskip}
\setlength{\intextsep}{0.5\baselineskip}

\renewcommand{\bottomfraction}{0.9}
\renewcommand{\topfraction}{0.9}

% captions should be flush with the left and use a stop instead of a colon
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  {#1. #2\par}
  \vskip\belowcaptionskip}

% tables use roman numerals
\renewcommand\thetable{\@Roman\c@table}

%%%% Title section
\setlength{\stripsep}{0pt}
\renewcommand{\maketitle}{%
  \begin{strip}%
    \centering%
      %title
      {\bf \@title\if@disclaimerdefined{\footnotemark[1]{}}\fi}
      \vspace{.75\baselineskip}%

      %author
      {\def\and{\!, } \@author}%
      \vspace{.75\baselineskip}%

      %institute (optional?)
      \if@institutedefined%
        {\let\and\par \itshape \@institute}% 
      \fi%

      %email
      \if@emaildefined%
        {\def\and{\!, } \itshape \@email}%
      \fi%
      \vspace{\baselineskip}%

  \end{strip}%

  %disclaimer
  \if@disclaimerdefined%
  {\footnotetext[1]{\footnotesize \@disclaimer}}%
  \fi
}

\AtBeginDocument{%
  \maketitle%
}

