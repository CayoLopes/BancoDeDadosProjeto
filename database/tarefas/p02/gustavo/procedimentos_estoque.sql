-- Procedimento 1: Atualizar estoque após venda
CREATE OR REPLACE PROCEDURE atualizar_estoque_venda(
    prod_id INT,
    qtd_vendida INT
) LANGUAGE plpgsql AS $$
BEGIN
    UPDATE produto
    SET quantidade = quantidade - qtd_vendida
    WHERE id = prod_id;
END;
$$;