NAME=steam-cmd
VERSION=latest
PORT=27015

build-tf:
	docker build . -t $(NAME)-tf:$(VERSION) --build-arg GAME=tf

build-csgo:
	docker build . -t $(NAME)-csgo:$(VERSION) --build-arg GAME=csgo

run-tf: rm
	docker run -dt --name $(NAME) -p $(PORT):$(PORT) -p $(PORT):$(PORT)/udp -e MOTD="Welcome to our adesso Workshop Team Fortress 2 Server!" $(NAME)-tf:$(VERSION) +map ctf_2fort

run-csgo: rm
	docker run -dt --name $(NAME) -p $(PORT):$(PORT) -p $(PORT):$(PORT)/udp -e MOTD="Welcome to our adesso Workshop CS:GO Server!" $(NAME)-csgo:$(VERSION) +map de_dust2

rm:
	docker rm -f $(NAME) || true

logs:
	docker logs $(NAME) || true
