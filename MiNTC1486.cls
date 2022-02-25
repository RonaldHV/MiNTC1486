\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{MiNTC1486}[2022/02/19 MiNTC1486 LaTeX class - Adaptación para LaTeX de la NTC1486]


\LoadClass[11pt,letterpage,oneside]{book}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

\ProcessOptions\relax

% -- Forma de los párrafos --
\setlength{\parindent}{0pt} %Sin identación en los párrafos
\setlength{\parskip}{\baselineskip} %Espacio de una línea entre los párrafos
% -----------------------------------------------

\pagestyle{plain}

% -- Paquetes usados para dar forma al documento --
\RequirePackage[left=4cm,right=2cm,top=2cm,bottom=2cm,includehead,includefoot]{geometry}
\RequirePackage{ifthen}
\RequirePackage{titlesec}
\RequirePackage[figurewithin=none]{caption}
    \captionsetup[figure]{format=hang,labelsep=period,font=normalsize,labelfont=normalfont,width=0.8\textwidth}
    \captionsetup[table]{format=hang,labelsep=period,font=normalsize,labelfont=normalfont,width=0.8\textwidth}
\RequirePackage{chngcntr}
    \counterwithout{figure}{chapter}
    \counterwithout{table}{chapter}
% ------------------------------------------------

% -- Datos del trabajo --
\def\Titulo#1{\gdef\@Titulo{#1}}
\def\AutorA#1{\gdef\@AutorA{#1}}
\def\AutorB#1{\gdef\@AutorB{#1}}
\def\AutorC#1{\gdef\@AutorC{#1}}
\def\Institucion#1{\gdef\@Institucion{#1}}
\def\Facultad#1{\gdef\@Facultad{#1}}
\def\Departamento#1{\gdef\@Departamento{#1}}
\def\Programa#1{\gdef\@Programa{#1}}
\def\Ciudad#1{\gdef\@Ciudad{#1}}
\def\Anho#1{\gdef\@Anho{#1}}
\def\Mes#1{\gdef\@Mes{#1}}
\def\Dia#1{\gdef\@Dia{#1}}
\def\Tipotrabajo#1{\gdef\@Tipotrabajo{#1}}
\def\Director#1{\gdef\@Director{#1}}
\def\JuradoA#1{\gdef\@JuradoA{#1}}
\def\JuradoB#1{\gdef\@JuradoB{#1}}
% ------------------------------------------------

% -- Cubierta del trabajo de grado --
\newcommand{\Cubierta}{%
    \thispagestyle{empty}
     {\centering
        {\Large\bf\MakeUppercase{\@Titulo}}\\
        \vfill
        \MakeUppercase{\@AutorA}\\
        %
        \ifthenelse{\equal{\@AutorB}{}}{\vspace*{\baselineskip}}{\MakeUppercase{\@AutorB}\\}%
        \ifthenelse{\equal{\@AutorC}{}}{\vspace*{\baselineskip}}{\MakeUppercase{\@AutorC}}%
        %
        \vfill
        \ifthenelse{\equal{\@Institucion}{}}{\vspace*{\baselineskip}}{\MakeUppercase{\@Institucion}\\}%
        \ifthenelse{\equal{\@Facultad}{}}{%
        }{\MakeUppercase{\@Facultad}\\}%
        \ifthenelse{\equal{\@Departamento}{}}{%
        }{\MakeUppercase{\@Departamento}\\}%
        \ifthenelse{\equal{\@Programa}{}}{%
        }{\MakeUppercase{\@Programa}\\}%
        \MakeUppercase{\@Ciudad}\\
        \@Anho
    \newpage}
}
% ------------------------------------------------

% -- Portada del trabajo de grado --
\newcommand{\Portada}{%
    \thispagestyle{empty}
     {\centering
        {\Large\bf\MakeUppercase{\@Titulo}}\\
        \vspace{3cm}
        \vfill
        \MakeUppercase{\@AutorA}\\
        %
        \ifthenelse{\equal{\@AutorB}{}}{\vspace*{\baselineskip}}{\MakeUppercase{\@AutorB}\\}%
        \ifthenelse{\equal{\@AutorC}{}}{\vspace*{\baselineskip}}{\MakeUppercase{\@AutorC}}%
        \vfill
        \@Tipotrabajo\\
        \vfill
        \@Director\\
        \vfill
        \ifthenelse{\equal{\@Institucion}{}}{\vspace*{\baselineskip}}{\MakeUppercase{\@Institucion}\\}%
        \ifthenelse{\equal{\@Facultad}{}}{%
        }{\MakeUppercase{\@Facultad}\\}%
        \ifthenelse{\equal{\@Departamento}{}}{%
        }{\MakeUppercase{\@Departamento}\\}%
        \ifthenelse{\equal{\@Programa}{}}{%
        }{\MakeUppercase{\@Programa}\\}%
        \@Ciudad\\
        \@Anho
    \newpage}
}
% ---------------------------------------------

% -- Página de aceptación --
\newcommand{\Aceptacion}{
    \thispagestyle{empty}
    \hfill
    \noindent
    \begin{minipage}{0.45\textwidth}
        \begin{center}
            Nota de aceptación:\\[10pt]
            \hrulefill\\
            \hrulefill\\
            \hrulefill\\
            \hrulefill\\
            \hrulefill\\
            \hrulefill\\
            \vspace{5cm}
            \hrulefill\\
            \@JuradoA\\
            \vspace{2cm}
            \hrulefill\\
            \@JuradoB
        \end{center}
    \end{minipage}
    \vfill
    \noindent\@Ciudad, \@Dia\ de \@Mes\ de \@Anho.
    \newpage
}
% --------------------------------------------

% -- Dedicatoria --
\newcommand{\Dedicatoria}[2][]{
    \thispagestyle{empty}
    \vspace*{3\baselineskip}
    \hfill
    \noindent
    \begin{minipage}{0.75\textwidth}
        \begin{flushright}
            \textit{#2}\\[5pt]
            #1\par
            \vspace*{3\baselineskip}
        \end{flushright}
    \end{minipage}
}
% --------------------------------------------

% -- Agradecientos --
\newcommand{\Agradecientos}[2][]{
    {\large #2}\par
    #1\par
    \vspace*{2\baselineskip}
}
% --------------------------------------------

% -- Contenido --
\setcounter{tocdepth}{4}
\setcounter{secnumdepth}{4}

\newcommand{\Contenido}{
	\renewcommand{\contentsname}{%
        \vspace{\baselineskip}
        \large{\bf{CONTENIDO}}\\
        \vspace{\baselineskip}
        \hfill \normalfont Pág.
    }     {\renewcommand{\@dotsep}{450}\parskip=0pt\mdseries\normalfont\tableofcontents}
}
% --------------------------------------------

% -- Lista de figuras --
\newcommand{\Listadefiguras}{
	\renewcommand{\listfigurename}{%
        \vspace{\baselineskip}
        \large{\bf LISTA DE FIGURAS}\\
        \vspace{\baselineskip}
        \hfill\normalfont Pág.
    }
	{\renewcommand{\@dotsep}{450}\parskip=0pt\mdseries\normalfont\listoffigures}
    \addcontentsline{toc}{chapter}{LISTA DE FIGURAS}
}
% --------------------------------------------

% -- Lista de tablas --
\renewcommand{\tablename}{Tabla}
\newcommand{\Listadetablas}{
	\renewcommand{\listtablename}{
        \vspace{\baselineskip}
        \large{\bf LISTA DE TABLAS}\\
        \vspace{\baselineskip}
        \hfill\normalfont Pág.
    }
	{\renewcommand{\@dotsep}{450}\parskip=0pt\mdseries\normalfont\listoftables}
    \addcontentsline{toc}{chapter}{LISTA DE TABLAS}
}

% -- Lista de anexos (opcional) --
% -- Glosario (opcional) --
% -- Resumen --
\newcommand{\Resumen}[1][]{
    \newpage
    \begin{center}
        \normalfont\large\bfseries RESUMEN
    \end{center}
    #1
    \addcontentsline{toc}{chapter}{RESUMEN}
}
% --------------------------------------------

% -- Títulos de primer nivel --
\titleformat{\chapter}[hang]
{\centering\normalfont\Large\bfseries}
{\thechapter. }
{0cm}
{}[]

\titlespacing{\chapter}
{0pt} %margen a la izquierda
{-2\baselineskip}%Espacio antes del
{1\baselineskip} %Espacio luego del titulo

% -- Títulos de segundo nivel --
\titleformat{\section}[hang]
{\normalfont\large\bfseries}
{\thesection}
{1em}
{}[]

\titlespacing{\section}
{0pt} %margen a la izquierda
{1\baselineskip} %Espacio antes del titulo
{-1\baselineskip} %Espacio luego del titulo

% -- Títulos de tercer nivel --
\titleformat{\subsection}[runin]
{\normalfont\large\bfseries}
{\thesubsection}
{1em}
{}[]

\titlespacing{\subsection}
{0pt} %margen a la izquierda
{1\baselineskip} %Espacio antes del titulo
{2em} %Espacio luego del titulo

% -- Títulos de CUARTO nivel --
\titleformat{\subsubsection}[runin]
{\normalfont\bfseries}
{\thesubsubsection}
{1em}
{}[]

\titlespacing{\subsubsection}
{0pt} %margen a la izquierda
{1\baselineskip} %Espacio antes del titulo
{2em} %Espacio luego del titulo
% --------------------------------------------

% -- Bibliografia --
\renewcommand{\bibname}{\normalsize BIBLIOGRAFÍA}
% --------------------------------------------
