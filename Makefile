output = ./_book
qmd_files := $(wildcard *.qmd)
rds_files := $(wildcard *.rds)
html_files := $(wildcard $(output)/*.html)

default: $(html_files)

all:
	quarto render

$(output)/%.html: %.qmd $(rds_files) weird.bib before-each-chapter.R apa-single-spaced.csl otexts.scss _quarto.yml
	quarto render --to html $<

launch:
	vivaldi _book/index.html

deploy:
	cp .htaccess _book
	rsync -zrvce 'ssh -p 18765' _book/ u192-zw4zvui1lqsb@m80.siteground.biz:www/otexts.com/public_html/weird

clean:
	rm -rf _book
	rm -rf _freeze
	rm -rf *_cache
	rm -rf *_files
