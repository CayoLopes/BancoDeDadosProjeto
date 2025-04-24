-- Total de vendas por dia

SELECT data, SUM(total) AS total_do_dia
FROM VENDA
GROUP BY data
ORDER BY data;