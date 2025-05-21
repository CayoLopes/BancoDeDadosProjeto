# Funções Relacionadas ao Cadastro de Clientes

Este documento descreve duas funções SQL utilizadas para facilitar consultas no sistema de gerenciamento de clientes. Elas foram desenvolvidas com foco em acessibilidade e apoio à geração de relatórios.

---

### Função SQL `buscar_nome_cliente`

A função `buscar_nome_cliente` foi criada para facilitar a obtenção do nome completo de um cliente a partir do seu CPF. Essa funcionalidade é útil em contextos onde o sistema precisa exibir ou validar informações rapidamente com base em um identificador único e sensível, como o CPF, sem expor mais dados do cliente.

Ela realiza uma busca na tabela `cliente` e retorna o nome correspondente ao CPF fornecido. Caso o CPF não exista na base, a função retorna `NULL`.

---

### Função SQL `contar_clientes_por_cidade`

A função `contar_clientes_por_cidade` tem o objetivo de contabilizar quantos clientes estão registrados em determinada localidade. Como o campo `endereco` contém o nome da cidade, a função utiliza uma busca textual com `ILIKE` para verificar quantos registros contêm o nome da cidade informada.

Essa função pode ser utilizada para relatórios estatísticos, análises de alcance de mercado ou estratégias de expansão geográfica.
