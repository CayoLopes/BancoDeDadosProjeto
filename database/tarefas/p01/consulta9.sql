WITH receita_funcionario AS (
  SELECT f.usuario_id, SUM(v.total) AS receita_total
  FROM FUNCIONARIO f
  JOIN VENDA v ON f.usuario_id = v.funcionario_id
  GROUP BY f.usuario_id
)
SELECT u.nome, r.receita_total
FROM receita_funcionario r
JOIN USUARIO u ON r.usuario_id = u.id
ORDER BY r.receita_total DESC;
