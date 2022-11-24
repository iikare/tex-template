wild = $(strip $(foreach d,$(wildcard $1*),$(call wild,$d/,$2) $(filter $(subst *,%,$2),$d)))
NAME = $(basename $(call wild,./,*.tex))

# prevent deletion of temporary files before all jobs are done
MAKEFLAGS += --jobs=1

# temporary generated files
suffix= .aux  .log .out  .nav  .snm  .toc  .thm

all: $(addsuffix .pdf, $(NAME))

$(addsuffix .pdf, $(NAME)): $(addsuffix .tex, $(NAME))
	pdflatex --shell-escape $(addsuffix .tex, $(basename $@))
	rm -f $(addprefix $(basename $@), $(suffix))
	rm -f texput.log
	rm -rf _minted*

re:
	@$(MAKE) -B --no-print-directory
