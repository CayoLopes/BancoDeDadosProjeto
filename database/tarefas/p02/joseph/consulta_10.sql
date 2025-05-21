SELECT p.nome AS produto, f.nome AS fornecedor
FROM PRODUTO p
JOIN FORNECEDOR f ON p.fornecedor_id = f.id;
