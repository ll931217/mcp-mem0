docker-build:
	docker build -t mcp/mem0 --build-arg PORT=8050 .

docker-run:
	docker run -di --env-file .env -p 8050:8050 --restart unless-stopped --name mcp-mem0 mcp/mem0
