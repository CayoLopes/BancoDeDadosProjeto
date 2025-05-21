### 📄 Descrição da Função SQL: `atualizar_estoque_apos_entrada`

A função `atualizar_estoque_apos_entrada` trata-se de um gatilho (*trigger*) implementado no banco de dados com o objetivo de manter a consistência e a integridade das informações relacionadas ao controle de estoque. Essa função é acionada automaticamente logo após a inserção de um novo registro na tabela `entrada_entrada`, responsável por armazenar os dados das entradas de produtos no sistema.

Sua principal finalidade é atualizar, de forma automática, o campo `quantidade` da tabela `produtos_produtos`, somando à quantidade existente a quantidade informada na nova entrada. Dessa forma, assegura-se que o estoque refletido no sistema esteja sempre coerente com as movimentações reais de produtos, dispensando intervenções manuais e minimizando erros operacionais.

A utilização de *triggers* como essa promove maior confiabilidade no sistema de gerenciamento, além de contribuir para a automatização de processos essenciais à gestão de suprimentos.

```sql
CREATE TRIGGER atualizar_estoque_apos_entrada
AFTER INSERT ON entrada_entrada
BEGIN
  UPDATE produtos_produtos
  SET quantidade = quantidade + NEW.quantidade
  WHERE id = NEW.produto_id;
END;

```




### Descrição da Função SQL `atualizar_data_ultima_entrada`

A trigger `atualizar_data_ultima_entrada` é acionada automaticamente após a inserção de uma nova entrada de produto na tabela `entrada_entrada`. Seu propósito é registrar, na descrição do produto correspondente, a data da última movimentação de entrada.

Embora a descrição do produto não seja um campo ideal para esse tipo de dado em sistemas robustos (onde um campo específico como `ultima_entrada` seria mais apropriado), essa solução demonstra, de maneira funcional, a capacidade de automatizar atualizações de metadados diretamente a partir de operações transacionais. Assim, reforça-se a rastreabilidade das movimentações de estoque no banco de dados.

```sql
  CREATE TRIGGER atualizar_data_ultima_entrada
AFTER INSERT ON entrada_entrada
BEGIN
  UPDATE produtos_produtos
  SET descricao = 'Última entrada em: ' || NEW.data_entrada
  WHERE id = NEW.produto_id;
END;

```