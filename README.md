# BuiltCode - Teste doctor appointment
Teste BuiltCode - Doctor appointment, um sistema para cadastro de pacientes e médicos, permitindo o agendamento de consultas.

![Captura de Tela Teste | BuiltCode Doctor Appointment](https://i.ibb.co/XD396by/image.png)

## O teste:

Desenvolver um sistema de médicos e pacientes, respeitando os requisitos e regras de negócio apresentadas.
 
#### Tecnologias Obrigatorias:
  - Ruby On Rails
  
## Instruções
  As intruções a seguir orientam como configurar e executar esta aplicação em seu próprio ambiente para teste. Para mais instruções sobre como publicar o APP leia a seção Deployment.
 
#### Pré-requisitos

* Ruby 2.7.1p83
* Bundler
* mysql2

#### Instalando

Clone o repositório para seu ambiente
```
$ git clone https://github.com/LPBR/builtcode-doctor-appointment.git
```

Acesse o diretório builtcode-doctor-appointment e execute o bundler para instalar as dependências do projeto
```
$ cd builtcode-doctor-appointment
$ bundle install
```

Agora basta inciar o servidor de desenvolvimento e acessar através do navegador.
O endereço padrão definido é: http://localhost:3000
```
$ rails s
```

#### Executando os testes
  Testes foram escritos para os models, controllers e rotas. Com o comando abaixo é possível executálas.
```
$ rspec
```

#### Deployment
  Para correta execução em um ambiente de produção as seguintes variáveis de ambiente devem ser definidas:
  > < substituir > - O conteúdo entre < > deve ser substituído de acordo com seu ambiente.
  *  RAILS_ENV=production
  *  RACK_ENV=production
  *  SECRE_KEY_BASE = < chave gerada pelo comando rails secret >
  *  DB_NAME = < nome da base de dados mysql >
  *  DB_HOST = < endereço do host de banco de dados >
  *  DB_USER = < usuário do banco de dados >
  *  DB_PASS = < senha do banco de dados >
