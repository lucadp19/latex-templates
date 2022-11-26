\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{notes}[2020/04/05 v0.1 Notes Class]

%%% KEY-VALUE OPTIONS %%%

\RequirePackage{kvoptions}
\RequirePackage{ifthen}
\SetupKeyvalOptions{
  family=notes,
  prefix=notes@,
}

% Sets the language (default is english)
\DeclareStringOption[english]{language}[english]
% Sets the fontstyle
\DeclareStringOption[default]{fontstyle}[default]
% Sets the theorems style (default: boxed)
\DeclareStringOption[boxed]{thmstyle}[boxed]
% Sets whether colors will be used
\DeclareBoolOption[true]{colors}
% Other options are sent to memoir
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{memoir}}

\ProcessKeyvalOptions*
\LoadClass[%
    \notes@language,
    a4paper
]{memoir}

%%% EXTERNAL PACKAGES
\RequirePackage[\notes@language]{babel} % for language
\ifnotes@colors
    \RequirePackage[usenames,dvipsnames,svgnames]{xcolor}
\else 
    \RequirePackage[usenames,dvipsnames,svgnames, monochrome]{xcolor}
\fi
\RequirePackage{ragged2e}
\RequirePackage{amsmath, amsthm, amssymb, mathtools} % general math


%%% FONTS

\renewcommand{\footnotesize}{\fontsize{8pt}{9pt}\selectfont}

\ifpdf
    \RequirePackage[T1]{fontenc}
    \RequirePackage[utf8]{inputenc}
    \RequirePackage{textcomp}
    % Setup microtype for pdfLaTex
    \RequirePackage[final,tracking=true,kerning=true]{microtype}

    \RequirePackage{newpxtext}
    \RequirePackage{eulerpx}
    % \RequirePackage{euscript}[mathcal]
    \RequirePackage[scaled=0.85]{beramono}
    \RequirePackage
        [
            bb=fourier,
            cal=euler,
            scr=rsfso,
        ]{mathalpha}
\fi

\ifxetex
    % Setup microtype for XeLaTeX
    \RequirePackage[expansion=false,final]{microtype}

    \RequirePackage{fontspec}
    \RequirePackage{unicode-math}

    \RequirePackage{etoolbox}
    \patchcmd{\arrowfill@}{-7mu}{-5mu}{}{}
    \patchcmd{\arrowfill@}{-7mu}{-5mu}{}{}
    \patchcmd{\arrowfill@}{-2mu}{-4mu}{}{}
    \patchcmd{\arrowfill@}{-2mu}{-4mu}{}{}    

    \newfontfeature{Microtype}{protrusion=default;expansion=default;}%
    \setmainfont{texgyrepagella-regular.otf}
    [%
        Microtype,
        Ligatures = TeX,
        BoldFont = texgyrepagella-bold.otf,
        ItalicFont = texgyrepagella-italic.otf,
        BoldItalicFont = texgyrepagella-bolditalic.otf,
    ]%
    \setmathfont{texgyrepagella-math.otf}

    \unimathsetup{math-style=upright, partial=upright, nabla=upright}
    \defaultfontfeatures{Scale=MatchLowercase}
    \setmathfont{Asana-Math.otf}
    \setmathfont[range={"0000-"0001,"0020-"007E,
        "00A0,"00A7-"00A8,"00AC,"00AF,"00B1,"00B4-"00B5,"00B7,
        "00D7,"00F7,
        "0131,
        "0237,"02C6-"02C7,"02D8-"02DA,"02DC,
        "0300-"030C,"030F,"0311,"0323-"0325,"032E-"0332,"0338,
        "0391-"0393,"0395-"03A1,"03A3-"03A8,"03B1-"03BB,
        "03BD-"03C1,"03C3-"03C9,"03D1,"03D5-"03D6,"03F5,
        "2016,"2018-"2019,"2021,"2026-"202C,"2032-"2037,"2044,
        "2057,"20D6-"20D7,"20DB-"20DD,"20E1,"20EE-"20EF,
        "210B-"210C,"210E-"2113,"2118,
        "211B-"211C,"2126-"2128,
        "212C-"212D,"2130-"2131,"2133,"2135,
        "2190-"2199,
        "21A4,"21A6,
        "21A9-"21AA,
        "21BC-"21CC,
        "21D0-"21D5,
        "2200,"2202-"2209,"220B-"220C,"220F-"2213,"2215-"221E,
        "2223,"2225,"2227-"222E,"2234-"2235,"2237-"223D,
        "2240-"224C,"2260-"2269,"226E-"2279,"2282-"228B,"228E,
        "2291-"2292,"2295-"2299,"22A2-"22A5,"22C0-"22C5,
        "22DC-"22DD,"22EF,"22F0-"22F1,
        "2308-"230B,"2320-"2321,"2329-"232A,"239B-"23AE,
        "23DC-"23DF,
        "27E8-"27E9,"27F5-"27FE,"2A0C,"2B1A,
        "1D400-"1D433,"1D49C,"1D49E-"1D49F,"1D4A2,"1D4A5-"1D4A6,
        "1D4A9-"1D4AC,"1D4AE-"1D4B5,"1D4D0-"1D4E9,"1D504-"1D505,
        "1D507-"1D50A,"1D50D-"1D514,"1D516-"1D51C,"1D51E-"1D537,
        "1D56C-"1D59F,"1D6A8-"1D6B8,"1D6BA-"1D6D2,"1D6D4-"1D6DD,
        "1D6DF,"1D6E1,"1D7CE-"1D7D7
        }]{Neo Euler}
    \setmathfont[range=up/{greek,Greek}, script-features={}, sscript-features={}
                ]{Neo Euler}
    \setmathfont[range=up/{latin,Latin}, script-features={}, sscript-features={}
                ]{Neo Euler}
    \setmathfont[range={bfup/{latin, Latin, greek, Greek}, frak, bffrak, cal},
                script-features={}, sscript-features={}
                ]{Neo Euler}
    \setmathfont[range={up/num, bfup/num, it, bfit, scr, bfscr,
                        sfup, sfit, bfsfup, bfsfit, tt}
                ]{Asana-Math.otf}
    \setmathfont[range={\leftarrow,\rightarrow,\mapsto}]{Asana-Math.otf}
    \setmathfont[range=bfcal, Scale=MatchUppercase, Alternate]{Asana-Math.otf}

    \let\old@lhook\lhook
    \renewcommand{\lhook}{\mathrel{\text{\fix@lhook}}}
    \newcommand\fix@lhook{%
    \raisebox{-.078ex}{%
        \scalebox{1.25}{$\m@th\old@lhook$}%
    }%
    }

    % \setmathfont[range=\mathcal]{Neo Euler}
    % \setmathfont[range=\mathscr]{Asana-Math.otf}
    \setmathfont{XITSMath-Regular.otf}[range=bb]
\fi

%%% PAGE LAYOUT %%%
\setlrmarginsandblock{1.2in}{*}{*}
\checkandfixthelayout

\makepagestyle{notes}
\makepsmarks{notes}{
    \nouppercaseheads
    \createmark{chapter}{both}{nonumber}{}{}
    \createmark{section}{right}{nonumber}{}{}
    \createplainmark{toc}{both}{\contentsname}
    \createplainmark{lof}{both}{\listfigurename}
    \createplainmark{lot}{both}{\listtablename}
    \createplainmark{bib}{both}{\bibname}
    \createplainmark{index}{both}{\indexname}
    \createplainmark{glossary}{both}{\glossaryname}
}
\makerunningwidth{notes}[435pt]{435pt}
\makeheadposition{notes}{flushright}{flushleft}{flushright}{flushleft}
\makeheadrule{notes}{435pt}{0.5pt}
\makeevenhead{notes}{\small\textsf{\leftmark}}{}{\small\textsf{\rightmark}\hspace{1em}\thepage}
\makeoddhead{notes}{\small\textsf{\leftmark}}{}{\small\textsf{\rightmark}\hspace{1em}\thepage}

\aliaspagestyle{part}{empty}
\aliaspagestyle{chapter}{plain}

\pagestyle{notes}

%%% STYLE %%%
%%% Title Style %%%
\renewcommand{\pretitle}{\begin{center}\huge\sffamily}
\renewcommand{\preauthor}{
    \begin{center}
    \large \sffamily \lineskip 0.5em%
    \begin{tabular}[t]{c}
}
\renewcommand{\predate}{\begin{center}\large\sffamily}

%%% Part Style %%%
\renewcommand{\partnamefont}{\normalfont\Large}
\renewcommand{\partnumfont}{\normalfont\Large}
\renewcommand{\parttitlefont}{\sffamily\LARGE\color{RoyalBlue}\MakeTextUppercase}

%%% Chapter Style %%%
\setlength{\beforechapskip}{0pt}
\renewcommand{\chapnumfont}{\fontsize{72pt}{96pt}\color{Gray}\selectfont}
\renewcommand{\chaptitlefont}{\huge\sffamily\color{Black}}
\renewcommand*{\printchaptername}{\chapnumfont}
\renewcommand*{\afterchaptertitle}{\par\nobreak\vspace*{-10pt}\hrulefill\vskip\afterchapskip}
\setlength{\afterchapskip}{\baselineskip}

%%% ToC Style %%%
\newlength{\aftertocskip}
\renewcommand*{\aftertoctitle}{\par\nobreak\vspace*{-10pt}\hrulefill\vskip\aftertocskip}

%%% Section and Subsection Style %se%%
\setsecheadstyle{\normalfont\LARGE\sffamily}
% \ifnotes@colors
    \setsubsecheadstyle{\sffamily\bfseries\color{RoyalBlue}}
% \else
    % \setsubsecheadstyle{\sffamily\bfseries}
% \fi
\newcommand\sectionsecnumformat{\thesection\quad}
\newcommand\subsectionsecnumformat{\thesubsection\quad}
\setaftersecskip{\baselineskip}

%%% Paragraph Style %%%
% \ifnotes@colors
    \setparaheadstyle{\sffamily\bfseries\color{RoyalBlue}}
% \else
    \setparaheadstyle{\sffamily\bfseries}
% \fi
\setbeforeparaskip{1em}
\setafterparaskip{0.5em}

%%% ToC Styling %%%
\settocdepth{subsection}
\setsecnumdepth{subsection}

\renewcommand{\cftpartfont}{%
    \bfseries\sffamily\large\color{RoyalBlue}%
}
% \settocpreprocessor{part}{%
%     \let\tempf@rtoc\f@rtoc%
%     \def\f@rtoc{%
%   \texorpdfstring{\MakeTextUppercase{\tempf@rtoc}}{\tempf@rtoc}
%     }%
% }
\renewcommand{\cftpartformatpnum}[1]{\small #1}
\renewcommand{\cftchapterformatpnum}[1]{\small #1}
\renewcommand{\cftsectionformatpnum}[1]{\small #1}
\renewcommand{\cftsubsectionformatpnum}[1]{\small #1}
\renewcommand{\cftchapterafterpnum}{\vspace{2pt}}
\renewcommand{\cftsectionafterpnum}{\vspace{2pt}}
\renewcommand{\cftsubsectionafterpnum}{\vspace{2pt}}

\renewcommand{\cftchapterfont}{%
    \bfseries\large\sffamily%
}
\renewcommand{\cftsectionfont}{%
    \sffamily\normalsize%
}
\renewcommand{\cftsubsectionfont}{%
    \sffamily\small%
}

%%% Proof section
\providecommand\pfsection[1]{
    \vspace{0.5em}
    {\sffamily\bfseries\@newthoughtcolor #1}
    \hspace{1em}
}

%%% newthoughts commands
\newskip\newthoughtskipamount
\newthoughtskipamount=1.0\baselineskip plus 0.5ex minus 0.2ex
\providecommand\newthoughtbreak{\par\ifdim\lastskip<\newthoughtskipamount
    \removelastskip\penalty-100\newthoughtskip\fi}

\newcommand{\@newthoughtcolor}{\color{RoyalBlue}}
% \ifnotes@colors
%     \renewcommand{\@newthoughtcolor}{\color{RoyalBlue}}
% \fi

\newcommand{\newthoughtskip}{\vspace\newthoughtskipamount}
\providecommand\newthought[1]{%
    \nopagebreak
    \newthoughtbreak
    \noindent%
    {\llap{\color{black!30}\scriptsize\raisebox{1pt}{$\blacktriangleright$}\quad}}%
    {\sffamily\@newthoughtcolor #1}%
    \hspace{1em}
}
\providecommand\newthoughtpar[1]{\nopagebreak\newthought{#1}\par\nopagebreak\noindent\ignorespaces}

%%%%%% Renewing description environment
% \ifnotes@colors
    \renewcommand*\descriptionlabel[1]{\hspace\labelsep\normalfont\sffamily\color{RoyalBlue} #1}
% \else
    % \renewcommand*\descriptionlabel[1]{\hspace\labelsep\normalfont\sffamily #1}
% \fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% My packages

\RequirePackage{preamble}

\ifthenelse{\equal{\notes@thmstyle}{boxed}}{%
    \ifnotes@colors
        \usepackage[colors]{boxed-thm}
    \else
        \usepackage{boxed-thm}
    \fi
}{}

\ifthenelse{\equal{\notes@thmstyle}{simple}}{%
    \usepackage{simple-thm}
}{}

%%% HyperRef %%%
% \AtEndPreamble{
    \PassOptionsToPackage{
        \notes@language,
        capitalise,
        nameinlink
    }{cleverref}

    \RequirePackage{hyperref}
    \hypersetup{%
        linktocpage,
        % bookmarks,
        bookmarksdepth = section,
        colorlinks = true,
        linkcolor = RoyalBlue,
        urlcolor = RoyalBlue,
        citecolor = RoyalBlue,
        pdfpagelayout=TwoPageLeft,
    }
    \RequirePackage[
        \notes@language,
        capitalise,
        nameinlink
    ]{cleveref}
% }