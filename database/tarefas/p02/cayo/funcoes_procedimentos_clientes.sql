-- Função: buscar_nome_cliente
CREATE OR REPLACE FUNCTION buscar_nome_cliente(cpf_input VARCHAR)
RETURNS VARCHAR AS $$
DECLARE
    cliente_nome VARCHAR;
BEGIN
    SELECT nome INTO cliente_nome
    FROM cliente
    WHERE cpf = cpf_input;

    RETURN cliente_nome;
END;
$$ LANGUAGE plpgsql;

-- Função: contar_clientes_por_cidade
CREATE OR REPLACE FUNCTION contar_clientes_por_cidade(cidade_input VARCHAR)
RETURNS INTEGER AS $$
DECLARE
    total_clientes INTEGER;
BEGIN
    SELECT COUNT(*) INTO total_clientes
    FROM cliente
    WHERE endereco ILIKE '%' || cidade_input || '%';

    RETURN total_clientes;
END;
$$ LANGUAGE plpgsql;

-- Procedimento: inserir_cliente
CREATE OR REPLACE PROCEDURE inserir_cliente(
    nome_input VARCHAR,
    cpf_input VARCHAR,
    contato_input VARCHAR,
    endereco_input TEXT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO cliente (nome, cpf, contato, endereco)
    VALUES (nome_input, cpf_input, contato_input, endereco_input);
END;
$$;

-- Procedimento: atualizar_contato_cliente
CREATE OR REPLACE PROCEDURE atualizar_contato_cliente(
    cpf_input VARCHAR,
    novo_contato VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE cliente
    SET contato = novo_contato
    WHERE cpf = cpf_input;
END;
$$;
