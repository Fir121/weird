qmd_files := $(wildcard *.qmd)
css_files := $(wildcard *.css)

all: build launch

build: $(qmd_files) $(css_files) weird.bib before-each-chapter.R apa-single-spaced.csl
	quarto render --to html

launch: 
	vivaldi docs/index.html

deploy: 
	cp .htaccess docs
	rsync -zrvce 'ssh -p 18765' public/ u192-zw4zvui1lqsb@m80.siteground.biz:www/otexts.com/public_html/weird

clean:
	rm -rf docs
	rm -rf _bookdown_files
