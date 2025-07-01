-- Cria tabela e importa os dados 
CREATE TABLE despesas AS 
SELECT * FROM read_csv_auto('https://raw.githubusercontent.com/CayoLopes/BancoDeDadosProjeto/main/duckdb/dados/despesas.csv');

-- Meses com mais gastos
SELECT
  strftime(data_empenho, '%Y-%m') AS mes,
  printf('R$ %0.2f', SUM(valor_empenho)) AS total_empenhado
FROM despesas
GROUP BY mes
ORDER BY SUM(valor_empenho) DESC
LIMIT 5;


-- Ordem de despesas nos orgão análisados 
SELECT 
  descricao_orgao,
  SUM(valor_empenho) AS total_empenhado
FROM despesas
GROUP BY descricao_orgao
ORDER BY total_empenhado DESC;

-- Comparativo entre empenho, liquidação e pagamento por órgão
SELECT
  descricao_orgao,
  SUM(valor_empenho) AS empenhado,
  SUM(valor_liquidado) AS liquidado,
  SUM(valor_pago) AS pago
FROM despesas
GROUP BY descricao_orgao
ORDER BY empenhado DESC;

-- Top 10 favorecidos que mais receberam, pode tirar o limite e ver todos
SELECT
  favorecido,
  cnpjcpf_favorecido,
  SUM(valor_pago) AS total_recebido
FROM despesas
GROUP BY favorecido, cnpjcpf_favorecido
ORDER BY total_recebido DESC
LIMIT 10; 


-- Top 10 itens mais comprados de qualquer fornecedor:
SELECT
  descricao_item,
  SUM(quantidade_item) AS quantidade_total,
  SUM(valor_total_itens) AS valor_total
FROM despesas
GROUP BY descricao_item
ORDER BY valor_total DESC
LIMIT 10;

-- Consulta itens vendidos por um fornecedor específico
SELECT
  descricao_item,
  SUM(quantidade_item) AS quantidade_total,
  SUM(valor_total_itens) AS valor_total
FROM despesas
WHERE cnpjcpf_favorecido = '00.000.000/0000-00'  -- substitua pelo CNPJ real que deseja filtrar
GROUP BY descricao_item
ORDER BY valor_total DESC;

-- Consultar itens
SELECT DISTINCT descricao_item 
FROM despesas 
ORDER BY descricao_item;

-- Consultar itens com estatísticas 
SELECT 
  descricao_item,
  COUNT(*) AS vezes_comprado,
  SUM(quantidade_item) AS quantidade_total,
  SUM(valor_total_itens) AS valor_total_gasto,
  AVG(valor_unitario_item) AS preco_medio
FROM despesas
GROUP BY descricao_item
ORDER BY descricao_item;

-- Consulta item
SELECT 
  descricao_item,
  COUNT(*) AS vezes_comprado,
  SUM(quantidade_item) AS quantidade_total,
  SUM(valor_total_itens) AS valor_total_gasto,
  AVG(valor_unitario_item) AS preco_medio
FROM despesas  -- Esta linha estava faltando!
WHERE descricao_item LIKE '%SAL%'
GROUP BY descricao_item  -- Adicionei esta linha necessária para agregações
ORDER BY descricao_item;
