
TARGET=dome.tex

SVG=$(wildcard images/*.svg)

all: dome 

%.pdf: %.svg
	inkscape --export-pdf $(@) $(<)

convention: convention.tex

	TEXFONTS=:./fonts TEXINPUTS=:./fonts pdflatex $@

dome: $(TARGET) convention $(SVG:.svg=.pdf)

	TEXFONTS=:./fonts TEXINPUTS=:./fonts pdflatex $(TARGET)

clean:
	rm -f *.aux *.log *.snm *.out *.toc *.nav *intermediate *~ *.glo *.ist $(SVG:.svg=.pdf)

distclean: clean
	rm -f $(TARGET:.tex=.pdf)
