# Configuração do script
$projectName = "to-do-django-react"
$dockerComposeFile = "docker-compose.yml"

# Exibe uma mensagem para indicar que o script começou
Write-Host "Iniciando o projeto Docker para $projectName..."

# Passo 1: Certifique-se de que o Docker está rodando
# if (-not (Get-Service -Name "Docker" -ErrorAction SilentlyContinue)) {
#     Write-Host "Docker não está rodando. Por favor, inicie o Docker Desktop e tente novamente." -ForegroundColor Red
#     exit
# }

# Passo 2: Construir os containers
Write-Host "Construindo containers..."
docker-compose -f $dockerComposeFile build

# Passo 3: Subir os containers com volumes para sincronizar alterações no código
Write-Host "Subindo containers com docker-compose..."
docker-compose -f $dockerComposeFile up -d

# Passo 4: Aplicar migrações no Django
Write-Host "Aplicando migrations do banco de dados..."
docker exec -it django_app python manage.py makemigrations
docker exec -it django_app python manage.py migrate

# Passo 5: Informar que o projeto está pronto
Write-Host "O projeto esta rodando no Docker! Acesse http://localhost:8000" -ForegroundColor Green
