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

1. Criando chave de acesso e grupo de segurança

 - Key Pairs: https://us-east-1.console.aws.amazon.com/ec2/home?region=us-east-1#KeyPairs:
 - Security Group: https://us-east-1.console.aws.amazon.com/ec2/home?region=us-east-1#CreateSecurityGroup:

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

## Configurando Prometheus, Grafana e Alertmanager

1. Conectar Grafana com Prometheus
![](prints/Screenshot%20from%202023-12-19%2009-12-06.png)

2. Criando nova Dashboard
![](prints/Screenshot%20from%202023-12-19%2009-06-25.png)

3. Simulando os alertas no Prometheus
![](prints/Screenshot%20from%202023-12-19%2009-06-05.png)

1. Verificando os alertas no Alertmanager
![](prints/Screenshot%20from%202023-12-19%2009-05-59.png)