# Banco de Dados de Passagens Aéreas

Este projeto demonstra uma solução prática em SQL para simular o funcionamento de uma plataforma de vendas de passagens aéreas. A proposta é reunir modelagem relacional, regras de negócio, carregamento de dados e consultas em um único repositório com foco em clareza, organização e aplicação real.

## Objetivo do projeto

O repositório foi criado para mostrar, de forma objetiva, como estruturar um banco de dados relacional para um cenário de reservas de voos, incluindo:

- modelagem de entidades e relacionamentos;
- definição de constraints para garantir integridade dos dados;
- uso de comandos DDL, DML e DQL;
- execução de consultas com joins, agregações e funções window;
- exemplos de atualização e remoção com critérios específicos.

## Cenário abordado

O modelo representa um ambiente de vendas de bilhetes, em que:

- cada voo pertence a uma companhia aérea e conecta dois aeroportos;
- passageiros e voos se relacionam por meio de uma tabela de reservas;
- cada reserva armazena informações como assento, classe, status, preço pago e data;
- regras de negócio são aplicadas por meio de constraints para evitar inconsistências.

## Regras de negócio implementadas

- um voo não pode ter o mesmo aeroporto como origem e destino;
- códigos IATA e CPF são únicos;
- o valor pago em uma reserva deve ser maior que zero;
- a classe e o status da reserva são controlados por valores válidos.

## Estrutura do repositório

- [01_cria.sql](01_cria.sql): scripts de criação das tabelas e constraints;
- [02_insere.sql](02_insere.sql): inserção de dados fictícios para popular o banco;
- [03_consultas.sql](03_consultas.sql): exemplos de consultas SQL com diferentes níveis de complexidade;
- [04_atualiza_remove.sql](04_atualiza_remove.sql): exemplos de atualização e remoção com uso de WHERE.

## Tecnologias utilizadas

- PostgreSQL
- SQL
- Modelagem relacional

## Como executar

1. Crie um banco de dados no PostgreSQL:

```sql
CREATE DATABASE passagens_aereas;
```

2. Execute os scripts na ordem abaixo:

```bash
psql -d passagens_aereas -f 01_cria.sql
psql -d passagens_aereas -f 02_insere.sql
psql -d passagens_aereas -f 03_consultas.sql
psql -d passagens_aereas -f 04_atualiza_remove.sql
```

## Exemplos de consultas incluídas

O projeto contempla consultas para responder perguntas como:

- quais passageiros possuem nomes que iniciam com determinada letra;
- quantas reservas existem por status;
- quais voos são operados por cada companhia;
- quais reservas tiveram valores acima da média;
- como numerar reservas de cada passageiro em ordem cronológica.

## Habilidades demonstradas

Este projeto é uma boa demonstração de competências em:

- SQL e PostgreSQL;
- modelagem de banco de dados;
- definição de integridade e regras de negócio;
- escrita de consultas e análise de dados;
- organização de scripts em um projeto profissional.

## Destaque para portfólio

Este repositório pode ser utilizado como exemplo de trabalho prático em banco de dados, especialmente para mostrar domínio em SQL, estruturação de dados e resolução de problemas reais em ambientes de negócios.
