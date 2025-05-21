### 📄 Descrição do Procedimento SQL: atualizar_cargo_funcionario

O procedimento atualizar_cargo_funcionario atualiza o cargo de um funcionário pelo seu nome, para corrigir ou modificar a função dele na ótica.
Recebe o nome do funcionário e o novo cargo, e realiza a atualização no cadastro.

### 📌 Procedimento SQL: Atualizar Cargo Funcionário

```sql
CREATE PROCEDURE atualizar_cargo_funcionario(
  IN p_nome VARCHAR(255),
  IN p_novo_cargo VARCHAR(255)
)
BEGIN
  UPDATE funcionario
  SET cargo = p_novo_cargo
  WHERE nome = p_nome;
END //

```

### 📄 Descrição do Procedimento SQL: cadastrar_novo_funcionario

O procedimento cadastrar_novo_funcionario realiza o cadastro de um novo funcionário no sistema da ótica. Ele recebe dados como nome, cargo, CPF, data de nascimento, e informações de contato, e os insere na tabela de funcionários.
Esse procedimento é essencial para manter atualizado o quadro de funcionários e garantir o acesso às funcionalidades do sistema.

### 📌 Procedimento SQL: Cadastrar Novo Funcionário

```sql
CREATE PROCEDURE cadastrar_novo_funcionario(
  IN p_nome VARCHAR(255),
  IN p_cargo VARCHAR(255),
  IN p_telefone CHAR(11)
)
BEGIN
  INSERT INTO funcionario (nome, cargo, telefone)
  VALUES (p_nome, p_cargo, p_telefone);
END //

```