# Определяем путь к файлу конфигурации
if ($env:ProgramFiles -match "Docker Desktop") {
    $configFile = "$env:USERPROFILE\.docker\daemon.json"
} else {
    $configFile = "C:\ProgramData\docker\config\daemon.json"
}

# Создаем директорию, если она не существует
if (!(Test-Path -Path (Split-Path -Path $configFile -Parent))) {
    New-Item -ItemType Directory -Force -Path (Split-Path -Path $configFile -Parent)
}

# Добавляем конфигурацию зеркала
$jsonContent = @"
{
    "registry-mirrors": [ "https://dockerhub.timeweb.cloud" ]
}
"@

Set-Content -Path $configFile -Value $jsonContent

# Перезапускаем Docker
Restart-Service -Name "docker"

Write-Host "Конфигурация Docker обновлена."
