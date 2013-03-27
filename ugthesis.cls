%% Copyright (c) 2013, James Stark
%% All rights reserved.
%%
%% Redistribution and use in source and binary forms, with or without 
%% modification, are permitted provided that the following conditions 
%% are met:
%%
%% 1. Redistributions of source code must retain the above copyright
%%    notice, this list of conditions and the following disclaimer.
%% 2. Redistributions in binary form must reproduce the above copyright
%%    notice, this list of conditions and the following disclaimer in the
%%    documentation and/or other materials provided with the distribution.
%%
%% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
%% "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
%% LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
%% PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT 
%% HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
%% SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT 
%% LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, 
%% DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY 
%% THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
%% (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
%% OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ugthesis}[2013/03/22 v1.0 University of Guelph Thesis Class]

%%
%% Conditionals needed to control line spacing and margin widths
%%

\newif\ifwidemargins
	\widemarginsfalse

\newif\ifdoublesp
	\doublespfalse

\newif\ifchangesp
	\changespfalse

%%
%% Options for the class
%%
%% Quality Options:  These are options of the underlying memoir class.  They
%% are just passed though to it, with no further processing.
%%
%% draft - Generate a draft document.  Mark overfull hboxes, and outline graphcs.
%% final - Generate a final document.  This is usually what is desired.
%%
%% Font Size options:  These are options of the underlying memoir class.  They
%% are just passed though to it.
%%
%% 10pt - set the normal font size to 10pt
%% 11pt - set the normal font size to 11pt
%% 12pt - set the normal font size to 12pt
%%
%% Spacing options:  These set the spacing for the main test of the document.
%% Floats, the titlepage and footnote are always single spaced.
%%
%% single  - Single space the document
%% onehalf - Use one and a half spacing for the document
%% double  - Double space the document.
%%
%% Layout Options:  These options control the pagesize and the layout of the 
%% document.  The pagesize will be passed to the memoir class.
%%
%% ebook       - Format for an ereader.  6x9 paper and 1in margins.
%% modern      - Use letter paper and LaTeX default margins.
%% traditional - Use letter paper and the more traditional margins for a 
%%               thesis.  The margines will be 1.5in on the left and 1in on 
%%               the top, right and bottom.
%%
%% The default values are:  final, 10pt, single and modern.  Any option not 
%% in this list will generate a warning.
%%

\DeclareOption{draft}{\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{final}{\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{10pt}{\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{11pt}{\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{12pt}{\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{single}{\changespfalse\doublespfalse}
\DeclareOption{onehalf}{\changesptrue\doublespfalse}
\DeclareOption{double}{\changesptrue\doublesptrue}
\DeclareOption{ebook}{\PassOptionsToClass{\CurrentOption}{memoir}\widemarginsfalse}
\DeclareOption{modern}{\PassOptionsToClass{letterpaper}{memoir}\widemarginsfalse}
\DeclareOption{traditional}{\PassOptionsToClass{letterpaper}{memoir}\widemarginstrue}
\DeclareOption*{\PackageWarning{ugthesis}{Unknown Option '\CurrentOption'}}

\ExecuteOptions{10pt,final,single,modern}
\ProcessOptions\relax

\LoadClass[openany,oneside,titlepage]{memoir}

%%
%% Commands defined by this class.  They should all occur in the preamble.  
%% All are manditory.
%%
%% \advisor       - The name of the students advisor.  For multiple advisors, 
%%                  enter both names, seperated by a line break.  Used on the
%%                  abstract.
%% \degree        - The name of the degree that will be conferred.  Used on 
%%                  the title page.
%% \degreeprogram - The students program.  Used on the title page.
%% \degreemonth   - The month in which the dregee will be conferred.  Should 
%%                  be spelled out in full.  Used on the title page.
%% \degreeyear    - The year in which the degree will be conferred.  Used on
%%                  the title page and abstract.

\newcommand*{\advisor}[1]{\def\@advisor{#1}}
\newcommand*{\degree}[1]{\def\@degree{#1}}
\newcommand*{\degreeprogram}[1]{\def\@degreeprogram{#1}}
\newcommand*{\degreemonth}[1]{\def\@degreemonth{#1}}
\newcommand*{\degreeyear}[1]{\def\@degreeyear{#1}}

%% 
%% Default names of lists and environments defined in this class.
%%

\renewcommand*{\abstractname}{ABSTRACT}
\newcommand*{\acknowledgename}{Acknowledgments}

%%
%% The University of Guelph Thesis requirements state that there must be at
%% least two lines of teext between the a heading and the bottom of a page.  
%% They also state that a page may not end wit a hyphen.  \clubpenalty will
%% enforce the minimum of two lines of text rule.  \brokenpenalty will 
%% make sure that the page doesn't end in a hyphen.  \ragged bottom, gives
%% latex some room to work with these requirements.  \widowpenalty will cause
%% latex to not put the last line of a paragraph at the top of a new page.  It
%% isn't explicity required for a Guelph thesis, but it's generally considered
%% good practise to add it with the other two.
%%

\brokenpenalty=9999
\clubpenalty=9999
\widowpenalty=9999
\raggedbottom

%%
%% The Univerisity of Guelph Thesis requiements state that there should be a 
%% blank line between paragraphs.  The memoir class provides an easy way to do
%% this with \nonzeroparskip.
%%

\nonzeroparskip

%%
%% Most LaTeX document classes, including memoir, single space the document 
%% by default.  If the user specifis a non-default line spacing then it will
%% be set here.  The default is to do nothing.
%%

\ifchangesp
	\ifdoublesp
		\DoubleSpacing
	\else
		\OnehalfSpacing
	\fi
\fi

%%
%% Set wide margins.  If wide margines are turned on by the options then they
%% will be set here.  The procedure was adapted from the manual for the memoir
%% class.
%%

\ifwidemargins
	% left and right margins
	\setlrmarginsandblock{1.5in}{1in}{*}

	% top margin
	\setlength{\topmargin}{0in}
	\setlength{\headheight}{\onelineskip}
	\setlength{\headsep}{\baselineskip}
	\addtolength{\headsep}{-\topskip}
	\setlength{\uppermargin}{1in}
	\addtolength{\uppermargin}{\headheight}
	\addtolength{\uppermargin}{\headsep}

	% bottom margin
	\setlength{\lowermargin}{1in}
	\setlength{\textheight}{\paperheight}
	\setlength{\footskip}{2\onelineskip}
	\addtolength{\textheight}{-\uppermargin}
	\addtolength{\textheight}{-\lowermargin}
	\addtolength{\textheight}{-\footskip}
\fi

%%
%% The memoir class by default numbers chapters and sections only.  Also only
%% chapters and sections are included in the table of contents.  For a Thesis
%% everything from chaters to subsubsections needs to be numbered and included
%% in the table of contents.
%%

\setsecnumdepth{subsubsection}
\maxtocdepth{subsubsection}

%%
%% For the table of contents and all of the lists, the memoir class does not 
%% require a new page.  For a Thesis, all of these must start on a new page.
%% Each command is overridden by a version that calls clear page, which 
%% forces a page break if necessary, then calls the original command.  In the
%% case of the table of contents the starrd version is used to keep the the 
%% table of contents from being listed in the table of contents.
%%

\let\OldTableofcontents\tableofcontents
\renewcommand{\tableofcontents}{%
	\clearpage
	\OldTableofcontents*
}

\let\OldListoftables\listoftables
\renewcommand{\listoftables}{%
	\clearpage
	\OldListoftables
}

\let\OldListoffigures\listoffigures
\renewcommand{\listoffigures}{%
	\clearpage
	\OldListoffigures
}

%%
%% The University of Guelph Thesis requierment state that the frontmatter
%% should be numbered using lowercase roman numerals, with the page number in
%% the top right corner.  The mainmatter should be numbered in arabic numerals,
%% with the number placed in the top centre or bottom centre position.  The
%% frontmatter and mainmatter commands handle the conversion between roman and
%% arabic numerals, however they don't handle the location of the page numbers.
%% 
%% The frontmatter and main mattercommands are overridden here to switch the
%% position of the page numbers before calling the original command.  The 
%% memoir class provides a ``simple'' page style which works for the 
%% frontmatter, and a ``plain'' page style that meets the needs of the 
%% mainmatter.  Memoir uses an empty page by default for new chapters.  For a
%% Thesis it needs to be set to match the page style of the surrunding pages 
%% in document.  The Contents and Lists in the frontmatter are implemented as
%% chapters.
%%

\let\OldFrontmatter\frontmatter
\renewcommand{\frontmatter}{%
	\OldFrontmatter
	\pagestyle{simple}
	\aliaspagestyle{chapter}{simple}
}

\let\OldMainmatter\mainmatter
\renewcommand{\mainmatter}{%
	\OldMainmatter
	\pagestyle{plain}
	\aliaspagestyle{chapter}{plain}
}

%%
%% Redefined abstract environment.  The university of Guelph, specifis a 
%% specific format for the abstract.  Memoirs abstract environment has to be
%% replaced with one that meets the university's requirments.
%%

\renewenvironment{abstract}{
	\thispagestyle{empty}
	\begin{center}
		\abstractname \par
		\vspace{36bp}
		\textbf{\MakeUppercase{\@title}} \par
		\vspace{36bp}
	\end{center}
	\begin{minipage}[t]{0.7\textwidth}
		\textbf{\@author} \\
		\textbf{University of Guelph, \@degreeyear} \\
	\end{minipage}
	\begin{minipage}[t]{0.29\textwidth}
		\textbf{Advisor:} \\
		\textbf{\@advisor} \\
	\end{minipage}

	\vspace{36bp}
}{\newpage}

%%
%% Acknowledgements environment.  The memoir class doesn't provide an 
%% acknowledgements environment, so one is added here.  It typesets the word
%% ``Acknowedgements'' in bold at the top centre of the page followed by 
%% three blank lines, and the content of the environment.
%%

\newenvironment{acknowledgements}{
	\begin{center}
		{\textbf{\acknowledgename}}\par
	\end{center}
	\vspace{36bp}
}
{\newpage}

%%
%% Title Page:  Formatted to the requirements specified by for a University 
%% of Guelph Thesis.
%%

\renewcommand{\maketitle}{%
\begingroup
	\thispagestyle{empty}
	\let\footnotesize\small
	\let\footnoterule\relax
	\let \footnote \thanks
	\begin{SingleSpace}
		\begin{center}
			\bfseries
			\null\vfil
			{\Large \@title \par}%
			\vfill
			\bigskip by \par \bigskip {\@author} \par
			\vspace{84bp}
			A Thesis \par presented to \par
			The University of Guelph \par 
			\vspace{66bp}
			In partial fulfilment of requirements \par for the degree of \par
			{\@degree} \par in \par {\@degreeprogram} \par
			\vfill
			Guelph, Ontario, Canada \par \bigskip
			\copyright \vspace{0.1in} {\@author, \@degreemonth, \@degreeyear} \par
		\end{center}
	\end{SingleSpace}
\endgroup
}
