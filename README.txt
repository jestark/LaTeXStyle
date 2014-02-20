ugthesis.cls: University of Guelph Thesis Class; Version 1.1, February 2014

List of Files:
	README.txt            - This file (Documentation).
	ugthesis.cls          - The thesis class
	Thesis_template.tex   - Template for the Thesis
	Abstract_template.tex - Template for the Abstract

Contents:
	Introduction    - Introduction and general notes
	Options         - Options to the thesis class
	Commands        - Commands defined by the thesis class
	Environments    - Environments contained in the thesis class
	Git Repository  - Structure of the repository containing this class
	
Introduction:

The University of Guelph Thesis Class is designed to format a LaTeX document 
according to the University of Guelph's thesis style guidelines, documented 
at [1] and [2].  Since the thesis style guidelines are revised occasionally, 
you should review them and makes sure that your thesis conforms.  While this 
class will do its best to format the thesis in accordance with the guidelines 
as they were at the time that the class was written, nothing is perfect and 
neither the class or its author should be blamed if your thesis gets rejected 
due to improper formatting.  Furthermore, there are a few items (size of 
tables/figures, etc.) that this class can not control.  In most cases, the 
thesis class should do the right thing almost automatically.

This class decorates the memoir document class and includes the url and 
hyperref packages.  The url package has been configured to aggressively break 
URL's across lines, breaking on dashes and spaces in addition to the dots and 
slashes used normally.  Hyperref has been configured to colour the text of the 
hyperlinks inserted into your thesis (including citations and cross 
references).  If you would prefer the default behaviour of drawing a box 
around the link then specify the "boxlink" option.  The memoir document class 
has an extensive manual, which you may find useful.  It is available at [3].  
In the remainder of this file you will find documentation of the commands and 
options defined by the ugthesis class.  Most of the commands documented here 
are required to build the thesis.  A few of the commands are optional and 
have been marked as such.

Included with this file and the ugthesis class are two template file to help 
you get started.

Good luck.

[1] https://www.uoguelph.ca/graduatestudies/thesis/general-format
[2] https://www.uoguelph.ca/graduatestudies/thesis/arrangement
[3] http://mirrors.ctan.org/macros/latex/contrib/memoir/memman.pdf

Options:

draft       - Do not build hyper links, include graphics, and highlight over 
              full boxes.  Used by the underlying memoir class and other 
              packages.

final       - Hide all hyperlinks.  Option is also used by other packages 

10pt        - Typeset the body of the thesis using a 10 point font (default)

11pt        - Typeset the body of the thesis using a 11 point font

12pt        - Typeset the body of the thesis using a 12 point font

boxlink     - Draw coloured boxes around the hyperlinks (including citations 
              and cross references) instead of colouring the text

single      - Typeset the body text of the thesis single spaced (default)

onehalf     - Typeset the body text of the thesis with one and a half spacing

double      - Typeset the body text of the thesis double spaced

ebook       - Used by the underlying memoir class.  Format the thesis with a 
              smaller page size suitable for reading on tablets and 
              e-readers.  Single spacing and a 10pt font are strongly 
              recommended with this option.  Also note that the maximum size 
              for a diagram is:  100mm x 174mm.

modern      - Format the thesis on letter sized paper with LaTeX's default 
              margins.  It works out to about 1.5" on all sides and is 
              generally considered to be the easiest to read. (default)

traditional - Format the thesis on letter sized paper with 1" margins on the 
              top bottom and right, and a 1.5" on the left (for binding).  
              This is the more traditional style, commonly used with word 
              processors.

Commands:

\advisor          - The name of your advisor.  It appears above the abstract. 
                    If you have multiple advisors then separate their names 
                    with a line break (\\).  For example:
                    \advisor{Dr. J. Advisor \\ Dr. K. Co-Advisor}

\degree           - The name of your degree.  Usually this is either "Master 
                    of Science" or "Doctor of Philosophy."  It appears on the 
                    title page of your thesis.

\degreeprogram    - The name of your degree program as specified in the 
                    graduate calendar.  For example "Computer Science."  It 
                    appears on the title page of your thesis and will be used 
                    in the PDF document properties if \thesissubject isn't 
                    set. 

\degreemonth      - The full name of the month in which your thesis is 
                    published (i.e. "January"). It appears on the title page.

\degreeyear       - The year in which your thesis is published (i.e. "2014"). 
                    It appears on the title page and above the abstract.

\thesissubject    - The subject of your thesis.  This appears in the PDF 
                    document properties.  \degreeprogram is used if this is 
                    not set.  (Optional)

\thesiskeywords   - A list of keywords for your thesis.  Appears in the PDF 
                    document properties.  The keywords property is only set 
                    if this options has been specified.  (Optional)

\listofalgorithms - Generate a list of algorithms to appear in the 
                    front matter of the thesis.  This command replaces the 
                    algorithm package, which does not typeset the list of 
                    algorithms properly.  Note that if you are using 
                    typesetting algorithms in your thesis, then you will 
                    still need the appropriate algorthmic package.

Environments:

abstract         - Typesets the abstract of the thesis on its own page with 
                   the header specified in the thesis style guidelines.

acknowledgements - Typesets the acknowledgements on their own page with the 
                   appropriate header as specified in the thesis style 
                   guidelines.

dedication       - Typesets the dedication horizontally and vertically 
                   centred on its own page.  (Optional)

Git Repository:
The thesis class is developed and stored in a git repository.  In order to 
allow for maximum flexibility the repository contains three branches, which 
are organized as follows: 

master    - Contains the most up-to-date production version of the thesis 
            class along with the templates and this documentation.

style     - Contains the most up-to-date production version of the thesis 
            class only.  This branch is intended to be used by anyone who is 
            keeping their thesis in git and wishes to pull in a copy of the 
            thesis class without the other components.

style-dev - Development of the thesis class is done here.