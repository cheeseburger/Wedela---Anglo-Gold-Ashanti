% This is an example of how to modify the style of your
% thesis.  Check the guidelines for your school/university
% on the required format for a PhD thesis.

% First identify the class:

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nwureport}

% For the cover pages.
\RequirePackage[pdftex]{graphicx}
\RequirePackage{ifthen,epsfig}
\RequirePackage{setspace}
%\RequirePackage[usenames]{color}
\RequirePackage[dvipsnames,usenames]{color}
\RequirePackage{pdfpages}

% for the cover pages
\newboolean{cover}
\DeclareOption{cover}{\setboolean{cover}{true}}


% is a kind of report
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

\ProcessOptions

\LoadClass[a4paper,12pt]{report}
% Set paper size and margins
%\RequirePackage[a4wide]
\RequirePackage[a4paper,top=2.5cm,left=3cm,right=3cm,bottom=2.5cm]{geometry}
% make left and right side margins equal
% Set equal margins on book style

\newcommand{\@activity}{?}
\newcommand{\activity}[1]{\renewcommand{\@activity}{#1}}

\newcommand{\@projnumber}{?}
\newcommand{\projnumber}[1]{\renewcommand{\@projnumber}{#1}}

\newcommand{\@lab}{}
\newcommand{\lab}[1]{%
  \renewcommand{\@lab}{%
    \begin{center}%
      \textbf{NWU}\\
      #1
    \end{center}%
  }%
}

\newcommand{\@keywords}{}
\newcommand{\keywords}[1]{%
  \renewcommand{\@keywords}{%
    \vspace{2\baselineskip}
    \begin{raggedright}%
      \textbf{Keywords:} #1
    \end{raggedright}%
  }%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The date  is just given as: Month YEAR.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\today}{%
  \ifcase\month\or
    January\or
    February\or
    March\or
    April\or
    May\or
    June\or
    July\or
    August\or
    September\or
    October\or
    November\or
    December\fi\
  \number\year
}



% set caption names
\renewcommand{\figurename}{Figure}
\renewcommand{\tablename}{Table}

% Redefining the \section command:

\renewcommand{\section}{\@startsection
{section}%                   % the name
{1}%                         % the level
{0mm}%                       % the indent
{-\baselineskip}%            % the before skip
{0.5\baselineskip}%          % the after skip
{\sffamily\large\bfseries}} % the style
%{\normalfont\large\itshape}} % the style

% Redefining the \subsection command:

\renewcommand{\subsection}{\@startsection
{subsection}%                   % the name
{1}%                         % the level
{0mm}%                       % the indent
{-\baselineskip}%            % the before skip
{0.5\baselineskip}%          % the after skip
{\sffamily\large}} % the style


% Redefining the chapter heading styles

% Numbered chapter heading style:

\renewcommand{\@makechapterhead}[1]{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright \sffamily
%    \hrule                                           % horizontal line
    \vspace{5pt}%                                    % add some vertical space
    \ifnum \c@secnumdepth >\m@ne
%        \huge\scshape \@chapapp\space \thechapter    % Chapter followed by number
        \huge\bfseries \thechapter.\space    % Chapter followed by number
%        \par\nobreak
%        \vskip 20\p@
    \fi
    \interlinepenalty\@M
    \Huge\bfseries \scshape #1\par                            % chapter title
    \vspace{10pt}%                                    % add some vertical space
%    \hrule                                           % horizontal rule
    \vspace{5pt}%                                    % add some vertical space
    \nobreak
    \vskip 40\p@
  }}

% Unnumbered chapter heading style:
\renewcommand{\@makeschapterhead}[1]{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright \sffamily
%    \hrule                                           % horizontal line
    \vspace{5pt}%                                    % add some vertical space
    \interlinepenalty\@M
    \huge\bfseries \scshape #1\par                            % chapter title
    \vspace{5pt}%                                    % add some vertical space
%    \hrule                                           % horizontal line
    \nobreak
    \vskip 40\p@
  }}

\renewcommand{\contentsname}{\sffamily\huge\bfseries\scshape{Contents}}
\renewcommand{\listfigurename}{\sffamily\huge\bfseries\scshape{Figures}}
\renewcommand{\listtablename}{\sffamily\huge\bfseries\scshape{Tables}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The authors  appear on seperate lines.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\and}{$|$\ }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The thanks command is used to give an author's address.
% It behaves differently on the cover page and on the title page.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newboolean{showthanks}
\renewcommand{\thanks}[1]{%
  \ifthenelse{\boolean{showthanks}}{\\
    {\indent \addr@font
      \hspace{2.75em}%
      \begin{tabular}{@{}l@{}}%
	#1
      \end{tabular}%
    }%
  }{}%
}

% Set up the margins _after_ the paper size has been selected by whatever
% style files the user has.

\AtBeginDocument{
%  \setlength{\textwidth}{100mm}
%  \setlength{\textheight}{230mm}

% Place the text centered on the pages
%  \setlength{\evensidemargin}{11mm}
%  \setlength{\oddsidemargin}{11mm}
%  \setlength{\topmargin}{-7mm}
}


%%%%%%%%%%%%%%%%%%%%%%%
% Report titles look a bit different though.
%%%%%%%%%%%%%%%%%%%%%%%

% The font for the title on the front cover
\newcommand{\title@font}{%
  \fontseries{m}%
  \fontshape{n}%
  \fontsize{24.88}{28} 
  \selectfont
  \sffamily}

% The font for the title on the inner cover
\newcommand{\titletwo@font}{%
  \fontseries{m}%
  \fontshape{n}%
  \fontsize{24.88}{28} 
  \selectfont
  \sffamily}

% The font for the author{s} on the front cover
\newcommand{\author@font}{%
  \fontseries{m}%
  \fontshape{n}%
  \fontsize{17.28}{20} 
  \selectfont
  \sffamily}

% The font for the author{s} on the inner cover
\newcommand{\authortwo@font}{%
  \fontseries{m}%
  \fontshape{n}%
  \fontsize{14}{18}%
  \selectfont
  \sffamily}

% The font for the univerities on the back cover
\newcommand{\backhead@font}{%
  \fontseries{b}%
  \fontshape{n}%
  \fontsize{10}{11}%
  \selectfont
  \sffamily}

% The font for the departments on the back cover
\newcommand{\back@font}{%
  \fontseries{m}  
  \fontshape{n}%
  \fontsize{10}{11}%
  \selectfont
  \sffamily}

% The font for the report number and date on the front cover
\newcommand{\tinfo@font}{%
  \fontseries{m} 
  \fontshape{n}%
  \fontsize{14}{16}%
  \selectfont
  \sffamily}

% The font for report number and date on inner cover page
\newcommand{\tinfotwo@font}{%
  \fontseries{m}  
  \fontshape{n}%
  \fontsize{12}{14}%
  \selectfont
  \sffamily}

% Set graphics path
\graphicspath{{./images/}}

% The font for addresses of authors on inner cover page
% Used in \thanks
\newcommand{\addr@font}{%
  \fontseries{m}%
  \fontshape{n}%
  \fontsize{12}{14}%
  \selectfont
  \rmfamily}

%% This is the command that actually makes the title.
\renewcommand{\maketitle}{%

  \pagestyle{empty}
%  \clearpage
  \begin{figure}[t]
    \begin{picture}(100,100)(0,0)
        \put(-20,360){\includegraphics[scale=0.4]{NWU-logo}}

%      \put(-86,-400){\includegraphics{A4-NWU-IC-v3}} 
      \put(-20,130){\centerline{\parbox[t]{15cm}{\color{black}\title@font\@title}}}
      \put(-4,-40){\centerline{\parbox[t]{13cm}{\color{black}Report to}}}
      \put(-4,-60){\centerline{\parbox[t]{13cm}{\color{black}\author@font Anglo Gold Ashanti}}}
      \put(-4,-90){\centerline{\parbox[t]{13cm}{\color{black}by}}}
      \put(-4,-110){\centerline{\parbox[t]{13cm}{\color{black}\author@font the North-West University}}}
      \put(-4,-250){\centerline{\author@font{\color{Gray}\@activity}}}
      \put(-4,-270){\centerline{\tinfo@font{\color{Gray}\@projnumber}}} 
      \put(-4,-290){\centerline{\tinfo@font{\color{Gray}October 2018}}} 
    \end{picture} \\
  \end{figure}
  \cleardoublepage
  
  % Put authors on separate lines on the inner title page
  % and show \thanks
  \renewcommand{\and}{\\}
  \setboolean{showthanks}{true}%
  
    \begin{figure}[t]
      \begin{picture}(100,120)(0,0)
        \put(-20,360){\includegraphics[scale=0.4]{NWU-logo}}
        %\put(330,360){\includegraphics[scale=0.1]{NOVA-logo}}
        \put(-20,280){\parbox[t]{15cm}{\color{black}\titletwo@font\@title}}
        \put(-20,150){\parbox[t]{20cm}{\color{black}\authortwo@font\@author}}

	%\put(-30,190){\parbox[t]{15cm}{
	%  {  ,
        %    %\begin{spacing}{1}
        %    \color{black}\titletwo@font\@title 
        %   %\end{spacing}
        %  }   \vspace{8mm} \\
	%  
	%} }
        \put(-20,-260){\tinfotwo@font{\color{black}\@activity}}
	\put(-20,-280){\tinfotwo@font{\color{black}\@projnumber}}
	\put(-20,-300){\tinfotwo@font{\color{black}\@date}}
      \end{picture}
  \end{figure}
  \clearpage
  
  \pagestyle{mainmatter}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Abstracts (which are mandatory) appear before the `first' page.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifthenelse{\boolean{@titlepage}}{%
  \renewcommand{\abstractname}{\sffamily\huge\bfseries \scshape
    \flushleft Executive Summary\hfill}
    \par
  \let\@ldabstract=\abstract
  \let\@ldendabstract=\endabstract
  \renewenvironment{abstract}{%
    \@ldabstract
    \setcounter{page}{0}%
  }{
    \par
    \@keywords
    \vfill
    %\begin{center}
    %  \@lab
    %\end{center}
    \vfill
    \@ldendabstract
    \setcounter{page}{1}%
  }%
}{}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Reports have a page at the end with some logos on it.	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\AtEndDocument{%
%  \clearpage
  \pagestyle{empty}%
%  \clearpage
  \hbox{}
 \clearpage
%  %\enlargethispage*{2cm}
%  %\ifthenelse{\boolean{cover}}{%
%  %  \cleardoublepage
%  %  \hbox{}
%  %  \clearpage
%  %}{%
%  %  \ifthenelse{\isodd{\value{page}}}{%
%  %    \hbox{}
%  %    \clearpage
%  %  }{}%
%  %}%
%  
    \begin{picture}(100,100)(0,0)
%      \put(0,0){\includegraphics[scale=1.35]{NWU-PC-horizontal-logo}} 
%      \put(0,-130){\parbox[t]{15cm}{\color{Gray}\tinfo@font{11
%            Hoffman Street \\ Potchefstroom \\ 2531 \\ www.nwu.ac.za}}}
      \put(-20,-550){\centerline{\author@font{\color{Gray}\@activity}}} 
      \put(-20,-570){\centerline{\tinfo@font{\color{Gray}\@projnumber}}} 
      \put(-20,-590){\centerline{\tinfo@font{\color{Gray}\@date}}} 
    \end{picture}
%
%    \begin{picture}(100,535)(0,0) 
%   \put(-30,0) {
%   \vbox{
%      \hbox{
%      	{\includegraphics[width=2.1cm]{SAWS-logo}}
%	\hspace{6mm}
%     	\parbox[b]{12cm}{
%		{\backhead@font } \\
%		  {\color{blue}$\bullet$} 
%		    {\back@font Research} \\
%		\\  
%	     }  % end of \parbox
% 	} % end of \hbox
%	
%    \vspace{6mm}
%
%%     \hbox{
%%      	{\includegraphics[width=2.0cm]{aalogo.eps}}
%%	\hspace{6mm}
%%     	\parbox[b]{12cm}{
%%		{\backhead@font {\AA}bo Akademi University} \\
%%		  {\color{blue}$\bullet$} 
%%		    {\back@font Department of Information Technologies} \\
%%	     } % end of \parbox
%%	} % end of \hbox
%%
%%   \vspace{8mm}
%%
%%     \hbox{
%%      	{\includegraphics[width=2.2cm]{tukkklogo.eps}}
%%	\hspace{4mm}
%%     	\parbox[b]{12cm}{
%%		{\backhead@font Turku School of Economics} \\
%%		  {\color{blue}$\bullet$} 
%%		    {\back@font Institute of Information Systems Sciences} \\
%%	     }  % end of \parbox
%%	} % end of \hbox
%%
%%   \vspace{16mm}
%%
%%   {\noindent \parbox[b]{10cm}{
%%	\tinfotwo@font ISBN \@isbn \\
%%	ISSN  \@issn}
%%   }  % end of \parbox
%
%
%}  % \vbox
%} % put
%\end{picture}
%
%% end of file:
%%\endinput
%
}  % end of \AtEndDocument

