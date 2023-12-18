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