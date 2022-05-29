# CEC command sender API for Rapsberry Pi 4

This is a standalone docker image that makes it possible to send CEC commands though a API. It works great with the Raspberry Pi 4 CEC adapter. This script works even when a other process is using the CEC-client and does not block other software from using CEC-client.

## Run Docker

To build:
```bash
docker build -t cec-api-2022 .
```

To first run (inside the repo folder):
```bash
docker run -t -d --device=/dev/vchiq -p 5010:80 --restart=unless-stopped --name="cec-api-2022" cec-api-2022
```

To start:
```bash
docker start $(docker ps -f name="cec-api-2022" -q)
```

## Use API

Endpoint:
http://docker-ip:5010/index.php

Payload for a CEC on command
```json
{"command":"on 1"}
```

Or payload for a CEC custom command:
```json
{"command":"tx 3F:82:10:00"}
```

## Debugging

To enter:
```bash
docker logs cec-api-2022
```

Or check the logs:
```bash
docker exec -it $(docker ps -f name="cec-api-2022" -q) bash
```
