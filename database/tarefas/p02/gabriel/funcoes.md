### 📄 Descrição da Função SQL: verificar_telefone_funcionario

A função verificar_disponibilidade_estoque tem como objetivo verificar se a quantidade solicitada de um determinado produto (armação, lente, acessório) está disponível no estoque. Ela recebe como parâmetros o produto_id e a quantidade_desejada e retorna um valor booleano indicando se o estoque é suficiente para atender a solicitação.

Essa função é muito útil para garantir que vendas ou reservas sejam feitas somente quando há estoque disponível, evitando problemas de atendimento e necessidade de controle manual constante.



### 📌 Função SQL: Verificar Telefone Funcionário

```sql
CREATE OR REPLACE FUNCTION verificar_telefone_funcionario(
  p_telefone CHAR(11)
) RETURNS BOOLEAN AS $$
DECLARE
  contador INT;
BEGIN
  SELECT COUNT(*) INTO contador
  FROM funcionario
  WHERE telefone = p_telefone;

  IF contador > 0 THEN
    RETURN TRUE;
  ELSE
    RETURN FALSE;
  END IF;
END;
$$ LANGUAGE plpgsql;

```

### 📄 Descrição da Função SQL: total_vendas_por_funcionario

A função total_vendas_por_funcionario tem como objetivo retornar o valor total de vendas realizadas por um funcionário específico. Ela recebe como parâmetro o funcionario_id e retorna a soma de todas as vendas feitas por esse funcionário, ou zero caso ele não tenha realizado nenhuma.

Essa função é útil para gerar relatórios de desempenho, cálculo de comissões e acompanhamento de metas de vendas dentro da ótica.

### 📌 Função SQL: Total de Vendas por Funcionário

```sql
CREATE FUNCTION total_vendas_por_funcionario(funcionario_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  DECLARE total DECIMAL(10,2);

  SELECT IFNULL(SUM(valor_total), 0)
  INTO total
  FROM venda
  WHERE id_funcionario = funcionario_id;

  RETURN total;
END //
```