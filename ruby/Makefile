init:
	docker compose exec ruby bundle install
	docker compose exec ruby rspec --init

rspec:
	docker compose exec ruby rspec

run xunit:
	docker compose exec xunit ruby xunit.rb