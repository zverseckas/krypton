build:
		@docker build -t zverseckas/krypton .

push:
		@docker push zverseckas/krypton

bp: build push