# Atividade Observability

## Provisionando Instância

1. Criação do arquivo main.tf:

```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "observability" {
  ami           = "ami-0759f51a90924c166"
  instance_type = "t2.micro"

  tags = {
    Name = "Atividade-Observability"
  }
}
```

2. Rodando instância via terraform

```bash
terraform init
terraform plan
terraform apply
```

## Conectando-se a instância via SSH

1. Criando chave de acesso

2. Conectando-se via SSH
   
```bash
ssh -i ./aws-key.pem ec2-user@<ip-address>
```
3. Instalando o Docker
```bash
sudo yum update -y
sudo yum install -y docker
```
4. Instalando o docker-compose
```bash
wget https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) 
sudo mv docker-compose-$(uname -s)-$(uname -m) /usr/local/bin/docker-compose
sudo chmod -v +x /usr/local/bin/docker-compose
```
5. Iniciando Docker e dando permissões:
```bash
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo usermod -a -G docker ec2-user
sudo chmod 666 /var/run/docker.sock
```

## Clonando repositório 

1. Instalando git e make

```bash
sudo yum install -y git make
```

2. Utilizando o docker-compose

```bash
sudo docker-compose up -d
```
