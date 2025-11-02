%%
%% This is file `zfn.cls'.
%%
%% --------------------------------------------------------------------
%% zfn --- Support for submissions to Philosophical Problems in Science
%% Email: info@zfn.edu.pl
%% Based on cup-journal class.
%% Released under the LaTeX Project Public License v1.3c or later
%% See http://www.latex-project.org/lppl.txt
%% -------------------------------------------------------------------- 
%% 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zfn}
  [2025/03/21 v1.0 Submission to ZFN]
  
% Load the base class
\LoadClass[9pt,letter,twoside]{article}

\RequirePackage{setspace}
\AtBeginDocument{%
  \setstretch{1.05} % Adjust the factor as needed
}

%-------------------------------
% Sectioning commands and styling
%-------------------------------

\renewcommand\section{\@startsection {section}{1}{\z@}%
  {-3.5ex \@plus -1ex \@minus -.2ex}%
  {0.2ex \@plus.2ex}%
  {\sffamily\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {0.2ex \@plus .2ex}%
  {\sffamily\bfseries\itshape}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {0.2ex \@plus .2ex}%
  {\sffamily\itshape}} 
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
  {3.25ex \@plus1ex \@minus.2ex}%
  {-1em}%
  {\sffamily}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
  {3.25ex \@plus1ex \@minus .2ex}%
  {-1em}%
  {\sffamily}}
\def\@hangfrom#1{\setbox\@tempboxa\hbox{{#1}}%
  \hangindent 0pt%\wd\@tempboxa
  \noindent\box\@tempboxa}
  
\raggedbottom

%-------------------------------
% Required packages and settings
%-------------------------------
\RequirePackage{lastpage} % For getting the last page in the first page header
\RequirePackage{enumitem} % For list styling
\setlist{noitemsep,leftmargin=\parindent}
\RequirePackage[online]{threeparttable} % For table notes
\let\TPTnoteSettingsOrig\TPTnoteSettings
\def\TPTnoteSettings{\TPTnoteSettingsOrig\scriptsize}
\RequirePackage{endnotes}
\newcommand*{\printendnotes}{%
  \def\enoteformat{\rightskip=0pt \leftskip=0pt \parindent=0pt \makeenmark}
  \def\makeenmark{\bgroup\bfseries\theenmark\enspace\egroup}
  \theendnotes
}
%%
\newcommand*\zfn@warning{\ClassWarning{zfn}}
\newcommand*\zfn@ifundefined[1]{%
  \begingroup\expandafter\expandafter\expandafter\endgroup
  \expandafter\ifx\csname #1\endcsname\relax
    \expandafter\@firstoftwo
  \else
    \expandafter\@secondoftwo
  \fi
}

%-------------------------------
% Key–value option definitions
%-------------------------------
\RequirePackage{xkeyval}
\newcommand*\zfn@keyval@bool[2]{%
  \zfn@ifundefined{zfn@#1#2}{%
    \zfn@warning{Unknown option `#2' for key #1}%
  }{%
    \@nameuse{zfn@#1#2}%
  }%
}
\newif\ifzfn@abbreviations
\newif\ifzfn@jel
\newif\ifzfn@msc
\newif\ifzfn@dates
\newif\ifzfn@copyright
\newif\ifzfn@articletitle
\newif\ifzfn@chaptertitle
\newif\ifzfn@email
\newif\ifzfn@hyperref
\newif\ifzfn@keywords
\newif\ifzfn@super
\newif\ifzfn@simfonts
\define@key{zfn}{abbreviations}[true]{%
  \zfn@keyval@bool{abbreviations}{#1}%
}
\define@key{zfn}{jel}[true]{%
  \zfn@keyval@bool{jel}{#1}%
}
\define@key{zfn}{msc}[true]{%
  \zfn@keyval@bool{msc}{#1}%
}
\define@key{zfn}{suppmat}[true]{%
  \zfn@keyval@bool{suppmat}{#1}%
}
\define@key{zfn}{suppdata}[true]{%
  \zfn@keyval@bool{suppdata}{#1}%
}
\define@key{zfn}{orcid}[true]{%
  \zfn@keyval@bool{orcid}{#1}%
}
\define@key{zfn}{ack}[true]{%
  \zfn@keyval@bool{ack}{#1}%
}
\define@key{zfn}{contrib}[true]{%
  \zfn@keyval@bool{contrib}{#1}%
}
\define@key{zfn}{financial}[true]{%
  \zfn@keyval@bool{financial}{#1}%
}
\define@key{zfn}{conflicts}[true]{%
  \zfn@keyval@bool{conflicts}{#1}%
}
\define@key{zfn}{ethics}[true]{%
  \zfn@keyval@bool{ethics}{#1}%
}
\define@key{zfn}{dates}[true]{%
  \zfn@keyval@bool{dates}{#1}%
}
\define@key{zfn}{copyright}[true]{%
  \zfn@keyval@bool{copyright}{#1}%
}
\define@key{zfn}{articletitle}[true]{%
  \zfn@keyval@bool{articletitle}{#1}%
}
\define@key{zfn}{chaptertitle}[true]{%
  \zfn@keyval@bool{chaptertitle}{#1}%
}
\define@key{zfn}{email}[true]{%
  \zfn@keyval@bool{email}{#1}%
}
\define@key{zfn}{hyperref}[true]{%
  \zfn@keyval@bool{hyperref}{#1}%
}
\define@key{zfn}{keywords}[true]{%
  \zfn@keyval@bool{keywords}{#1}%
}
\define@key{zfn}{super}[true]{%
  \zfn@keyval@bool{super}{#1}%
}
\define@key{zfn}{usetitle}[true]{%
  \zfn@keyval@bool{articletitle}{#1}%
}
\define@key{zfn}{simfonts}[true]{%
  \zfn@keyval@bool{simfonts}{#1}%
}
\newcommand*\zfn@journal{zfn}
\newcommand*\zfn@doi{\zfn@warning{No DOI provided}}
\newcommand*\zfn@layout{traditional}
\newcommand*\zfn@manuscript{article}
\newcommand*\zfn@year{\zfn@warning{No year provided}}
\newcommand*\zfn@vol{\zfn@warning{No volume provided}}
\newcommand*\zfn@maxauthors{15}
\define@key{zfn}{journal}{%
  \def\zfn@journal{#1}%
}
\define@key{zfn}{layout}{%
  \def\zfn@layout{#1}%
}
\define@key{zfn}{manuscript}{%
  \AtBeginDocument{\def\zfn@manuscript{#1}}%
}
\define@key{zfn}{year}{%
  \def\zfn@year{#1}%
}
\define@key{zfn}{volume}{%
  \def\zfn@vol{#1}%
}
\define@key{zfn}{doi}{%
  \def\zfn@doi{#1}%
}
\define@key{zfn}{recvd}{%
  \def\zfn@recvd{#1}%
}
\define@key{zfn}{revd}{%
  \def\zfn@revd{#1}%
}
\define@key{zfn}{accptd}{%
  \def\zfn@accptd{#1}%
}
\define@key{zfn}{publd}{%
  \def\zfn@publd{#1}%
}
\ProcessOptionsX*<zfn>
\newcommand*\zfn@manuscript@communication{communication}
\newcommand*\zfn@manuscript@letter{letter}
\newcommand*\zfn@manuscript@note{note}
\newcommand*\zfn@manuscript@review{review}
\newcommand*\zfn@manuscript@suppinfo{suppinfo}
\setkeys{zfn}{
  articletitle,
  super,
%   dates,
   copyright,
  abbreviations,
  jel,
  msc,
  keywords,
  simfonts
}
% Approximations of commercial fonts:
\newcommand{\simfonts}{%
  \RequirePackage[scaled=0.97]{fbb}
  \RequirePackage{sourcesanspro}
  \RequirePackage{sansmath}
  \RequirePackage[italic,eulergreek]{mathastext}
}
\RequirePackage{geometry}
\RequirePackage{changepage}
\RequirePackage{stringstrings}
\RequirePackage[absolute]{textpos}
\RequirePackage[table,svgnames]{xcolor}
\RequirePackage{
  caption,
  floatrow,
  graphicx,
  url,
  hyperref,
  mdframed,
  mfirstuc,
%   footmisc,
  alphalph
}
\urlstyle{same}
\hypersetup{
	colorlinks=true,
	linkcolor=black,
	citecolor=black,
	urlcolor=black,
	breaklinks=true,
	linktocpage
}
\captionsetup{
  font={
    footnotesize,
    sf,
%    sansmath
  },
  labelfont=bf,
  labelsep=period,
}
\floatsetup{
  font={
    sf,
%    sansmath,
    footnotesize,
  },
  captionskip=2pt
}
%\floatsetup[table]{%
%  position=above,   % Caption above the table
%  captionskip=1pt  % Set space between the table and its caption
%}
%\floatsetup[figure]{%
%  position=below,   % Caption below the figure
%  captionskip=2pt  % Set space between the figure and its caption
%}
\colorlet{structure@color}{black}
\def\@seccntformat#1{\@ifundefined{#1@cntformat}%
   {\csname the#1\endcsname\quad}%  default
   {\csname #1@cntformat\endcsname}% individual control
   }
   \def\section@cntformat{\thesection.\quad}
\renewcommand\appendix{\par
  \setcounter{section}{0}
  \setcounter{subsection}{0}
  \gdef\thesection{Appendix \@arabic\c@section}
}
\newmdenv[backgroundcolor=structure@color!15,hidealllines=true,leftmargin=3mm,rightmargin=3mm,innertopmargin=2mm,innerbottommargin=3mm,frametitle={\abstractfont\sffamily Abstract},frametitleaboveskip=3mm,frametitlebelowskip=0mm]{zfn@abstract@box}
\let\abstract@org\abstract
\def\abstract{\zfn@abstract@box\small}
\def\endabstract{\endzfn@abstract@box}
\ifzfn@hyperref
  \expandafter\RequirePackage
\else
  \expandafter\@gobble
\fi
  {hyperref}
\renewcommand*{\title}[2][]{%
  \gdef\zfn@title@short{#1}%
  \gdef\@title{#2}%
  \ifx\zfn@title@short\@empty
    \global\let\zfn@title@short\@title
  \fi
}
\newcommand{\zfn@headtitle}{%
  \ifx\zfn@title@short\@empty
    \@title
  \else
    \zfn@title@short
  \fi
}
\newcommand{\zfn@headauthors}{%
  \ifcase\zfn@author@cnt
    % Case 0: No authors
    \zfn@warning{No authors provided!}%
  \or
    % Case 1: Exactly one author
    \@nameuse{@author@\@roman1}%
  \or
    % Case 2: Exactly two authors
    \@nameuse{@author@\@roman1} \space\&\space
    \@nameuse{@author@\@roman2}%
  \else
    % Case 3 or more: first author et al.
    \@nameuse{@author@\@roman1}\space\zfn@etal
  \fi
}
\@onlypreamble\title
\newcount\zfn@author@cnt
\newcount\zfn@affil@cnt
\newcount\zfn@affil@alt@cnt
\newcount\zfn@footnote@cnt
\newcount\zfn@affil@marker@cnt
\def\author#1{%
  \global\advance\zfn@author@cnt\@ne\relax
  \expandafter\gdef\csname @author@\@roman\zfn@author@cnt\endcsname{#1}%
  \begingroup
    \advance\zfn@affil@cnt\@ne
    \expandafter\xdef\csname @author@affil@\@roman
      \zfn@author@cnt\endcsname
      {\the\zfn@affil@cnt}%
  \endgroup
}
\@onlypreamble\author
\def\and{%
  \zfn@warning{%
    \string\and\space not used by the zfn class: please see
    the\MessageBreak package documentation for details%
  }%
}
\def\thanks{%
  \zfn@warning{%
    \string\thanks\space not used by the zfn class: please see
    the\MessageBreak the package documentation for details%
  }%
}
\newcommand*\affiliation[2][\relax]{%
  \ifnum\zfn@author@cnt>\z@\relax
    \zfn@affil@ifdup{#2}{%
      \zfn@affil@swap{#2}%
    }{%
      \global\advance\zfn@affil@cnt\@ne\relax
      \expandafter\gdef\csname @address@\@roman\zfn@affil@cnt\endcsname
        {#2}%
      \ifx\relax#1\relax
        \expandafter\gdef\csname @affil@\@roman\zfn@affil@cnt\endcsname
          {#2}%
      \else
        \expandafter\gdef\csname @affil@\@roman\zfn@affil@cnt\endcsname
          {#1}%
      \fi
    }%
  \else
    \zfn@warning{Affiliation with no author}%
  \fi
}
\@onlypreamble\affiliation
\newcommand*\zfn@affil@ifdup[1]{%
  \begingroup
    \def\@tempa{#1}%
    \@tempswafalse
    \@tempcnta\z@\relax
    \zfn@affil@ifdup@aux
    \if@tempswa
      \aftergroup\@firstoftwo
    \else
      \aftergroup\@secondoftwo
    \fi
  \endgroup
}
\newcommand*\zfn@affil@ifdup@aux{%
  \advance\@tempcnta\@ne\relax
  \expandafter\expandafter\expandafter\def\expandafter\expandafter
    \expandafter\@tempb\expandafter\expandafter\expandafter
    {\csname @address@\@roman\@tempcnta\endcsname}%
  \ifx\@tempa\@tempb
    \expandafter\@tempswatrue
  \else
    \ifnum\@tempcnta<\zfn@affil@cnt\relax
      \expandafter\expandafter\expandafter\zfn@affil@ifdup@aux
    \fi
  \fi
}
\newcommand*\zfn@affil@swap[1]{%
  \begingroup
    \def\@tempa{#1}%
    \@tempcnta\z@\relax
    \@tempcntb\z@\relax
    \zfn@affil@ifdup@aux
    \advance\zfn@affil@cnt\@ne\relax
    \zfn@affil@swap@aux
  \endgroup
}
\newcommand*\zfn@affil@swap@aux{%
  \advance\@tempcntb\@ne\relax
  \expandafter\ifnum\csname @author@affil@\@roman\@tempcntb\endcsname
    = \zfn@affil@cnt\relax
    \expandafter\xdef\csname @author@affil@\@roman\@tempcntb\endcsname{%
      \the\@tempcnta
    }%
  \fi
  \ifnum\@tempcntb<\zfn@author@cnt\relax
    \expandafter\zfn@affil@swap@aux
  \fi
}
\newcommand*\alsoaffiliation[2][\relax]{%
  \ifnum\zfn@author@cnt>\z@\relax
    \zfn@affil@ifdup{#2}{%
      \zfn@alsoaffil@find{#2}%
    }{%
      \global\advance\zfn@affil@cnt\@ne\relax
      \@tempcnta\zfn@affil@cnt\relax
      \expandafter\gdef\csname @address@\@roman\zfn@affil@cnt\endcsname
        {#2}%
      \ifx\relax#1\relax
        \expandafter\gdef\csname @affil@\@roman\zfn@affil@cnt\endcsname
          {#2}%
      \else
        \expandafter\gdef\csname @affil@\@roman\zfn@affil@cnt\endcsname
          {#1}%
      \fi
    }%
    \@ifundefined{@author@alsoaffil@\@roman\zfn@author@cnt}{%
      \expandafter\xdef\csname @author@alsoaffil@\@roman\zfn@author@cnt
        \endcsname{\the\@tempcnta}%
    }{%
      \expandafter\xdef\csname @author@alsoaffil@\@roman\zfn@author@cnt
        \endcsname{%
        \csname @author@alsoaffil@\@roman\zfn@author@cnt\endcsname
        ,\the\@tempcnta
      }%
    }%
  \else
    \zfn@warning{Affiliation with no author}%
  \fi
}
\newcommand*\zfn@alsoaffil@find[1]{%
  \begingroup
    \def\@tempa{#1}%
    \@tempcnta\z@\relax
    \@tempcntb\z@\relax
    \zfn@affil@ifdup@aux
  \expandafter\endgroup
  \expandafter\@tempcnta\the\@tempcnta\relax
}
\newcommand*\altaffiliation[1]{%
  \ifnum\zfn@author@cnt>\z@\relax
    \begingroup
      \zfn@altaffil@ifdup{#1}{%
        \expandafter\xdef\csname @author@altaffil@\\zfn@author@cnt
          \endcsname{\the\@tempcnta}%
      }{%
        \global\advance\zfn@affil@alt@cnt\@ne\relax
        \expandafter\gdef\csname @altaffil@\\zfn@affil@alt@cnt
          \endcsname{#1}%
        \expandafter\xdef\csname @author@altaffil@\@roman\zfn@author@cnt
          \endcsname{\the\zfn@affil@alt@cnt}%
      }%
    \endgroup
  \else
    \zfn@warning{Affiliation with no author}%
  \fi
}
\@onlypreamble\altaffiliation
\newcommand*\zfn@altaffil@ifdup[1]{%
  \def\@tempa{#1}%
  \@tempswafalse
  \@tempcnta\z@\relax
  \ifnum\zfn@affil@alt@cnt>\z@\relax
    \expandafter\zfn@altaffil@ifdup@aux
  \fi
  \if@tempswa
    \expandafter\@firstoftwo
  \else
    \expandafter\@secondoftwo
  \fi
}
\newcommand*\zfn@altaffil@ifdup@aux{%
  \advance\@tempcnta\@ne\relax
  \expandafter\expandafter\expandafter\def\expandafter\expandafter
    \expandafter\@tempb\expandafter\expandafter\expandafter
    {\csname @altaffil@\@roman\@tempcnta\endcsname}%
  \ifx\@tempa\@tempb
    \expandafter\@tempswatrue
  \else
    \ifnum\@tempcnta<\zfn@affil@alt@cnt\relax
      \expandafter\expandafter\expandafter\zfn@altaffil@ifdup@aux
    \fi
  \fi
}
\newcommand*\email[2][]{%
  \ifnum\zfn@author@cnt>\z@\relax
    \zfn@emailtrue%
    \expandafter\gdef\csname @emailname@\@roman\zfn@author@cnt\endcsname
      {#1}%
    \expandafter\gdef\csname @email@\@roman\zfn@author@cnt\endcsname
      {#2}%
  \else
    \zfn@warning{E-mail with no author}%
  \fi
}
\@onlypreamble\email
\newcommand*\fax[1]{%
  \ifnum\zfn@author@cnt>\z@\relax
    \expandafter\gdef\csname @fax@\@roman\zfn@author@cnt\endcsname
      {#1}%
  \else
    \zfn@warning{Fax number with no author}%
  \fi
}
\@onlypreamble\fax
\newcommand*\phone[1]{%
  \ifnum\zfn@author@cnt>\z@\relax
    \expandafter\gdef\csname @phone@\@roman\zfn@author@cnt\endcsname
      {#1}%
  \else
    \zfn@warning{Phone number with no author}%
  \fi
}
\@onlypreamble\phone
\newcommand*\abbreviations[1]{%
  \gdef\@abbreviations{#1}%
}
\newcommand*\@abbreviations{}
\@onlypreamble\abbreviations
\newcommand*\keywords[1]{%
  \gdef\@keywords{#1}%
}
\newcommand*\@keywords{}
\@onlypreamble\keywords
\newcommand*\zfn@abbreviations@print{%
  \ifx\@abbreviations\@empty\else
    {\noindent\bfseries Abbreviations: }
    \@abbreviations
    \par
  \fi
}
\newcommand*\jel[1]{%
  \gdef\@jel{#1}%
}
\newcommand*\@jel{}
\@onlypreamble\jel
\newcommand*\zfn@jel@print{%
  \ifx\@jel\@empty\else
    {\noindent\bfseries JEL classification: }
    \@jel
    \par
  \fi
}
\newcommand*\msc[1]{%
  \gdef\@msc{#1}%
}
\newcommand*\@msc{}
\@onlypreamble\msc
\newcommand*\zfn@msc@print{%
  \ifx\@msc\@empty\else
    {\noindent\bfseries MSC Codes: }
    \@msc
    \par
  \fi
}
\newcommand*\zfn@keywords@print{%
  \ifx\@keywords\@empty\else
    {\noindent\bfseries Keywords: }
    \@keywords
    \par
  \fi
}
\newcommand*\doi[1]{\gdef\zfn@doi{#1}}
\@onlypreamble\doi
\newcommand*\received[1] {\gdef\zfn@recvd{#1}}
\newcommand*\revised[1]  {\gdef\zfn@revd{#1}}
\newcommand*\accepted[1] {\gdef\zfn@accptd{#1}}
\newcommand*\published[1]{\gdef\zfn@publd{#1}}
\newlength\zfn@space@pre@title
\setlength\zfn@space@pre@title{1.2em}
\newlength\zfn@space@post@title
\setlength\zfn@space@post@title{1em}
\newlength\zfn@space@post@author
\setlength\zfn@space@post@author{0.5em}
\newlength\zfn@space@post@address
\setlength\zfn@space@post@address{0pt}
\newlength\zfn@space@post@email
\setlength\zfn@space@post@email{0.5em}
\newlength\zfn@space@post@date
\setlength\zfn@space@post@date{0.3em}
\newlength\zfn@space@inter@extra
\setlength\zfn@space@inter@extra{0.3em}
\newlength\zfn@maketitle@width
\setlength\zfn@maketitle@width{\textwidth}
\newcommand*\affilsize{\footnotesize}
\newcommand*\authorsize{\normalsize}
\newcommand*\emailsize{\footnotesize}
\newcommand*\titlesize{\LARGE}
\newcommand*\datesize{\footnotesize}
\newcommand*\firstheadsize{\scriptsize}
\newcommand*\polishtitlesize{\tiny}
\newcommand*\affilfont{\footnotesize}
\newcommand*\authorfont{}
\newcommand*\emailfont{\footnotesize}
\newcommand*\emailsymbol{*}
\newcommand*\titlefont{\sffamily\bfseries\raggedright\color{structure@color}}
\newcommand*\datefont{\footnotesize}
\newcommand*\extrasfont{\footnotesize}
\newcommand*\abstractfont{\small}
\newcommand*\journalnamefont{\itshape}
\newcommand*\volumefont{\bfseries}
\newcommand*\zfn@etal{\emph{et al.}}

%% --------------
%% Running header
%% --------------
\def\ps@plain{%
  \renewcommand{\@oddhead}{%
    \hfill {\journalnamefont\zfn@headtitle} \qquad \thepage
  }%
  \renewcommand{\@evenhead}{%
    \thepage \qquad \zfn@headauthors \hfill
  }%
  \renewcommand{\@evenfoot}{}%
  \renewcommand{\@oddfoot}{\@evenfoot}%
}

\pagestyle{plain}
\newcommand*\zfn@dynamic@copyright{%
  \begingroup
  \scriptsize
  % Use \zfn@year (already defined) as the year string
  \def\yeartext{\zfn@year}%
  \ifcase\zfn@author@cnt
    % Case 0: No authors – warn user
    \zfn@warning{No authors provided!}%
  \or
    % Case 1: Exactly one author:
    % (Foundation & First Author Year)
    \textcopyright\ 
    Copernicus Center Foundation\space\&\space
    \@nameuse{@author@\@roman1}\space\yeartext%
  \or
    % Case 2: Exactly two authors:
    % (Foundation, First Author & Second Author Year)
    \textcopyright\ 
    Copernicus Center Foundation,\space
    \@nameuse{@author@\@roman1}\space\&\space
    \@nameuse{@author@\@roman2}\space\yeartext%
  \else
    % Case 3 or more: (Foundation & First Author et al Year)
    \textcopyright\ 
    Copernicus Center Foundation\space\&\space
    \@nameuse{@author@\@roman1}\space et al\space\yeartext%
  \fi
  \endgroup
}
\newcommand*\zfn@copyright@notice{\scriptsize%
    This is an open access article distributed under the terms of the CC-BY-NC-ND 4.0 license.\\
  \zfn@dynamic@copyright.
}
\def\@maketitle{%
  \setlength\parindent{\z@}
  \ifnum\zfn@author@cnt<\z@\relax
    \zfn@warning{No authors defined: At least one author is required}%
  \fi
  \newpage\vspace*{\dimexpr-\headsep-\headheight\relax}
    \noindent
    \begin{minipage}[t]{\dimexpr\textwidth-28mm\relax}
      \vspace{0pt}% Force top alignment from first line
      {\firstheadsize{\journalnamefont\zfn@journal@name} 
      (\zfn@year), {\volumefont\zfn@vol}, \thepage--\pageref{LastPage}\\
      \polishtitlesize{(\zfn@journal@polishname)}
      \par\firstheadsize{doi:\href{https://doi.org/\zfn@doi}{\zfn@doi}}}
      \vspace{7pt}%
      \par {\sffamily\bfseries\color{structure@color}\MakeUppercase{\convertchar{\zfn@manuscript}{-}{ }}\par}
    \end{minipage}%
    \begin{minipage}[t]{28mm}
      \vspace{0pt}
      \includegraphics[width=28mm]{ZFN_transparent}
    \end{minipage}
    \par
%  \parbox[b]{\dimexpr\textwidth-36mm\relax}{%
%    \firstheadsize{\journalnamefont\zfn@journal@name} 
%    (\zfn@year), {\volumefont\zfn@vol}, \thepage--\pageref{LastPage}
%    \par doi:{\zfn@doi}
%    }\hfill\includegraphics[width=36mm]{ZFN_ENG_waskie}\par
%  \vspace*{\baselineskip}  
  \vspace*{\zfn@space@pre@title}%
        {%
          \titlefont
          \titlesize
          \let\@fnsymbol\zfn@author@fnsymbol
          \let\footnote@org\footnote
          \let\footnote\zfn@title@footnote
          \zfn@maketitle@suppinfo \@title
          \zfn@title@footnote@check
          \global\zfn@footnote@cnt\c@footnote
          \@maketitle@title@hook
          \par
        }%
        \vspace*{\zfn@space@post@title}%
        {%
          \authorsize
          \authorfont
          \frenchspacing
          \zfn@author@list
          \par
        }%
        \vspace*{\zfn@space@post@author}%
        {%
          \affilsize
          \affilfont
          \zfn@address@list
          \par
        }%
        \vspace*{\zfn@space@post@address}%
        {%
          \emailsize
          \emailfont
          \ifzfn@email
            \expandafter\zfn@contact@details
            \par
            \vspace*{\zfn@space@post@email}%
          \fi
        }%
        {%
          \datesize
          \datefont
          \ifzfn@dates
            (Received \zfn@recvd; revised \zfn@revd; accepted \zfn@accptd)%; first published online \zfn@publd)
            \vspace*{\zfn@space@post@date}%
          \fi
          \ifzfn@copyright
            \bgroup\let\thefootnote\relax
            \footnote{\hskip -1.9em
            \noindent\zfn@copyright@notice}
            \egroup
          \fi
        }%
}
\newcommand*\@maketitle@title@hook{}
\newcommand*\zfn@maketitle@suppinfo{%
  \ifx\zfn@manuscript\zfn@manuscript@suppinfo
    Supporting Information:\\
  \fi
}
\newcommand*\zfn@title@footnote[1]{%
  \footnotemark
  \g@addto@macro\@thanks{\footnotetext{#1}}%
}
\newcommand\zfn@title@footnote@check{%
  \ifx\@thanks\@empty
  \else
    \begingroup
      \toks@=\expandafter{\@thanks}%
      \xdef\@thanks{%
        \begingroup
          \let\noexpand\@fnsymbol\noexpand\zfn@author@fnsymbol
          \the\toks@
        \endgroup
      }%
    \endgroup
  \fi
}

\newcommand*\zfn@contact@details{%
  \ifnum\zfn@author@cnt=1
    Email: \zfn@email@list
  \else
    {\emailsymbol{}Corresponding author. Email: \zfn@email@list}%
    \zfn@number@list
  \fi
}

\let\@thanks\@empty
\newcommand*\zfn@author@list{%
  \@tempcnta\z@\relax
  \ifnum\zfn@author@cnt=\z@\relax\else
    \expandafter\zfn@author@list@main
  \fi
}
\newcommand*\zfn@author@footnotes{}
\newcommand*\zfn@author@list@main{%
  \advance\@tempcnta\@ne\relax
  \def\zfn@author@footnotes{}%
  \zfn@author@list@and
  \space
  \@nameuse{@author@\@roman\@tempcnta}%
  \zfn@author@list@comma
  \zfn@author@star
  \zfn@author@affil
  \zfn@author@affil@also
  \zfn@author@affil@alt
  \ifx\@empty\zfn@author@footnotes\else
    \textsuperscript{\zfn@author@footnotes}%
  \fi
  \ifnum\@tempcnta<\zfn@author@cnt\relax
    \expandafter\zfn@author@list@main
  \fi
}
\newcommand*\zfn@author@list@and{%
  \ifnum\zfn@author@cnt=\@ne\relax\else
    \ifnum\@tempcnta=\zfn@author@cnt\relax
      \space and%
    \fi
  \fi
}
\newcommand*\zfn@author@list@comma{%
  \ifnum\zfn@author@cnt>\tw@\relax
    \ifnum\@tempcnta<\zfn@author@cnt\relax
      ,%
    \fi
  \fi
}
\newcommand*\zfn@author@star{%
  \zfn@ifundefined{@email@\@roman\@tempcnta}{}{%
    \zfn@author@star@aux
  }%
}

\newcommand*\zfn@author@star@aux{%
  \ifnum\zfn@author@cnt=1
    % Do nothing for a single author
  \else
    \protected@edef\zfn@author@footnotes{%
      \emailsymbol%
      \ifnum\zfn@affil@cnt>\@ne\relax
        % (if needed, add a comma here)
      \else
        \ifnum\zfn@affil@alt@cnt>\z@\relax
          % (or here)
        \fi
      \fi
    }%
  \fi
}

\newcommand*\zfn@author@affil{%
  \zfn@ifundefined{%
    @affil@\@roman\csname @author@affil@\@roman\@tempcnta\endcsname
  }{%
    \zfn@warning{%
      No affiliation given for author\MessageBreak
      \@nameuse{@author@\@roman\@tempcnta}%
    }%
  }{%
    \zfn@author@affil@aux
  }%
}
\newcommand*\zfn@author@affil@aux{%
  \ifnum\zfn@affil@cnt>\@ne\relax
    \expandafter\zfn@affil@marker@cnt\csname @author@affil@\@roman
      \@tempcnta\endcsname\relax
    \advance\zfn@affil@marker@cnt\zfn@footnote@cnt\relax
    \protected@edef\zfn@author@footnotes{%
      \zfn@author@footnotes
      \zfn@author@fnsymbol{\zfn@affil@marker@cnt}%
    }%
  \else
    \ifnum\zfn@affil@alt@cnt>\z@\relax
      \zfn@affil@marker@cnt\@ne\relax
      \advance\zfn@affil@marker@cnt\zfn@footnote@cnt\relax
      \protected@edef\zfn@author@footnotes{%
        \zfn@author@footnotes
        \zfn@author@fnsymbol{\zfn@affil@marker@cnt}%
      }%
    \fi
  \fi
}
\newcommand*\zfn@author@affil@also{%
  \zfn@ifundefined{@author@alsoaffil@\@roman\@tempcnta}{}{%
    \zfn@author@affil@also@aux
  }%
}
\newcommand*\zfn@author@affil@also@aux{%
  \expandafter\@for\expandafter\@tempa\expandafter:\expandafter
    =\csname @author@alsoaffil@\@roman\@tempcnta\endcsname\do{%
    \zfn@affil@marker@cnt\@tempa\relax
    \advance\zfn@affil@marker@cnt\zfn@footnote@cnt\relax
    \protected@edef\zfn@author@footnotes{%
      \zfn@author@footnotes
      %,%
      \zfn@author@fnsymbol{\zfn@affil@marker@cnt}%
    }%
  }%
}
\newcommand*\zfn@author@affil@alt{%
  \zfn@ifundefined{@author@altaffil@\@roman\@tempcnta}{}{%
    \zfn@author@affil@alt@aux
  }%
}
\newcommand*\zfn@author@affil@alt@aux{%
  \expandafter\zfn@affil@marker@cnt
    \csname @author@altaffil@\@roman\@tempcnta\endcsname\relax
  \advance\zfn@affil@marker@cnt\zfn@affil@cnt\relax
  \advance\zfn@affil@marker@cnt\zfn@footnote@cnt\relax
  \protected@edef\zfn@author@footnotes{%
    \zfn@author@footnotes
    %,%
    \zfn@author@fnsymbol{\zfn@affil@marker@cnt}%
  }%
}
\newcommand*{\zfn@author@fnsymbol}[1]{%
  \ensuremath{%
    \expandafter\zfn@author@fnsymbol@aux\expandafter{\number#1}%
  }%
}
\newcommand*{\zfn@author@fnsymbol@aux}[1]{%
  \ifnum#1>10 %
    \expandafter\zfn@author@fnsymbol@loop
  \else
    \expandafter\zfn@author@fnsymbol@symbol
  \fi
    {#1}%
}
\newcommand*{\zfn@author@fnsymbol@loop}[1]{%
   \zfn@author@fnsymbol@loop@aux@i#1%
}
\newcommand*{\zfn@author@fnsymbol@loop@aux@i}[2]{%
  \zfn@author@fnsymbol@symbol{\ifnum#2=0 10\else #2\fi}%
  \expandafter\zfn@author@fnsymbol@loop@aux@ii\romannumeral #1000Q{}%
    {\zfn@author@fnsymbol@symbol{\ifnum#2=0 10\else #2\fi}}%
}
\newcommand*{\zfn@author@fnsymbol@loop@aux@ii}[1]{%
  \@nameuse{zfn@author@fnsymbol@loop@aux@#1}%
}
\def\zfn@author@fnsymbol@loop@aux@m#1Q#2#3{%
  \zfn@author@fnsymbol@loop@aux@ii#1Q{#2#3}{#3}%
}
\newcommand*{\zfn@author@fnsymbol@loop@aux@Q}[2]{#1}
\newcommand*{\zfn@author@fnsymbol@symbol}[1]{%
  \ifcase #1 *\or
    \dagger\or
      \ddagger\or
        \P\or
          \S\or
            \|\or
              \bot\or
                \#\or
                  @\or
                    \triangle\or
                      \nabla
    \fi
}
\newcommand*\zfn@address@list{%
  \ifnum\zfn@affil@cnt>\z@
    \expandafter\zfn@address@list@auxi
  \else
    \zfn@warning{No affiliations: at least one affiliation is needed}%
  \fi
}
\newcommand*\zfn@address@list@auxi{%
  \ifnum0%
    \ifnum\zfn@affil@cnt>\@ne    1\fi
    \ifnum\zfn@affil@alt@cnt>\z@ 1\fi
      >\z@
    \expandafter\zfn@address@list@auxii
  \else
    \@address@i\par
  \fi
}
\newcommand*\zfn@address@list@auxii{%
  \@tempcnta\z@
  \zfn@affil@marker@cnt\zfn@footnote@cnt
  \loop\ifnum\@tempcnta<\zfn@affil@cnt
    \advance\@tempcnta\@ne
    \advance\zfn@affil@marker@cnt\@ne
    \zfn@author@fnsymbol{\zfn@affil@marker@cnt}%
    \@nameuse{@address@\@roman\@tempcnta}\par% and % TODO handle multiples
  \repeat
  \@tempcnta\z@
  \loop\ifnum\@tempcnta<\zfn@affil@cnt
    \advance\@tempcnta\@ne
    \advance\zfn@affil@marker@cnt\@ne
    \zfn@ifundefined{@altaffil@\@roman\@tempcnta}
      {}
      {%
        \zfn@author@fnsymbol{\zfn@affil@marker@cnt}%
        \@nameuse{@altaffil@\@roman\@tempcnta}\par
      }%
  \repeat
}
\newcommand*\zfn@fnsymbol@org{}
\newcommand*\zfn@affil@list{%
  \let\zfn@fnsymbol@org\@fnsymbol
  \let\@fnsymbol\zfn@author@fnsymbol
  \@tempcnta\z@\relax
  \@tempcntb\z@\relax
  \ifnum\zfn@affil@cnt>\@ne\relax
    \expandafter\zfn@affil@list@aux
  \else
    \ifnum\zfn@affil@alt@cnt>\z@\relax
      \zfn@affil@marker@cnt\@ne\relax
      \advance\zfn@affil@marker@cnt\zfn@footnote@cnt\relax
      \footnotetext[^\zfn@affil@marker@cnt]{\@affil@i}%
      \@tempcnta\@ne\relax
    \fi
  \fi
  \ifnum\zfn@affil@alt@cnt>\z@\relax
    \expandafter\zfn@affil@alt@list
  \fi
  \let\@fnsymbol\zfn@fnsymbol@org
}
\newcommand*\zfn@affil@list@aux{%
  \advance\@tempcnta\@ne\relax
  \zfn@affil@marker@cnt\@tempcnta\relax
  \advance\zfn@affil@marker@cnt\zfn@footnote@cnt\relax
  \footnotetext[\zfn@affil@marker@cnt]{%
    \@nameuse{@affil@\@roman\@tempcnta}%
  }%
  \ifnum\@tempcnta<\zfn@affil@cnt\relax
    \expandafter\zfn@affil@list@aux
  \fi
}
\newcommand*\zfn@affil@alt@list{%
  \advance\@tempcntb\@ne\relax
  \zfn@ifundefined{@altaffil@\@roman\@tempcntb}{}{%
    \zfn@altaffil@foot@aux
  }
  \ifnum\@tempcntb<\zfn@author@cnt\relax
    \expandafter\zfn@affil@alt@list
  \fi
}
\newcommand*\zfn@altaffil@foot@aux{%
  \advance\@tempcnta\@ne\relax
  \zfn@affil@marker@cnt\@tempcnta\relax
  \advance\zfn@affil@marker@cnt\zfn@footnote@cnt\relax
  \footnotetext[\zfn@affil@marker@cnt]{%
    \@nameuse{@altaffil@\@roman\@tempcntb}%
  }%
}
\newcommand*\zfn@email@list@font{}
\newcommand*\zfn@email@list{%
  \begingroup
    \def\UrlFont{\zfn@email@list@font}%
    \@tempcnta\z@\relax
    \@tempcntb\z@\relax
    \zfn@email@list@aux
    \ifnum\@tempcntb=\z@\relax
      \zfn@warning{%
        No e-mail given:\MessageBreak
        at lest one author must have a contact e-mail%
      }%
    \fi
  \endgroup
}
\newcommand*\zfn@email@list@aux{%
  \advance\@tempcnta\@ne\relax
  \ifnum\@tempcnta>\zfn@author@cnt\relax\else
    \zfn@ifundefined{@email@\@roman\@tempcnta}{}{%
      \advance\@tempcntb\@ne\relax
      \ifnum\@tempcntb>\@ne\relax
        ;% separate multiple e‐mails with a semicolon, if desired
      \fi
      \href{mailto:\csname @email@\@roman\@tempcnta\endcsname}{\csname @email@\@roman\@tempcnta\endcsname}
    }%
    \expandafter\zfn@email@list@aux
  \fi
}
\newcommand*\zfn@number@list{%
  \begingroup
    \zfn@number@list@aux@i{phone}%
    \let\@tempb\@tempa
    \zfn@number@list@aux@i{fax}%
    \ifx\@tempa\@empty
      \let\@tempa\@tempb
    \else
      \ifx\@tempb\@empty\else
        \protected@edef\@tempa{%
          \@tempb.\space\@tempa
        }%
      \fi
    \fi
    \ifx\@tempa\@empty\else
      \par
      \@tempa
    \fi
  \endgroup
}
\newcommand*\zfn@number@list@aux@i[1]{%
  \def\@tempa{}%
  \@tempcnta\z@\relax
  \def\zfn@number@list@aux@ii{%
    \advance\@tempcnta\@ne\relax
    \ifnum\@tempcnta>\zfn@author@cnt\relax\else
      \zfn@ifundefined{@#1@\@roman\@tempcnta}{}{%
        \zfn@ifundefined{@email@\@roman\@tempcnta}{}{%
          \ifx\@tempa\@empty
            \edef\@tempa{%
              \@nameuse{@#1@\@roman\@tempcnta}%
            }%
          \else
            \edef\@tempa{%
              \@tempa
              ;
              \@nameuse{@#1@\@roman\@tempcnta}%
            }%
          \fi
        }%
      }%
      \expandafter\zfn@number@list@aux@ii
    \fi
  }%
  \zfn@number@list@aux@ii
  \ifx\@tempa\@empty\else
    \protected@edef\@tempa{%
      \MakeUppercase#1: \@tempa
    }%
  \fi
}
\newcommand*\zfn@number@list@aux@ii{}
\g@addto@macro\endabstract{%
  \aftergroup\zfn@abstract@extras
}
\newcommand*{\zfn@abstract@extras}{%
  \bgroup
  \extrasfont
  \ifzfn@keywords
    \zfn@keywords@print
    \par\vspace*{\zfn@space@inter@extra}
  \fi
  \ifzfn@jel
    \zfn@jel@print
    \par\vspace*{\zfn@space@inter@extra}
  \fi
  \ifzfn@msc
    \zfn@msc@print
    \par\vspace*{\zfn@space@inter@extra}
  \fi
  \ifzfn@abbreviations
    \zfn@abbreviations@print
    \par\vspace*{\zfn@space@inter@extra}
  \fi
  \egroup
}
\newcommand*\zfn@maketitle@extras{%
  \zfn@maketitle@extras@hook
}
\newcommand*\zfn@maketitle@extras@hook{}
\g@addto@macro{\maketitle}{\zfn@maketitle@extras\thispagestyle{empty}}
\g@addto@macro{\document}{\maketitle}
\newfloat{scheme}{htbp}{los}
\floatname{scheme}{Scheme}
\newfloat{chart}{htbp}{loc}
\floatname{chart}{Chart}
\newfloat{graph}{htbp}{loh}
\floatname{graph}{Graph}
%\newcommand*\schemename{Scheme}
%\newcommand*\chartname{Chart}
%\newcommand*\graphname{Graph}
\floatplacement{table}{htbp}
\floatplacement{figure}{htbp}
\floatstyle{plaintop}
\restylefloat{table}
\let\zfn@floatboxreset\@floatboxreset
\def\@floatboxreset{%
  \centering
  \zfn@floatboxreset
}

%\newcommand{\revbookicon}{%
%  \fbox{\rule{0pt}{0.7ex}\rule{1.2em}{0pt}}%
%}

\newcommand*\revbook[1]{%
  \bgroup
    \extrasfont
    \noindent
%    \revbookicon\ 
	\bfseries
    #1\par
  \egroup
  \vspace*{0.8em}% trochę większy odstęp niż keywords
}




\AtEndOfClass{%
  \colorlet{tbrowcolor}{structure@color!10}
  \colorlet{tbheadcolor}{structure@color!30}
  \arrayrulecolor{structure@color}
}
%% From https://tex.stackexchange.com/a/32366/226
\newcommand*{\trfiller}{%
  \arrayrulecolor{tbrowcolor}% change to cell colour
  \specialrule{\heavyrulewidth}{0pt}{-\heavyrulewidth}% "invisible" rule
  \arrayrulecolor{structure@color}% revert to regular line colour
}
\newcommand*{\thfiller}{%
  \arrayrulecolor{tbheadcolor}% change to cell colour
  \specialrule{\heavyrulewidth}{0pt}{-\heavyrulewidth}% "invisible" rule
  \arrayrulecolor{structure@color}% revert to regular line colour
}
\newcommand{\headrow}{\rowcolor{tbheadcolor}}
\newcommand{\patchZFNtables}{%
  \rowcolors*{1}{tbrowcolor}{tbrowcolor}%
  \setlength{\aboverulesep}{0pt}%
  \setlength{\belowrulesep}{0pt}%
  \setlength{\extrarowheight}{.75ex}%
}
\AtBeginEnvironment{table}{\patchZFNtables}
\AtBeginEnvironment{table*}{\patchZFNtables}
\newcommand*\zfn@section{}
\let\zfn@section\section
\newcommand*\zfn@subsection{}
\let\zfn@subsection\subsection
\newcommand*\zfn@subsubsection{}
\let\zfn@subsubsection\subsubsection
\newcommand*\zfn@startsection@orig{}
\let\zfn@startsection@orig\@startsection
\newcommand\zfn@startsection[6]{%
 \if@noskipsec \leavevmode \fi
 \par \@tempskipa #4\relax
 \@afterindenttrue
 \ifdim \@tempskipa <\z@ \@tempskipa -\@tempskipa \@afterindentfalse\fi
 \if@nobreak \everypar{}\else
     \addpenalty\@secpenalty\addvspace\@tempskipa\fi
 \@ifstar{\@dblarg{\@sect{#1}{\@m}{#3}{#4}{#5}{#6}}}%
         {\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}%
}
\let\@startsection\zfn@startsection
\newcommand*\zfn@startsection@alt[6]{%
  \if@noskipsec \leavevmode \fi
  \par \@tempskipa #4\relax
  \@afterindenttrue
 \ifdim \@tempskipa <\z@ \@tempskipa -\@tempskipa \@afterindentfalse\fi
 \if@nobreak \everypar{}\else
     \addpenalty\@secpenalty\addvspace\@tempskipa\fi
  \@ifstar{\@ssect{#3}{#4}{#5}{#6}}
          {\@ssect{#3}{#4}{#5}{#6}}%
}
\newcommand*\zfn@sections@none{%
  \@ifstar{%
    \zfn@sections@none@aux
  }{%
    \zfn@sections@none@aux
  }%
}
\newcommand*\zfn@sections@none@aux[2][]{%
  \zfn@warning{%
    (Sub)section `#2' ignored%
  }%
}
\patchcmd{\@ssect}{#4}{\color{structure@color}#4}{}{}
\patchcmd{\@sect}{#6}{\color{structure@color}#6}{}{}
\newcommand*\SectionNumbersOff{%
  \let\@startsection\zfn@startsection@alt
}
\@onlypreamble\SectionNumbersOff
\newcommand*\SectionNumbersOn{%
  \let\@startsection\zfn@startsection
}
\@onlypreamble\SectionNumbersOn
\newcommand*\SectionsOff{%
  \let\section\zfn@sections@none
  \let\subsection\zfn@sections@none
  \let\subsubsection\zfn@sections@none
}
\@onlypreamble\SectionsOff
\newcommand*\SectionsOn{%
  \let\section\zfn@section
  \let\subsection\zfn@subsection
  \let\subsubsection\zfn@subsubsection
}
\@onlypreamble\SectionsOn
\begingroup
  \toks@=\expandafter{\tableofcontents}
  \xdef\tableofcontents{%
    \begingroup
      \let\noexpand\@startsection\noexpand\zfn@startsection@orig
      \the\toks@
    \endgroup
  }
\endgroup
\newenvironment{acknowledgement}{%
  \zfn@section*{\acknowledgementname}%
}{}
\newenvironment{suppinfo}{%
  \zfn@section*{\suppinfoname}%
}{}
\newcommand*\acknowledgementname{Acknowledgement}
\AtEndOfClass{%
  \def\bibsection{%
    \zfn@section*{\refname}%
  }%
}
\newcommand*\suppinfoname{Supporting Information Available}
\newcommand*\zfn@iffalse{\iffalse}
\newtoks\zfn@collect@toks
\newtoks\zfn@collect@empty@toks
\newcommand*\zfn@collect@begins{}
\newcommand*\zfn@collect@content{}
\newcommand\zfn@collect[1]{%
  \zfn@collect@toks{%
    \expandafter#1\expandafter{\the\zfn@collect@toks}%
  }%
  \edef\zfn@collect@content{%
    \the\zfn@collect@toks
    \noexpand\end{\@currenvir}%
  }%
  \zfn@collect@toks\zfn@collect@empty@toks
  \def\zfn@collect@begins{b}%
  \begingroup
    \expandafter\let\csname\@currenvir\endcsname\zfn@collect@aux
    \edef\zfn@collect@content{%
      \expandafter\noexpand\csname\@currenvir\endcsname
    }%
    \zfn@collect@content
}
\newcommand*\zfn@collect@aux{}
\long\def\zfn@collect@aux#1\end#2{%
  \edef\zfn@collect@begins{%
    \zfn@collect@begins@#1\begin\end
    \expandafter\@gobble\zfn@collect@begins
  }%
  \ifx\@empty\zfn@collect@begins
    \endgroup
    \@checkend{#2}%
    \zfn@collect@body{#1}%
  \else
    \zfn@collect@body{#1\end{#2}}%
  \fi
  \zfn@collect@content
}
\newcommand*\zfn@collect@begins@{}
\long\def\zfn@collect@begins@#1\begin#2{%
  \ifx\end#2\else
    b\expandafter\zfn@collect@begins@
  \fi
}
\newcommand\zfn@collect@body[1]{%
  \global\zfn@collect@toks\expandafter{\the\zfn@collect@toks#1}%
}
\newcommand*\zfn@type@list{article,communication,suppinfo}
\newcommand*\zfn@type@default{article}
\newcommand*\zfn@type@check{%
  \@tempswafalse
  \@for\@tempa:=\zfn@type@list\do{%
    \ifx\@tempa\zfn@manuscript
      \expandafter\@tempswatrue
    \fi
  }%
  \if@tempswa\else
    \zfn@warning{%
      Invalid manuscript type \zfn@manuscript:\MessageBreak
      changed to default type \zfn@type@default
    }%
    \let\zfn@manuscript\zfn@type@default
  \fi
}
\newcommand*\zfn@setkeys{\setkeys{zfn}}
\let\zfn@killsecs\SectionsOff
\newcommand*\zfn@validtype[2][article]{%
  \def\zfn@type@default{#1}%
  \def\zfn@type@list{#2}%
}


\newcommand*\zfn@layout@zfnsize{%
  \ifzfn@simfonts\simfonts\fi
  \geometry{paperwidth=164mm,paperheight=232mm,
      top=2cm,bottom=1.3cm,left=1.7cm,right=1.7cm,
      headsep=0.8cm}
%   \geometry{verbose,paperwidth=145mm,paperheight=205mm,landscape=false,
%   twoside,top=2cm,bottom=1.2cm,left=1.5cm,right=1.3cm,
%         headsep=0.6cm}
}

%-------------------------------
% Layout: Only one size: "zfnsize"
%-------------------------------
\newcommand*\acksize{\normalsize}
\newcommand*\suppsize{\normalsize}
\newcommand*\patch@numeric@authors{%
  %%% Make author markers numeric...
  \renewcommand{\zfn@author@fnsymbol@aux}[1]{##1}
  \pretocmd{\zfn@author@fnsymbol}{\let\ensuremath\relax}{}{}
  \patchcmd{\zfn@author@star@aux}{\else}{,\else}{}{}
  \patchcmd{\zfn@author@star@aux}
    {\ifnum\zfn@affil@alt@cnt>\z@\relax}
    {\ifnum\zfn@affil@alt@cnt>\z@\relax,}
    {}{}
  \patchcmd{\zfn@author@affil@also@aux}
    {\zfn@author@fnsymbol}
    {,\zfn@author@fnsymbol}
    {}{}
  \patchcmd{\zfn@address@list@auxii}
    {\zfn@author@fnsymbol{\zfn@affil@marker@cnt}}
    {\textsuperscript{\zfn@author@fnsymbol{\zfn@affil@marker@cnt}}}
    {}{}
}

%-------------------------------
% Journal configuration: Only one journal
%-------------------------------
\def\zfn@jnl@zfn{%
  \def\zfn@journal@name{Philosophical Problems in Science}% (ZFN)}%
  \def\zfn@journal@polishname{Zagadnienia Filozoficzne w Nauce}% (ZFN)}%
  \zfn@layout@zfnsize
}


% Load immediately  
\zfn@jnl@zfn

%-------------------------------
% Bibliography and reference code
%-------------------------------
\providecommand*\zfn@reference@code{% default citation style; can be modified in journal config or preamble
  \RequirePackage[%
  authordate-trad,%
%  backref=true,%
  uniquename=false,%
  noibid,%
  backend=biber,%
  natbib,%
  dashed=false]%
  {biblatex-chicago}
  \renewcommand*{\bibfont}{\footnotesize}
}

\zfn@reference@code
\zfn@type@check
\ifx\zfn@manuscript\zfn@manuscript@note
  \SectionsOff
\fi
\ifx\zfn@manuscript\zfn@manuscript@review
  \SectionsOn
  \SectionNumbersOn
\fi
\ifx\zfn@manuscript\zfn@manuscript@suppinfo
  \setkeys{zfn}{maxauthors = 1}
  \def\thepage{S-\arabic{page}}
  \renewcommand*\thefigure{S\@arabic\c@figure}
  \renewcommand*\thescheme{S\@arabic\c@scheme}
  \renewcommand*\thetable{S\@arabic\c@table}
  \AtBeginDocument
    {%
      \renewcommand*\citenumfont[1]{S#1}%
      \renewcommand*\bibnumfmt[1]{(S#1)}%
    }
\fi
\SectionNumbersOn

\setlength{\bibitemsep}{1pt}
\setlength{\bibparsep}{1pt}

\renewbibmacro*{bib+doi+url}{%
  \iffieldundef{doi}{%
    \iffieldundef{eprint}{%
      \usebibmacro{url+urldate}%
    }{%
      % No DOI but there is an eprint: print eprint then URL
      \usebibmacro{eprint}%
      \newunit\newblock%
      \usebibmacro{url}%
    }%
  }{%
    % DOI exists: print only the DOI
    \printfield{doi}%
  }%
}




\clubpenalty=10000
\widowpenalty=10000

%% 
%% Adopted for ZFN by Piotr Urbańczyk
%% 
%% Based on the achemso class
%% Originally developed by Mats Dahlgren
%% Copyright (C) 1996-1998 by Mats Dahlgren
%% Copyright (C) 2008-2018 by Joseph Wright <joseph.wright@morningstar2.co.uk>
%% Copyright (C) 2019-2025 by Overleaf (WriteLaTeX Limited)
%% Copyright (C) 2025 by Piotr Urbańczyk <p.m.urbanczyk@gmail.com>
%% 
%% Part of this bundle is derived from cite.sty, to which the
%% following license applies:
%%   Copyright (C) 1989-2009 by Donald Arseneau
%%   These macros may be freely transmitted, reproduced, or
%%   modified provided that this notice is left intact.
%% 
%% It may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License (LPPL), either version 1.3c of
%% this license or (at your option) any later version.  The latest
%% version of this license is in the file:
%%    http://www.latex-project.org/lppl.txt
%% This work is "maintained" (as per LPPL maintenance status) by
%%   Piotr Urbańczyk.
%% 
%% This work consists of the file zfn.cls.
%% 
%% --------------
%% End of zfn.cls
%% --------------