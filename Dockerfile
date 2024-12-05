# Use a imagem oficial do Python
FROM python:3.10-slim

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia os arquivos de dependências para o container
COPY requirements.txt /app/

# Adicionar dependências do sistema para PostgreSQL
RUN apt-get update && apt-get install -y \
    libpq-dev gcc

# Instala as dependências do projeto
RUN pip install --no-cache-dir -r requirements.txt

# Copia todo o código para o container
COPY . /app/

# Expor a porta 8000 para acesso ao servidor
EXPOSE 8000

# Comando para rodar o servidor Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
