-- 05. Fornecedores e seus gerentes
SELECT f.nome AS fornecedor, u.nome AS gerente
FROM FORNECEDOR f
JOIN GERENTE g ON f.gerente_id = g.usuario_id
JOIN USUARIO u ON g.usuario_id = u.id;