-- Função 1: Verificar necessidade de reposição
CREATE OR REPLACE FUNCTION precisa_repor_estoque(
    produto_id INT,
    estoque_minimo INT
) RETURNS BOOLEAN AS $$
DECLARE
    qtd_atual INT;
BEGIN
    SELECT quantidade INTO qtd_atual
    FROM produto
    WHERE id = produto_id;
    
    RETURN qtd_atual < estoque_minimo;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
$$ LANGUAGE plpgsql;

