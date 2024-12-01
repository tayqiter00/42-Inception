all : up

up : 
	@docker compose -f ./srcs/compose.yaml up -d

down : 
	@docker compose -f ./srcs/compose.yaml down

stop : 
	@docker compose -f ./srcs/compose.yaml stop

start : 
	@docker compose -f ./srcs/compose.yaml start

status : 
	@docker ps