# You want latexmk to *always* run, because make does not have all the info.
# Also, include non-file targets in .PHONY so they are run regardless of any
# file of the given name existing.
.PHONY: all clean clean-all

filename=tesis
C=lualatex

all: compile clean

compile:
	$C $(filename).tex; bibtex $(filename).aux; $C $(filename).tex; $C $(filename).tex;

clean:
	rm -rf $(filename).out $(filename).aux $(filename).bbl $(filename).blg $(filename).log $(filename)Notes.bib *~

printversion:
	pdftk A=tesis.pdf B=src/blankpage.pdf cat A1 B1 A2 B1 A3 B1 A4 B1 A5 B1 A6 B1 A7-end output tesis_imprimir.pdf

finalversion:
	cp tesis_imprimir.pdf LugonesR-PhDThesis.pdf
