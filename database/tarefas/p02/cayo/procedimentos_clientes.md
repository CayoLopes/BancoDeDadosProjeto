# Procedimentos Relacionados ao Cadastro de Clientes

Este documento descreve dois procedimentos armazenados no banco de dados que executam tarefas importantes no sistema de cadastro de clientes: inserção e atualização de dados. Procedimentos são úteis para encapsular lógica de negócios e garantir consistência nas operações.

---

## Procedimento 1: Inserção de Novo Cliente

### Objetivo

Registrar novos clientes no banco de dados a partir de dados coletados em formulários de cadastro. O procedimento encapsula a lógica da inserção, garantindo que todos os campos necessários sejam preenchidos corretamente.

### Etapas

1. O sistema recebe os dados do formulário: nome, CPF, contato e endereço.
2. Valida se o CPF já está em uso (fora do escopo do procedimento, mas esperado pelo sistema).
3. Insere os dados na tabela `cliente`.

---

## Procedimento 2: Atualização de Contato de Cliente

### Objetivo

Permitir que o contato de um cliente seja atualizado com base no CPF. Esse procedimento é útil para quando o cliente muda de número de telefone ou canal de comunicação e deseja manter os dados atualizados no sistema.

### Etapas

1. O sistema solicita o novo número de contato e o CPF do cliente.
2. Atualiza o campo `contato` da tabela `cliente`.
