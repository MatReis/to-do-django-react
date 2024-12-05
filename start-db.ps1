# Caminho do docker-compose.yml
$dockerComposeFile = ".\docker-compose.yml"

Write-Host "Levantando o container PostgreSQL..." -ForegroundColor Green

# Executar o comando docker-compose up
docker-compose -f $dockerComposeFile up -d

if ($LASTEXITCODE -eq 0) {
    Write-Host "Container levantado com sucesso!" -ForegroundColor Green
} else {
    Write-Host "Erro ao levantar o container!" -ForegroundColor Red
}
