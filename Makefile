
   
.DEFAULT_GOAL := development

development:
	crystal run ./src/crystal-lang-crypto-rates.cr

build:
	crystal build -Dpreview_mt --progress --error-trace -o bin/rates ./src/crystal-lang-crypto-rates.cr