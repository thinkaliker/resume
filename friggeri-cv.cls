\ProvidesClass{friggeri-cv}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{black}{HTML}{000000}
\definecolor{lightgray}{HTML}{888888}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}

\ifdefined\@cv@print
  \colorlet{green}{black}
  \colorlet{orange}{black}
  \colorlet{purple}{black}
  \colorlet{brown}{black}
  \colorlet{red}{black}
  \colorlet{blue}{black}
  \colorlet{fillheader}{white}
  \colorlet{header}{black}
\else
  \colorlet{fillheader}{black}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{black}
\colorlet{headercolor}{black}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}
\usepackage{sourcesanspro}

\newfontfamily\bodyfont[]{Source Sans Pro}
\newfontfamily\thinfont[]{Source Sans Pro ExtraLight}
\newfontfamily\headingfont[]{Source Sans Pro Bold}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{Source Sans Pro Light}

%\setmathfont{XITS Math}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[5]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=2cm] (box) at (current page.north){};
    
    \node [anchor=north] (name) at (box) {%
      \fontsize{40pt}{60pt}\color{header}%
      {\thinfont #1}{\bodyfont  #2} \Huge{\thinfont - #3}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      {\thinfont #4} -- {\thinfont #5}%
    };
  \end{tikzpicture}
  \vspace{1cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}
    {\color{textcolor} #1}
  }
  \par\vspace{\parskip}
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  #1&\parbox[t]{16cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    #4\vspace{\parsep}%
  }\\}

%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=1.5cm,top=1.5cm,right=1.5cm,bottom=1.5cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}