# Projeto de Análise de Vendas Farmacêuticas (SQL + Python) - Versão 2.0

Este projeto é a **evolução profissional** da minha análise inicial de vendas farmacêuticas.

O objetivo foi migrar de uma análise simples baseada em arquivos Excel para um pipeline de dados robusto e escalável, utilizando um banco de dados relacional (MySQL) e consultando-o diretamente com SQL.

## A Evolução: Do Excel ao SQL

* **[Projeto 1.0 (Análise com Excel)](https://github.com/DiegoHenry09/analise-dados-farmaceutica.)**
    Nesta primeira versão, todo o processo foi feito em Pandas, lendo os dados diretamente de um arquivo `.xlsx`. Embora tenha sido um ótimo aprendizado, este método possui limitações de escalabilidade e não reflete um ambiente corporativo real.

* **Projeto 2.0 (Este Repositório)**
    Aqui, os dados foram tratados como estariam em uma empresa: dentro de um banco de dados. Este projeto simula o fluxo de trabalho completo de um Analista de Dados, desde a modelagem do banco até a análise de BI.

## Ferramentas Utilizadas

* **Linguagens:** `Python` e `SQL`
* **Banco de Dados:** `MySQL (Workbench)`
* **Bibliotecas Python:**
    * `Pandas`: Para o processo de ETL e manipulação dos dados.
    * `SQLAlchemy`: Para criar a conexão entre o Python e o banco MySQL.
    * `Matplotlib` & `Seaborn`: Para a visualização dos dados e geração de insights.
* **Ambiente:** `Jupyter Notebook`

---

## O Processo (Passo a Passo)

Este repositório contém 3 artefatos principais que demonstram o fluxo de trabalho:

### 1. Modelagem do Banco de Dados (SQL)
Antes de qualquer análise, projetei um schema relacional com 5 tabelas (`clientes`, `produtos`, `representantes`, `vendas`, `pagamentos`) para organizar os dados de forma eficiente.

**Arquivo de referência:** [`schema.sql`]([./schema.sql](https://github.com/DiegoHenry09/projeto-farmaceutica-sql/blob/main/CREATE%20TABLE%20clientes%20(.sql))

### 2. ETL (Extract, Transform, Load)
Criei um script em Python que:
1.  **Extrai** os dados de cada aba do arquivo Excel original.
2.  **Transforma** os dados (como colunas de data) para formatos compatíveis.
3.  **Carrega** (Load) os dados de forma limpa nas 5 tabelas do banco de dados MySQL.

**Arquivo de referência:** [`carga_dados_para_sql.ipynb`](./carga_dados_para_sql.ipynb)

*(Nota de Segurança: Os scripts de conexão foram higienizados para o GitHub, removendo a senha de conexão, que foi substituída por um placeholder `SUA_SENHA_AQUI`.)*

### 3. Análise de Negócio e Visualização (SQL + Python)
Com o banco populado, o notebook principal foi usado para conectar ao banco e responder perguntas-chave de negócio. Todas as agregações, junções e filtros foram feitos usando consultas **SQL**, com o Python (Pandas) sendo usado para executar as queries e visualizar os resultados.

**Arquivo de referência:** [`analise_farmaceutica_sql.ipynb`](./analise_farmaceutica_sql.ipynb)

---

## Análises Realizadas e Insights

#### Perguntas de Negócio Respondidas:
1.  Qual a receita total por **Categoria de Produto**?
2.  Quais são os **Top 10 Clientes** que mais geram receita?
3.  Quais são os **Top 10 Representantes (Vendedores)** com melhor performance?
4.  Qual o status dos pagamentos (análise de **inadimplência**)?
5.  Qual a evolução da **Receita Mensal** ao longo de 2024?
6.  Qual a distribuição de receita por **Estado (UF)**?

#### Destaque: Enriquecimento de Dados
Durante a Análise 3, foi identificado que os dados de "Representantes" estavam anonimizados (ex: "Rep 19"). Para tornar o relatório mais profissional e legível, usei a função `.map()` do Pandas para "enriquecer" os dados, trocando os códigos por nomes fictícios (ex: "Ricardo Neves").

#### Principais Insights de Negócio:
* **Produto:** A categoria "Gastrointestinais" é a principal fonte de receita.
* **Cliente:** A "Rede Descontão" é o nosso "cliente de ouro" (Top 1).
* **Força de Vendas:** "João Tavares" (Rep 10) é nosso vendedor de maior performance.
* **Geografia:** A maior parte da receita está concentrada nos estados de SP e RJ (Top 2 UF).
* **Saúde Financeira:** Quase 80% da receita está com status "Pago", mas existe uma fatia de ~10% "Em Atraso" que precisa ser investigada (próximo passo).
* **Tendência:** As vendas em 2024 mostraram um pico em Março (Mês 3).
