-- ============================================================
-- 02_insere.sql
-- Povoamento das tabelas com dados de exemplo.
-- ============================================================

INSERT INTO aeroporto (nome, cidade, pais, cod_iata) VALUES
('Aeroporto Internacional de Guarulhos', 'São Paulo', 'Brasil', 'GRU'),
('John F. Kennedy International Airport', 'Nova York', 'Estados Unidos', 'JFK'),
('Aéroport Charles de Gaulle', 'Paris', 'França', 'CDG'),
('Aeroporto Humberto Delgado', 'Lisboa', 'Portugal', 'LIS'),
('Aeroporto Internacional do Galeão', 'Rio de Janeiro', 'Brasil', 'GIG');

INSERT INTO companhia_area (nome, cod_iata) VALUES
('LATAM Airlines', 'LA'),
('Gol Linhas Aéreas', 'G3'),
('Azul Linhas Aéreas', 'AD'),
('American Airlines', 'AA'),
('Air France', 'AF');

INSERT INTO passageiro (nome, cpf, telefone, dt_nascimento) VALUES
('Beatriz Nogueira Lima', '12345678901', '+55 81 91234-5678', '1994-03-12'),
('Rafael Santos Andrade', '23456789012', '+55 11 98765-4321', '1988-07-25'),
('Camila Alves Ferreira', '34567890123', '+55 21 99876-5432', '1996-11-02'),
('Thiago Moreira Costa', '45678901234', '+55 81 98123-4567', '1979-01-30'),
('Larissa Pinto Souza', '56789012345', '+55 31 97654-3210', '2001-09-18');

INSERT INTO voo (idaeroporto_origem, idaeroporto_destino, idcompanhia_area, num_voo, hora_partida, hora_chegada) VALUES
(1, 2, 1, 'LA8084', '2026-08-10 22:15:00-03', '2026-08-11 06:40:00-04'),
(2, 1, 1, 'LA8085', '2026-08-15 23:50:00-04', '2026-08-16 09:10:00-03'),
(1, 3, 4, 'AA1032', '2026-08-12 19:30:00-03', '2026-08-13 09:45:00+02'),
(3, 4, 5, 'AF1780', '2026-08-14 07:20:00+02', '2026-08-14 09:05:00+01'),
(5, 1, 2, 'G31456', '2026-08-20 14:00:00-03', '2026-08-20 15:20:00-03');

INSERT INTO reserva (id_passageiro, id_voo, assento, classe, status, preco_pago, data_reserva) VALUES
(1, 1, '12A', 'economica', 'confirmada', 2500.00, '2026-07-01'),
(2, 1, '14C', 'executiva', 'confirmada', 8200.50, '2026-07-02'),
(3, 2, '22B', 'economica', 'pendente',   2600.00, '2026-07-03'),
(4, 3, '10A', 'executiva', 'cancelada',  9100.00, '2026-07-04'),
(5, 4, '30F', 'economica', 'confirmada', 1450.75, '2026-07-05');