# Desenvolvimento de Aplicações Modernas e Escaláveis com Microserviços - [CodeEducation](https://code.education)

## Instruções

```bash
# clonar repositório
$ git clone https://github.com/netoudi/codeflix-microservice-videos.git codeflix

# acessar projeto
$ cd codeflix

# criar ambiente de desenvolvimento - pode ir toma um café porque vai demorar :)
$ docker-compose up -d --build

# OBS: as vezes quando é feito o primeiro build nem todos os serviços estão disponíveis,
# basta fazer um stop e up novamente, para que o ambiente de desenvolvimento inicie os serviços corretamente
$ docker-compose stop
$ docker-compose up -d

# verificar o andamento da instalação
$ docker-compose logs app

# criar dados falsos para teste
$ docker-compose exec app bash
$ cd backend
$ php artisan migrate:refresh --seed

# rodar o frontend da aplicação
$ docker-compose exec app bash
$ cd frontend
$ npm start

# acessar aplicação em: [http://localhost:3000](http://localhost:3000)
```
