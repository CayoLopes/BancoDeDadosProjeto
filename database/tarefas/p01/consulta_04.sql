SELECT p.nome, p.quantidade AS quantidade_inicial, e.quantidade_atual
FROM PRODUTO p
JOIN ESTOQUE e ON p.id = e.produto_id
WHERE e.quantidade_atual < p.quantidade;
