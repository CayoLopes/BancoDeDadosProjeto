# Funções
---

### Função 01 SQL `precisa_repor_estoque`

A função `precisa_repor_estoque` tem como objetivo identificar se um produto está com quantidade inferior ao mínimo desejado em estoque.

Ela recebe dois parâmetros: o `ID` do produto e o `estoque_mínimo` aceitável. A função então consulta a quantidade atual do item e retorna `true` se for menor que o mínimo informado, `false` caso contrário, ou `NULL` se o produto não existir.

Essa função é útil para destacar rapidamente quais itens precisam ser repostos no sistema.

---

### Função 02 SQL `calcular_valor_total_estoque`

A função `calcular_valor_total_estoque` retorna o valor total estimado do estoque disponível, com base na multiplicação entre o preço unitário e a quantidade de cada item.

Ela realiza a soma de todos esses valores e retorna o montante como um número decimal. Essa informação é importante para **análises financeiras** e para o acompanhamento do **valor investido em produtos**.

---

# Procedimentos 
---

## Procedimento 01 Atualização de Estoque Após Venda

### Nome

`atualizar_estoque_venda`

### Objetivo

Subtrair automaticamente a quantidade vendida de um determinado produto no momento em que uma venda é realizada.

### Etapas

1. O sistema informa o ID do produto (`prod_id`) e a quantidade vendida (`qtd_vendida`).
2. O procedimento atualiza o campo `quantidade` na tabela `produto`, subtraindo o valor vendido.
3. Em caso de erro, a operação é revertida com `ROLLBACK`.

Esse procedimento ajuda a manter o estoque atualizado e consistente após transações de venda.

---

## Procedimento 02 Geração de Relatório de Produtos em Falta

### Nome

`gerar_relatorio_faltas`

### Objetivo

Gerar uma tabela temporária contendo os produtos que estão abaixo de um estoque mínimo informado.

### Etapas

1. O sistema chama o procedimento com um valor de `estoque_minimo`.
2. É criada (se ainda não existir) uma tabela temporária chamada `tmp_produtos_faltando`.
3. São inseridos na tabela os produtos cuja quantidade é menor que o valor mínimo definido.

Esse relatório pode ser consultado para tomada de decisões de **reposição**, **compra de materiais** e **planejamento logístico**.

---
