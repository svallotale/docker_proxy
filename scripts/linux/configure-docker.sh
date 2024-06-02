#!/bin/bash

# Определяем путь к файлу конфигурации в зависимости от режима
if [ "$(id -u)" -eq 0 ]; then
    CONFIG_FILE="/etc/docker/daemon.json"
else
    CONFIG_FILE="$HOME/.config/docker/daemon.json"
fi

# Создаем директорию, если она не существует
mkdir -p "$(dirname "$CONFIG_FILE")"

# Добавляем конфигурацию зеркала
cat <<EOF > "$CONFIG_FILE"
{
    "registry-mirrors": [ "https://dockerhub.timeweb.cloud" ]
}
EOF

# Перезапускаем Docker
if [ "$(id -u)" -eq 0 ]; then
    systemctl reload docker
else
    echo "Перезапустите Docker вручную для применения изменений."
fi

echo "Конфигурация Docker обновлена."
