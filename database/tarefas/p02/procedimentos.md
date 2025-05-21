# 📘 Procedimentos Operacionais Relacionados ao Sistema de Controle de Entradas de Produtos

Este documento descreve dois procedimentos fundamentais para garantir a integridade dos dados e a rastreabilidade das movimentações no sistema de controle de estoque. Os procedimentos aqui descritos estão diretamente ligados à operação de entrada de produtos e à geração de relatórios gerenciais.

---

## 📌 Procedimento 1: Registro de Entrada de Produtos

### Objetivo

Registrar de forma precisa cada nova entrada de produtos no sistema, atualizando automaticamente o estoque e vinculando as informações de origem, como fornecedor, funcionário responsável e data da movimentação.

### Etapas

1. O usuário acessa o formulário de entrada no sistema, preenchendo os seguintes campos obrigatórios:
   - Produto
   - Quantidade
   - Preço unitário
   - Fornecedor
   - Funcionário responsável
   - Data da entrada

2. Após a submissão, o sistema valida os dados e, se válidos:
   - Cria um novo registro na tabela `entrada_entrada`
   - Aciona a trigger `atualizar_estoque_apos_entrada` para atualizar automaticamente a quantidade do produto na tabela `produtos_produtos`
   - Aciona a trigger `atualizar_data_ultima_entrada` para registrar a data da última entrada na descrição do produto

3. O sistema exibe uma mensagem de sucesso e redireciona o usuário, garantindo feedback imediato da operação.

---

## 📌 Procedimento 2: Geração de Relatório de Entradas por Período

### Objetivo

Permitir que o usuário visualize um relatório detalhado de todas as entradas realizadas em um intervalo de datas, facilitando auditorias, balanços e o planejamento de compras.

### Etapas

1. O usuário acessa a página de relatórios e seleciona a opção "Entradas por Período".
2. Define a data inicial e a data final desejadas para o filtro.
3. O sistema realiza a consulta na tabela `entrada_entrada` com base no intervalo fornecido:

   ```sql
   SELECT * FROM entrada_entrada
   WHERE data_entrada BETWEEN 'DATA_INICIAL' AND 'DATA_FINAL';
