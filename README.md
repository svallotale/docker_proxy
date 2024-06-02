# Прокси сервер для Docker / Docker hub

Скрипт вносит адрес прокси сервера [timeweb](https://timeweb.cloud/), что позволяет использовать docker без ограничений в РФ.

## Windows

1. Запустить **_PowerShell_** от имени **_администратора_**.
2. Запустите следующую команду:

```powershell
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/svallotale/docker_proxy/scripts/window/configure-docker.ps1" -OutFile "configure-docker.ps1"
.\configure-docker.ps1
```

## Linux

1. Выполните следующую команду в терминале:

```bash
curl -O https://raw.githubusercontent.com/svallotale/docker_proxy/scripts/linux/configure-docker.sh
chmod +x configure-docker.sh
sudo ./configure-docker.sh
```


### Явное указания адреса
При pull запросах явно укажите адрес проксирование и требуемый образ `dockerhub.timeweb.cloud`

```bash
docker pull dockerhub.timeweb.cloud/node:20-alpine
```
