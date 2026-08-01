-- ============================================================
-- 03_consultas.sql
-- ============================================================

-- 1. Quais passageiros têm nome que começa com a letra "C"?
SELECT nome, cpf
FROM passageiro
WHERE nome ILIKE 'C%';

-- 2. Quais reservas estão com status "confirmada" ou "pendente"?
SELECT id_passageiro, id_voo, status, preco_pago
FROM reserva
WHERE status IN ('confirmada', 'pendente');

-- 3. Quais reservas tiveram preço pago entre R$ 2000 e R$ 5000?
SELECT id_passageiro, id_voo, classe, preco_pago
FROM reserva
WHERE preco_pago BETWEEN 2000 AND 5000;

-- 4. Quantas reservas existem para cada status?
SELECT status, COUNT(*) AS total_reservas
FROM reserva
GROUP BY status;

-- 5. Quais companhias aéreas operam mais de 1 voo cadastrado?
SELECT c.nome AS companhia, COUNT(v.id_voo) AS total_voos
FROM companhia_area c
JOIN voo v ON v.idcompanhia_area = c.id_companhia
GROUP BY c.nome
HAVING COUNT(v.id_voo) > 1;

-- 6. Liste todos os voos com o nome da companhia aérea que os opera.
SELECT v.num_voo, v.hora_partida, c.nome AS companhia
FROM voo v
INNER JOIN companhia_area c ON v.idcompanhia_area = c.id_companhia;

-- 7. Liste cada reserva com o nome do passageiro, o número do voo
SELECT p.nome AS passageiro, v.num_voo, c.nome AS companhia, r.classe, r.status
FROM reserva r
INNER JOIN passageiro p ON r.id_passageiro = p.id_passageiro
INNER JOIN voo v ON r.id_voo = v.id_voo
INNER JOIN companhia_area c ON v.idcompanhia_area = c.id_companhia;

-- 8. Liste todos os voos e, quando existir, o passageiro que fez reserva
SELECT v.id_voo, v.num_voo, r.id_passageiro
FROM voo v
LEFT JOIN reserva r ON v.id_voo = r.id_voo;

-- 9. Quais reservas pagaram um valor acima da média geral de preço pago?
WITH media_preco AS (
    SELECT AVG(preco_pago) AS valor_medio
    FROM reserva
)
SELECT r.id_passageiro, r.id_voo, r.preco_pago
FROM reserva r, media_preco m
WHERE r.preco_pago > m.valor_medio;

-- 10. Para cada passageiro, numere suas reservas em ordem cronológico
SELECT
    p.nome AS passageiro,
    r.data_reserva,
    r.preco_pago,
    ROW_NUMBER() OVER (PARTITION BY r.id_passageiro ORDER BY r.data_reserva) AS numero_da_reserva
FROM reserva r
JOIN passageiro p ON r.id_passageiro = p.id_passageiro;