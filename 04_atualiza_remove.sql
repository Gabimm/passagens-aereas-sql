-- ============================================================
-- 04_atualiza_remove.sql
-- Exemplos de UPDATE e DELETE com WHERE
-- ============================================================

UPDATE reserva
SET status = 'confirmada'
WHERE id_passageiro = 3 AND id_voo = 2;
-- Confirma a reserva da passageira Camila Alves Ferreira (id_passageiro = 3)
-- no voo id_voo = 2, que estava com status "pendente" — simula o cenário
-- em que o pagamento foi aprovado e a reserva passa a ser "confirmada".
-- O que aconteceria sem o WHERE: o UPDATE alteraria o status de TODAS as
-- reservas da tabela para "confirmada" de uma vez — incluindo a que já
-- estava "cancelada" (id_passageiro = 4, id_voo = 3), o que corromperia
-- o histórico de todas as reservas do banco, não só da reserva pretendida.

DELETE FROM reserva
WHERE id_passageiro = 4 AND id_voo = 3;
-- Remove a reserva cancelada do passageiro Thiago Moreira Costa
-- (id_passageiro = 4) no voo id_voo = 3 — simula uma rotina de limpeza
-- que remove reservas canceladas há mais tempo do banco operacional.
-- O que aconteceria sem o WHERE: o DELETE apagaria TODAS as linhas da
-- tabela reserva de uma vez, destruindo o histórico completo de reservas
-- (inclusive as confirmadas e pendentes), sem possibilidade de desfazer
-- fora de um backup.