Rmd_files := $(wildcard *.Rmd)
css_files := $(wildcard *.css)

all: public/index.html launch

public/index.html: $(Rmd_files) $(css_files) weird.bib before-each-chapter.R apa-single-spaced.csl
	Rscript -e 'bookdown::render_book("index.Rmd", "bookdown::gitbook", quiet=FALSE)'

launch: 
	vivaldi public/index.html

deploy: 
	cp .htaccess public
	rsync -zrvce 'ssh -p 18765' public/ u192-zw4zvui1lqsb@m80.siteground.biz:www/otexts.com/public_html/weird

clean:
	rm -rf public
	rm -rf _bookdown_files
