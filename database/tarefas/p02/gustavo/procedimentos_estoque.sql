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

-- Procedimento 2: Gerar relatório de faltas
CREATE OR REPLACE PROCEDURE gerar_relatorio_faltas(
    estoque_minimo INT
) LANGUAGE plpgsql AS $$
BEGIN
    CREATE TEMP TABLE IF NOT EXISTS tmp_produtos_faltando (
        id INT,
        nome VARCHAR(100),
        quantidade INT
    );
    
    DELETE FROM tmp_produtos_faltando;  -- limpa antes de popular novamente
    
    INSERT INTO tmp_produtos_faltando
    SELECT id, nome, quantidade
    FROM produto
    WHERE quantidade < estoque_minimo;
END;
$$;
