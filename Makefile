COMPOSE_FILE   =  srcs/docker-compose.yml

DATA_PATH =  /home/brbaazi/data

all :
	@mkdir  -p $(DATA_PATH)/mysql
	@mkdir  -p $(DATA_PATH)/wordpress
	@docker-compose  -f $(COMPOSE_FILE) up --build  -d

down :
	@docker-compose -f  $(COMPOSE_FILE) down

clean :
	@docker-compose  -f  $(COMPOSE_FILE) down  --rmi  all

fclean : clean
	@rm  -rf  $(DATA_PATH)

re : fclean all

status  :
	@docker-compose -f  $(COMPOSE_FILE) ps

logs:
	@docker-compose -f  $(COMPOSE_FILE) logs

.PHONY :  all  down  clean  fclean  re  status  logs