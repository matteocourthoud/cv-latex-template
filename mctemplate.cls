\ProvidesClass{mctemplate}
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

%----------------------------------------------------------------------------------------
%	 REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

% Remove margins
\RequirePackage[left=0cm,top=-1cm,right=0cm,bottom=0cm,nohead,nofoot]{geometry}

% Box setup
\RequirePackage[absolute,overlay]{textpos} % showboxes option to show boxes

% Font
\RequirePackage[default]{raleway}

% Other
\RequirePackage{calc}           % operations with measures e.g. 3cm + 1cm
\RequirePackage{tikz}           % figures
\RequirePackage{xcolor}         % colors
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}
\RequirePackage{wrapfig}
\RequirePackage{fontawesome5}   % icons
\RequirePackage{enumitem}       % enumerate
\setlist[itemize]{leftmargin=*}
\RequirePackage[hidelinks]{hyperref}




%----------------------------------------------------------------------------------------
%	 COLORS
%----------------------------------------------------------------------------------------

\definecolor{maincolor}{HTML}{092947}
\definecolor{white}{RGB}{255,255,255}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{sidecolor}{HTML}{E7E7E7}
\definecolor{mainblue}{HTML}{0E5484}
\definecolor{maingray}{HTML}{B9B9B9}
\definecolor{pblue}{HTML}{0395DE}

%----------------------------------------------------------------------------------------
%	 MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

\pagestyle{empty} % Disable headers and footers
\setlength{\parindent}{0pt} % Disable paragraph indentation
\setlength{\tabcolsep}{0pt} 

% automated the rules in the sidebar headers to automatically go to the end of the line
\newcommand{\raisedrule}[2][0em]{\leaders\hbox{\rule[#1]{1pt}{#2}}\hfill}
\newcommand{\profilesection}[1]{\vspace{.4cm}{\color{black!80} \huge #1 \raisedrule[0.15\baselineskip]{1pt}}\vspace{.2cm}}

%----------------------------------------------------------------------------------------
%  BACKGROUND SHAPES
%----------------------------------------------------------------------------------------

\newcommand{\makebackground}[2]{

% Get measures
\newlength{\colwidth}
\setlength{\colwidth}{#1}
\newlength{\barheight}
\setlength{\barheight}{#2}

% Generate header block
\begin{tikzpicture}[remember picture, overlay]
\node [rectangle, fill=maincolor, anchor=north west, minimum width=\paperwidth, minimum height=\barheight] (box) at (0cm,0cm){};
\end{tikzpicture}

% Generate sidebar shape    
\begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=sidecolor, anchor=north west, minimum width=\colwidth, minimum height=\paperheight] (box) at (.5cm,0cm){};
\end{tikzpicture}

}



%----------------------------------------------------------------------------------------
%   HEADER LAYOUT
%----------------------------------------------------------------------------------------

\newcommand{\makeheader}[3]{

% Get measures
\newlength{\headerwidth}
\setlength{\headerwidth}{21cm - 1cm - \colwidth}
\newlength{\headerX}
\setlength{\headerX}{\colwidth + 1.5cm}

% Generate block
\begin{textblock*}{\headerwidth}(\headerX, 0.8cm)
\textcolor{white}{
    {\Huge \textcolor{white}{\MakeUppercase{#1 \textbf{#2}}}}\\
    {}\\
    {\large \textcolor{white}{#3}}
}
\end{textblock*}

}


%----------------------------------------------------------------------------------------
%   SIDEBAR LAYOUT
%----------------------------------------------------------------------------------------

\newenvironment{sidebar}{

% Get measures
\newlength{\textcolwidth}
\setlength{\textcolwidth}{\colwidth - 1cm}
\newlength{\firstcolwidth}
\setlength{\firstcolwidth}{.5cm}
\newlength{\colspace}
\setlength{\colspace}{.5cm}
\newlength{\secondcolwidth}
\setlength{\secondcolwidth}{\colwidth - 1cm - \firstcolwidth - \colspace}

% Generate block
\begin{textblock*}{\textcolwidth}(1cm, 0.5cm)
}{
\end{textblock*}
}

%----------------------------------------------------------------------------------------
%   SIDEBAR PIECES
%----------------------------------------------------------------------------------------

% --- PROFILE PICTURE --- %

\newcommand{\makepicture}[1]{

\newlength{\picureradius}
\setlength{\picureradius}{#1}

\begin{center}
\begin{tikzpicture}
\clip (0,0) circle (\picureradius);
\node[anchor=center] at (0,0) {\includegraphics[width=2\picureradius]{img/profile.jpg}}; 
\end{tikzpicture}
\end{center}
\vspace{5mm}

}

% --- CONTACT TABLE --- %

\newenvironment{contacttable}{%
\renewcommand{\arraystretch}{1.5}
\begin{tabular}{p{\firstcolwidth} @{\hskip \colspace}p{\secondcolwidth}}
}{
\end{tabular}
}

\newcommand{\contactitem}[3]{%
	\textcolor{maincolor}{\faIcon{#1}}
    & \href{#2}{#3} \\
}

% --- SKILL TABLE --- %

\newenvironment{skilltable}{%
    \renewcommand{\arraystretch}{1.5}
	\begin{tabular}{p{\textcolwidth}}
}{%
	\end{tabular}
}

\newcommand{\skillitem}[1]{#1 \\}

% --- TOOLBOX --- %

\newcommand\toolbox[1]{ 
	\begin{tikzpicture}
		\foreach [count=\i] \x/\y in {#1}{
			\draw[fill=maingray,maingray] (0,\i) rectangle (\textcolwidth,\i+0.4);
			\draw[fill=white,mainblue](0,\i) rectangle (\y\textcolwidth,\i+0.4);
			\node [above right] at (0,\i+0.4) {\x};
		}
	\end{tikzpicture}
	\vspace{-0.2cm}
}

% --- CODING TABLE --- %

\newenvironment{codingtable}{%
    \renewcommand{\arraystretch}{1.5}
	\begin{tabular}{p{\firstcolwidth} @{\hskip \colspace}p{\secondcolwidth}}
}{%
	\end{tabular}
}

\newcommand{\codingitem}[2]{%
	{$
    \begin{array}{c}
    \raisebox{-.5\height}{\includegraphics[width=.5cm]{img/#1}}
    \end{array}
    $}
    & #2 \\
}



%----------------------------------------------------------------------------------------
%	 MAIN
%----------------------------------------------------------------------------------------

\newenvironment{main}{

% Get measures
\newlength{\mainwidth}
\setlength{\mainwidth}{19.5cm - \colwidth}
\newlength{\mainleftmargin}
\setlength{\mainleftmargin}{\colwidth + 1cm}
\newlength{\maintopmargin}
\setlength{\maintopmargin}{\barheight}

% Generate block
\begin{textblock*}{\mainwidth}(\mainleftmargin, \maintopmargin)
}{
\end{textblock*}
}


%----------------------------------------------------------------------------------------
%	 MAIN PIECES
%----------------------------------------------------------------------------------------

% --- SECTION TITLE --- %

\renewcommand{\section}[1]{{\LARGE\color{pblue} #1}\par\vspace{.2cm}}

% --- EXPERIENCE LIST --- %

\newenvironment{experiencelist}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}
\newcommand{\experienceitem}[4]{%
	#1 & \parbox[t]{0.83\textwidth}{%
		 \textbf{#2}% 
		 \hfill%
		 {\footnotesize#3}\\%
         \ifblank{#4}{}{#4 \\}
	}\\
}


