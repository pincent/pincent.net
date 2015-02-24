build:
	docker-compose build
	docker-compose up

bash:
	docker run -it --rm -v="$$(pwd):/pincent" -p="4000:4000" pincentnet_frontend bash

serve:
	docker run --rm -v="$$(pwd):/pincent" -p="4000:4000" pincentnet_frontend jekyll serve

.PHONY: build bash serve
