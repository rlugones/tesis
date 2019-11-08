# You want latexmk to *always* run, because make does not have all the info.
# Also, include non-file targets in .PHONY so they are run regardless of any
# file of the given name existing.
.PHONY: all clean clean-all

test: paper2.pdf

todo: paper2.pdf clean

# MAIN LATEXMK RULE

# -pdf tells latexmk to generate PDF directly (instead of DVI).
# -pdflatex="" tells latexmk to call a specific backend with specific options.
# -use-make tells latexmk to call make for generating missing files.

# -interactive=nonstopmode keeps the pdflatex backend from stopping at a
# missing file reference and interactively asking you for an alternative.

%.pdf: %.ps
	ps2pdf $< $@

%.ps: %.tex
	latexmk -bibtex -ps -use-make $<

clean:
	mv paper2.pdf tempXYZ
	latexmk -silent -CA; rm paper2Notes.bib
	mv tempXYZ paper2.pdf
