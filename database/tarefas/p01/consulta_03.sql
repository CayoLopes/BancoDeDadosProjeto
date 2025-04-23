SELECT u.nome AS funcionario, COUNT(v.id) AS total_vendas
FROM FUNCIONARIO f
JOIN USUARIO u ON f.usuario_id = u.id
LEFT JOIN VENDA v ON f.usuario_id = v.funcionario_id
GROUP BY u.nome
ORDER BY total_vendas DESC;