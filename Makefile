.PHONY: all proposal clean

LATEX= pdflatex --shell-escape
BIBTEX= bibtex
XDVI = xdvi
DVIPDF= dvipdfm -p letter
PS2PDF= ps2pdf
DVIPS= dvips -t letter -P pdf
RM = /bin/rm -f
CAT = cat
ISPELL = ispell
SORT = sort

MAINDOC = main
MAINPDF = ${MAINDOC}.pdf

PROPOSAL = proposal
PROPOSALPDF = ${PROPOSAL}.pdf

OUTPUT_DIR = out
FLAGS = -output-directory=${OUTPUT_DIR}

all: clean | ${OUTPUT_DIR}
	${LATEX} ${FLAGS} ${MAINDOC}.tex
	${BIBTEX} ${OUTPUT_DIR}/${MAINDOC}.aux
	${LATEX} ${FLAGS} ${MAINDOC}.tex
	${LATEX} ${FLAGS} ${MAINDOC}.tex

proposal: clean | ${OUTPUT_DIR}
	${LATEX} ${FLAGS} ${PROPOSAL}.tex
	${BIBTEX} ${OUTPUT_DIR}/${PROPOSAL}.aux
	${LATEX} ${FLAGS} ${PROPOSAL}.tex
	${LATEX} ${FLAGS} ${PROPOSAL}.tex

${OUTPUT_DIR}:
	mkdir -p ${OUTPUT_DIR}

clean:
	rm -f *.log *.bak*
	rm -rf ${OUTPUT_DIR}
