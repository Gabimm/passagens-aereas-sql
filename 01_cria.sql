--CREATE DATABASE passagens_aereas;

-- ============================================================
-- 01_cria.sql
-- Script de criação das tabelas do mini-mundo "Passagens Aéreas"
-- ============================================================

CREATE TABLE aeroporto (
    id_aeroporto  serial PRIMARY KEY,
    nome          varchar(255) NOT NULL,
    cidade        varchar(255) NOT NULL,
    pais          varchar(255) NOT NULL,
    cod_iata      char(3) NOT NULL UNIQUE  
);

CREATE TABLE companhia_area (
    id_companhia  serial PRIMARY KEY,
    nome          varchar(255) NOT NULL,
    cod_iata      char(2) NOT NULL UNIQUE  
);

CREATE TABLE passageiro (
    id_passageiro   serial PRIMARY KEY,
    nome            varchar(255) NOT NULL,
    cpf             varchar(11) NOT NULL UNIQUE,  
    telefone        varchar(20),
    dt_nascimento   date
);

CREATE TABLE voo (
    id_voo               serial PRIMARY KEY,
    idaeroporto_origem   int NOT NULL REFERENCES aeroporto(id_aeroporto),
    idaeroporto_destino  int NOT NULL REFERENCES aeroporto(id_aeroporto),
    idcompanhia_area     int NOT NULL REFERENCES companhia_area(id_companhia),
    num_voo              varchar(10) NOT NULL,
    hora_partida         timestamptz NOT NULL,
    hora_chegada         timestamptz NOT NULL,
    CHECK (idaeroporto_origem <> idaeroporto_destino)  
);

CREATE TABLE reserva (
    id_passageiro  int NOT NULL,
    id_voo         int NOT NULL,
    assento        varchar(5) NOT NULL,
    classe         varchar(20) NOT NULL CHECK (classe IN ('economica', 'executiva')),
    status         varchar(20) NOT NULL CHECK (status IN ('confirmada', 'cancelada', 'pendente')),
    preco_pago     numeric(10,2) NOT NULL CHECK (preco_pago > 0),  -- preço não pode ser zero ou negativo
    data_reserva   date NOT NULL,
    PRIMARY KEY (id_passageiro, id_voo),
    FOREIGN KEY (id_passageiro) REFERENCES passageiro(id_passageiro),
    FOREIGN KEY (id_voo) REFERENCES voo(id_voo)
);