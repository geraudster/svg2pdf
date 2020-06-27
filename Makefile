build:
	docker build -t geraudster/svg2pdf .

run:
	docker run --rm -v $(PWD)/input.zip:/home/inkscape/input.zip -v $(PWD)/output/:/home/inkscape/output/ -it geraudster/svg2pdf ./convert.sh 96
