wild = $(strip $(foreach d,$(wildcard $1*),$(call wild,$d/,$2) $(filter $(subst *,%,$2),$d)))
NAME = $(basename $(call wild,./,*.tex))

all: $(NAME)

$(NAME):
	echo $(NAME)
	pdflatex --shell-escape $(NAME).tex
	rm -f $(NAME).aux $(NAME).log texput.log $(NAME).out $(NAME).nav $(NAME).snm $(NAME).toc
	rm -rf _minted*
