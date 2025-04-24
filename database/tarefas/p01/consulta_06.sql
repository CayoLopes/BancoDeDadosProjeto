-- Produtos vendidos por funcionário

SELECT u.nome AS funcionario, pr.nome AS produto, SUM(iv.quantidade) AS total_vendido
FROM USUARIO u
JOIN FUNCIONARIO f ON u.id = f.usuario_id
JOIN VENDA v ON f.usuario_id = v.funcionario_id
JOIN ITEM_VENDA iv ON v.id = iv.venda_id
JOIN PRODUTO pr ON iv.produto_id = pr.id
GROUP BY u.nome, pr.nome
ORDER BY u.nome;