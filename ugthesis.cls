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
%% Conditionals needed to control line spacing, margin widths and title font
%% size
%%

\newif\ifwidemargins
	\widemarginsfalse

\newif\ifdoublesp
	\doublespfalse

\newif\ifchangesp
	\changespfalse

\newif\ifbigtitle
	\bigtitletrue

%%
%% Options for the class
%%
%% Quality Options:  These are options of the underlying memoir class.  They
%% are just passed though to it, with no further processing.
%%
%% draft - Generate a draft document.  Mark overfull hboxes, and outline graphics.
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
%% Floats, the title page and footnote are always single spaced.
%%
%% single  - Single space the document
%% onehalf - Use one and a half spacing for the document
%% double  - Double space the document.
%%
%% Layout Options:  These options control the page size and the layout of the 
%% document.  The page size will be passed to the memoir class.
%%
%% ebook       - Format for an ereader.  6x9 paper and 1in margins.
%% modern      - Use letter paper and LaTeX default margins.
%% traditional - Use letter paper and the more traditional margins for a 
%%               thesis.  The margins will be 1.5in on the left and 1in on 
%%               the top, right and bottom.
%%
%% The default values are:  final, 10pt, single and modern.  Any option not 
%% in this list will generate a warning.
%%

\DeclareOption{draft}{\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{final}{\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{10pt}{\PassOptionsToClass{\CurrentOption}{memoir}\bigtitletrue}
\DeclareOption{11pt}{\PassOptionsToClass{\CurrentOption}{memoir}\bigtitletrue}
\DeclareOption{12pt}{\PassOptionsToClass{\CurrentOption}{memoir}\bigtitlefalse}
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
%% All are mandatory.
%%
%% \advisor       - The name of the students advisor.  For multiple advisers, 
%%                  enter both names, separated by a line break.  Used on the
%%                  abstract.
%% \degree        - The name of the degree that will be conferred.  Used on 
%%                  the title page.
%% \degreeprogram - The students program.  Used on the title page.
%% \degreemonth   - The month in which the degree will be conferred.  Should 
%%                  be spelled out in full.  Used on the title page.
%% \degreeyear    - The year in which the degree will be conferred.  Used on
%%                  the title page and abstract.

\newcommand*{\advisor}[1]{\def\@advisor{#1}}
\newcommand*{\degree}[1]{\def\@degree{#1}}
\newcommand*{\degreeprogram}[1]{\def\@degreeprogram{#1}}
\newcommand*{\degreemonth}[1]{\def\@degreemonth{#1}}
\newcommand*{\degreeyear}[1]{\def\@degreeyear{#1}}

%%
%% Initial values for all of the fields needed on the title page and abstract.
%%

\author{John Q. Student}
\title{Title of Thesis}
\degree{Name of Degree}
\degreeprogram{Name of Program}
\degreemonth{January}
\degreeyear{0000}
\advisor{Dr. J. Advisor}

%% 
%% Default names of lists and environments defined in this class.
%%

\renewcommand*{\abstractname}{ABSTRACT}
\newcommand*{\acknowledgename}{Acknowledgements}
\newcommand*{\algorithmname}{Algorithm}
\newcommand*{\listalgorithmname}{List of Algorithms}

%%
%% The University of Guelph Thesis requirements state that there must be at
%% least two lines of text between the a heading and the bottom of a page.  
%% They also state that a page may not end wit a hyphen.  \clubpenalty will
%% enforce the minimum of two lines of text rule.  \brokenpenalty will 
%% make sure that the page doesn't end in a hyphen.  \ragged bottom, gives
%% latex some room to work with these requirements.  \widowpenalty will cause
%% latex to not put the last line of a paragraph at the top of a new page.  It
%% isn't explicit required for a Guelph thesis, but it's generally considered
%% good practise to add it with the other two.
%%

\brokenpenalty=9999
\clubpenalty=9999
\widowpenalty=9999
\raggedbottom

%%
%% Contract the list spacing.  By default the lists require too much space.
%% The memoir class provides an option for setting a much tighter inter-item
%% spacing in the lists.  Make this default for the thesis.  The tight list 
%% spacing must be set before the paragraph spacing is changed, otherwise the
%% paragraph separation gets added to the list and negates the list spacing 
%% change.  The behaviour of the paragraph spacing relative to the lists is by
%% design.  So some may consider the fact that changing the list spacing 
%% before the paragraph spacing results in tight lists a bug.  If this 
%% ``bug'' ever gets fixed then we should be able to get the tight list 
%% spacing by overriding the \setnzplist macro and setting to to a no-op.
%%

\tightlists

%%
%% The University of Guelph Thesis requirements state that there should be a 
%% blank line between paragraphs.  The memoir class provides an easy way to do
%% this with \nonzeroparskip.
%%

\nonzeroparskip

%%
%% Most LaTeX document classes, including memoir, single space the document 
%% by default.  If the user specifies a non-default line spacing then it will
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
%% Set wide margins.  If wide margins are turned on by the options then they
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
%% The University of Guelph Thesis requirements state the the title of the 
%% thesis will be set in a 14pt font.  Since this class allows for 10pt, 11pt
%% and 12pt base fonts the title size must be set appropriately.  For to 10pt
%% and 11pt base font, the \Large font size give a 14pt title.  For the 12pt
%% font the \large font size give the 14pt title.  Using \Large with a 12pt
%% base font would give a 17pt title, which is too big.
%%

\ifbigtitle
	\newcommand{\TFSize}{\Large}
\else
	\newcommand{\TFSize}{\large}
\fi

%%
%% Algorithm floating environment.  This replaces the float defined in the 
%% algorithm package with one that is based off of the memoir class.  It 
%% allows for less code to be pulled into the LaTeX document and works a bit 
%% better with the rest of the floats and lists.
%%

\newfloat{algorithm}{loa}{\algorithmname}
\newfixedcaption{\falgcaption}{algorithm}
\newlistentry{algorithm}{loa}{0}

\newlistof{listofalgorithms}{loa}{\listalgorithmname}

%%
%% The memoir class by default numbers chapters and sections only.  Also only
%% chapters and sections are included in the table of contents.  For a Thesis
%% everything from chapters to subsubsections needs to be numbered and 
%% included in the table of contents.
%%

\setsecnumdepth{subsubsection}
\maxtocdepth{subsubsection}

%%
%% For the table of contents and all of the lists, the memoir class does not 
%% require a new page.  For a Thesis, all of these must start on a new page.
%% Each command is overridden by a version that calls clear page, which 
%% forces a page break if necessary, then calls the original command.  In the
%% case of the table of contents the stared version is used to keep the the 
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

\let\OldListofalgorithms\listofalgorithms
\renewcommand{\listofalgorithms}{%
	\clearpage
	\OldListofalgorithms
}

%%
%% The University of Guelph Thesis requirement state that the front matter
%% should be numbered using lowercase roman numerals, with the page number in
%% the top right corner.  The main matter should be numbered in Arabic 
%% numerals, with the number placed in the top centre or bottom centre
%% position.  The front matter and main matter commands handle the conversion
%% between roman and Arabic numerals, however they don't handle the location 
%% of the page numbers.
%% 
%% The front matter and main matter commands are overridden here to switch the
%% position of the page numbers before calling the original command.  The 
%% memoir class provides a ``simple'' page style which works for the 
%% front matter, and a ``plain'' page style that meets the needs of the 
%% main matter.  Memoir uses an empty page by default for new chapters.  For a
%% Thesis it needs to be set to match the page style of the surrounding pages 
%% in document.  The Contents and Lists in the front matter are implemented as
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
%% Redefined abstract environment.  The university of Guelph, specifies a 
%% specific format for the abstract.  Memoirs abstract environment has to be
%% replaced with one that meets the university's requirements.
%%

\renewenvironment{abstract}{
	\thispagestyle{empty}
	\begin{SingleSpace}
		\begin{center}
			\abstractname \\
			\vspace{36bp}
			\textbf{\MakeUppercase{\@title}} \\
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
	\end{SingleSpace}
}{\newpage}

%%
%% Acknowledgements environment.  The memoir class doesn't provide an 
%% acknowledgements environment, so one is added here.  It typesets the word
%% ``Acknowledgements'' in bold at the top centre of the page followed by 
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
%% Dedication Environment.  The memoir class doesn't provide a dedication 
%% environment, so one is added here.  The University of Guelph Thesis 
%% requirements are silent as to the format of the dedication.  Usually a
%% dedication is centred vertically and horizontally on the page, so that has
%% been implemented here.
%%

\newenvironment{dedication}{%
	\clearpage%
	\vspace*{\stretch{1}}%
	\begin{center}%
}
{%
	\end{center}%
	\vspace{\stretch{1}}%
}

%%
%% The University of Guelph Thesis requirements specify the title page for a
%% this via a sample Microsoft word document.  The code below aligns the text 
%% exactly with the template for most common cases.  If the Thesis has a short
%% title (one line) or it typeset with a 10pt font then the vertical spacing 
%% will be off a bit, but should be good enough.  If the title is very long
%% (3 or more lines) then it will probably have issues with vertical spacing
%% as well.  The spacing id specified using relative spacing, rather than
%% absolute spacing.  Using relative spacing allows the title page to be 
%% typeset properly on the ebook version as well as the full sized version.
%%

%% Vertical spacing between the elements on the page is a bit different for
%% wide vs. narrow margins.

\ifwidemargins
	\newcommand{\TPTopSpacing}{10}
	\newcommand{\TPAuthorSpacing}{16}
	\newcommand{\TPThesisSpacing}{24}
	\newcommand{\TPDegreeSpacing}{19}
	\newcommand{\TPCopyrightSpacing}{30}
\else
	\newcommand{\TPTopSpacing}{-2.5}
	\newcommand{\TPAuthorSpacing}{18}
	\newcommand{\TPThesisSpacing}{27}
	\newcommand{\TPDegreeSpacing}{21}
	\newcommand{\TPCopyrightSpacing}{28}
\fi

%% Override the maketitle command with one that creates the properly 
%% formatted title page

\renewcommand{\maketitle}{%
\begingroup
	\thispagestyle{empty}
	\begin{SingleSpace}
		\begin{center}
			\bfseries
			\vspace*{\stretch{\TPTopSpacing}}
			{\TFSize \@title} \par
			\vspace{\stretch{\TPAuthorSpacing}}
			by \\ \bigskip {\@author} \par
			\vspace{\stretch{\TPThesisSpacing}}
			A Thesis \\
			presented to \\
			The University of Guelph \par
			\vspace{\stretch{\TPDegreeSpacing}}
			In partial fulfilment of requirements \\
			for the degree of \\
			{\@degree} \\
			in \\
			{\@degreeprogram} \par
			\vspace{\stretch{\TPCopyrightSpacing}}
			Guelph, Ontario, Canada \\ \bigskip
			\copyright \ {\@author, \@degreemonth, \@degreeyear}
		\end{center}
	\end{SingleSpace}
\endgroup
}
