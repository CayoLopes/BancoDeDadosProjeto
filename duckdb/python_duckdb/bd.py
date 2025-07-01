import duckdb
import pandas as pd
import matplotlib.pyplot as plt

# Conecta DuckDB
con = duckdb.connect()

# Importa CSV direto para DuckDB e cria tabela
con.execute("""
CREATE TABLE despesas AS
SELECT * FROM read_csv_auto('despesas.csv');
""")

# Consulta os dados da Secretaria de Saúde
df = con.execute("""
SELECT descricao_orgao AS Orgao, 
       SUM(valor_pago) AS TotalPago
FROM despesas
WHERE descricao_orgao = 'SECRETARIA MUNICIPAL DE SAUDE'
GROUP BY descricao_orgao
ORDER BY TotalPago DESC
""").df()

df_itens = con.execute("""
SELECT descricao_item AS Item,
       SUM(valor_pago) AS TotalPago
FROM despesas
WHERE descricao_orgao = 'SECRETARIA MUNICIPAL DE SAUDE'
GROUP BY descricao_item
ORDER BY TotalPago DESC
LIMIT 10
""").df()
df_fav = con.execute("""
SELECT favorecido AS Favorecido,
       SUM(valor_pago) AS TotalPago
FROM despesas
WHERE descricao_orgao = 'SECRETARIA MUNICIPAL DE SAUDE'
GROUP BY favorecido
ORDER BY TotalPago DESC
LIMIT 10
""").df()

# Gráfico barras horizontais dos favorecidos
plt.figure(figsize=(12,6))
plt.barh(df_fav['Favorecido'], df_fav['TotalPago'], color='lightgreen')
plt.xlabel('Valor Pago (R$)')
plt.title('Top 10 Favorecidos - Secretaria Municipal de Saúde')
plt.gca().invert_yaxis()
plt.tight_layout()
plt.savefig('grafico_saude_favorecidos.png')
plt.show()
print("Gráfico salvo em grafico_saude_favorecidos.png")


# Gráfico barras horizontais dos itens
plt.figure(figsize=(12,6))
plt.barh(df_itens['Item'], df_itens['TotalPago'], color='salmon')
plt.xlabel('Valor Pago (R$)')
plt.title('Top 10 Itens - Gastos Secretaria Municipal de Saúde')
plt.gca().invert_yaxis()
plt.tight_layout()
plt.savefig('grafico_saude_itens.png')
plt.show()
print("Gráfico salvo em grafico_saude_itens.png")


