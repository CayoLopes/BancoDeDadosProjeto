-- 06. Vendas com status de pagamento "Pendente"
SELECT v.id AS venda_id, v.data, p.valor, p.metodo, p.status
FROM VENDA v
JOIN PAGAMENTO p ON v.id = p.venda_id
WHERE p.status = 'Pendente';