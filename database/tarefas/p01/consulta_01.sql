-- Produtos com o estoque abaixo de 20

SELECT p.nome AS produto, e.quantidade_atual
FROM ESTOQUE e
JOIN PRODUTO p ON p.id = e.produto_id
WHERE e.quantidade_atual < 20;
