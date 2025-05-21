**1. Alias (AS)**

A palavra-chave AS permite atribuir nomes alternativos às colunas retornadas na consulta. No exemplo, usamos p.nome AS produto e f.nome AS fornecedor, tornando o resultado da consulta mais legível e intuitivo.

🟨 **Vantagens do uso de Alias:**

✅ Melhora a legibilidade → Os nomes das colunas no resultado serão mais claros. 

✅ Facilita a manipulação dos dados → Quando integrados em aplicações, os alias tornam os dados mais fáceis de utilizar. 

✅ Evita ambiguidade → Em consultas com várias tabelas, o alias diferencia colunas com nomes semelhantes.

**2. JOIN (Junção de Tabelas)**

A cláusula JOIN conecta dados de duas tabelas distintas com base em uma relação comum. No exemplo, a junção ocorre entre as tabelas PRODUTO e FORNECEDOR, onde p.fornecedor_id = f.id estabelece a relação entre os produtos e seus respectivos fornecedores.

🟨 **Tipos de JOIN e suas diferenças:**

✅ INNER JOIN → Retorna apenas os registros que têm correspondência em ambas as tabelas. 

✅ LEFT JOIN → Retorna todos os registros da tabela à esquerda e os correspondentes da tabela à direita. 

✅ RIGHT JOIN → Retorna todos os registros da tabela à direita e os correspondentes da tabela à esquerda. 

✅ FULL JOIN → Retorna todos os registros de ambas as tabelas, correspondentes ou não.

◼️ **Resumo**

1️⃣ Alias (AS) → Renomeia colunas para tornar o resultado mais legível. 

2️⃣ JOIN → Conecta tabelas relacionadas, garantindo que os dados sejam combinados corretamente.
