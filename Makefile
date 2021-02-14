all: gitbook

gitbook:
	Rscript -e 'bookdown::render_book("index.Rmd", "bookdown::gitbook", quiet=FALSE)'
	sed -i -f htmlreplace.sed public/*.html

deploy:
	cp .htaccess public
	rsync -zrvce 'ssh -p 18765' public/ u192-zw4zvui1lqsb@m80.siteground.biz:www/otexts.com/public_html/weird

clean:
	rm -rf public
	rm -rf _bookdown_files
