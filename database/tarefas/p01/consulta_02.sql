-- Produtos e quantidade total vendida

SELECT pr.nome, SUM(iv.quantidade) AS quantidade_vendida
FROM ITEM_VENDA iv
JOIN PRODUTO pr ON iv.produto_id = pr.id
GROUP BY pr.nome
ORDER BY quantidade_vendida DESC;