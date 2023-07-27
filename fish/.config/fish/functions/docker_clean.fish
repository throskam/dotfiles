function docker_clean
	docker system prune -a
	docker volume prune
end
