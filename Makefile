.phony: all clean mrproper

DOC_NAME=my_thesis

FIGS_DIR=./main/chapter1/fig/ \
         ./main/chapter2/fig/ \
         ./main/chapter3/fig/ \
         ./main/chapter4/fig/ \
         ./main/chapter5/fig/
FIGS_TEX=$(shell find $(FIGS_DIR) -type f -name '*.tex' -not -path "*/settings/*")
FIGS_PDF=$(patsubst %.tex, %.pdf, $(FIGS_TEX))
FIGS_CLR=$(patsubst %.pdf, %.clear, $(FIGS_PDF))
FIGS_VCLR=$(patsubst %.pdf, %.vclear, $(FIGS_PDF))

LTEX_COMPILE=latexmk
LTEXMK_ARGS=-synctex=1 -interaction=nonstopmode -file-line-error -shell-escape -lualatex

minitocdump:
	@mkdir minitocdump

all: coverpage figs minitocdump
	$(LTEX_COMPILE) $(LTEXMK_ARGS) $(DOC_NAME).tex

coverpage: head/coverpage.pdf
figs: $(FIGS_PDF)

open:
	xdg-open $(DOC_NAME).pdf &

%.pdf: %.tex
	cd $(<D) && $(LTEX_COMPILE) $(LTEXMK_ARGS) $(<F)

clean: $(FIGS_CLR) coverpage_clear document_clear clean4all

document_clear: $(DOC_NAME).clear
coverpage_clear: head/coverpage.clear

mrproper: $(FIGS_VCLR) coverpage_vclear document_vclear clean4all

document_vclear: $(DOC_NAME).vclear
coverpage_vclear: head/coverpage.vclear

%.clear: %.tex
	cd $(<D) && $(LTEX_COMPILE) -c $(<F)

%.vclear: %.tex
	cd $(<D) && $(LTEX_COMPILE) -C $(<F)

# to remove
DIRS_BUILD=$(shell find ./ -type d -name 'build')
DIRS_MINTED=$(shell find ./ -type d -name '_minted*')
DIRS_TIKZC=$(shell find ./ -type d -name 'tikz_cache')
FILES_MTC=$(shell find ./ -type f -name '*.mtc*')
FILES_BCF=$(shell find ./ -type f -name '*.bcf')
FILES_LOL=$(shell find ./ -type f -name '*.lol')
FILES_XML=$(shell find ./ -type f -name '*.run.xml')
FILES_FLS=$(shell find ./ -type f -name '*.fls')
FILES_FDB=$(shell find ./ -type f -name '*.fdb_latexmk')
FILES_AUX=$(shell find ./ -type f -name '*.aux')
FILES_LOCK=$(shell find ./ -type f -name '*.auxlock')
FILES_PYG=$(shell find ./ -type f -name '*.pyg')

clean4all:
	rm -rf $(DIRS_BUILD) $(DIRS_MINTED) $(DIRS_TIKZC) minitocdump logs
	rm -f $(FILES_MTC) $(FILES_BCF) $(FILES_LOL) $(FILES_XML) $(FILES_FLS) $(FILES_FDB) $(FILES_AUX) $(FILES_LOCK) $(FILES_PYG)
