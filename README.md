# 🏗️ Pipeline de Engenharia de Dados para E-commerce com Google Cloud, BigQuery, dbt e Power BI

## 📌 Visão Geral

Este projeto consiste em uma arquitetura moderna de dados para um cenário de e-commerce, implementando um pipeline completo de Engenharia de Dados utilizando Google Cloud Platform, BigQuery, dbt e Power BI.

O objetivo do projeto é transformar dados brutos provenientes de múltiplas fontes em informações confiáveis e prontas para consumo analítico, seguindo as boas práticas da Modern Data Stack.

Os dados são armazenados em um Data Lake no Google Cloud Storage, processados no BigQuery através de camadas Bronze, Silver e Gold, modelados dimensionalmente utilizando Star Schema e disponibilizados para análise no Power BI.

Além disso, foi criada uma camada analítica otimizada para consumo por soluções de Inteligência Artificial, possibilitando consultas em linguagem natural e geração de insights automatizados.

---

# 🏢 Problema de Negócio

Uma empresa de e-commerce deseja centralizar seus dados operacionais para obter uma visão integrada do negócio.

Os dados são gerados por diferentes sistemas e chegam em diversos formatos:

* Arquivos JSON;
* Arquivos CSV;
* APIs REST;
* Sistema transacional de e-commerce.

Esses dados apresentam desafios como:

* ❌ Falta de padronização;
* ❌ Dados duplicados;
* ❌ Estruturas inconsistentes;
* ❌ Dificuldade de integração;
* ❌ Baixa escalabilidade para análises;
* ❌ Demora na geração de relatórios.

Sem uma arquitetura adequada, a empresa possui dificuldade para responder perguntas estratégicas como:

* Qual categoria vende mais?
* Qual produto gera mais receita?
* Qual cliente compra com maior frequência?
* Como está o nível de estoque?
* Qual região apresenta maior faturamento?

---

# ✅ Solução Desenvolvida

Foi desenvolvida uma plataforma de dados baseada em arquitetura Lakehouse utilizando serviços da Google Cloud.

O pipeline realiza:

* Ingestão de dados brutos no Data Lake;
* Armazenamento escalável no Google Cloud Storage;
* Criação de tabelas externas no BigQuery;
* Transformações e padronizações utilizando dbt;
* Limpeza e tratamento de dados;
* Conversão de tipos;
* Padronização de categorias e atributos;
* Modelagem dimensional em Star Schema;
* Criação de camada analítica otimizada;
* Disponibilização dos dados para Power BI;
* Preparação dos dados para aplicações de IA.

---

# 🏗️ Arquitetura do Projeto

O projeto segue uma arquitetura moderna baseada em Data Lake, Data Warehouse e Analytics Layer.

## 🔄 Fluxo do Pipeline

```text
Fontes de Dados
      ↓
Google Cloud Storage (Data Lake)
      ↓
BigQuery Bronze Layer
      ↓
dbt Transformations
      ↓
BigQuery Silver Layer
      ↓
BigQuery Gold Layer (Star Schema)
      ↓
Analytics Layer
      ↓
Power BI / IA Generativa
```

---

## 📌 Arquitetura Completa

<img width="1920" height="1080" alt="Design sem nome" src="https://github.com/user-attachments/assets/01ec2c93-f983-4cf4-a96d-fc28837799b4" />

---

# 🌊 Camada Data Lake

Os dados são armazenados inicialmente no Google Cloud Storage.

## Estrutura de Diretórios com particionamento temporal por cliente, produtos, vendas, pagamentos, entregas e estoque. Exemplo:

```text
raw/
├── vendas/
│   ├── year=2026/
│   │   ├── month=06/
│   │   │   ├── day=23/
│   │   │   │   └── vendas.json
```

Os arquivos podem chegar continuamente nos formatos:

* JSON
* CSV
* API Responses

Benefícios:

* Baixo custo;
* Escalabilidade;
* Armazenamento de dados brutos;
* Histórico preservado.

---

# 🥉 Bronze Layer

A camada Bronze é composta por tabelas externas criadas diretamente sobre os arquivos armazenados no Data Lake.

## Tabelas

```text
raw_clientes
raw_produtos
raw_vendas
raw_pagamentos
raw_entregas
raw_estoque
```

Objetivos:

* Disponibilizar os dados para consulta;
* Evitar duplicação de armazenamento;
* Preservar os dados originais.

---

# 🔄 Transformações com dbt

O dbt é responsável pela padronização e preparação dos dados.

## Principais Transformações

* Limpeza de dados;
* Tratamento de nulos;
* Conversão de tipos;
* Padronização de categorias;
* Flattening de estruturas JSON;
* Renomeação de colunas;
* Aplicação de regras de negócio;
* Criação de testes de qualidade.

Exemplo de tratamento implementado:

```sql
CASE
    WHEN LOWER(categoria) IN ('eletronicos', 'eletrônicos')
        THEN 'Eletrônicos'
    WHEN LOWER(categoria) = 'informatica'
        THEN 'Informática'
    WHEN LOWER(categoria) = 'games'
        THEN 'Games'
    ELSE categoria
END
```

---

# 🥈 Silver Layer

A camada Silver contém os dados limpos e padronizados.

## Tabelas

```text
stg_clientes
stg_produtos
stg_vendas
stg_pagamentos
stg_entregas
stg_estoque
```

Características:

* Dados tratados;
* Estrutura consistente;
* Padronização de nomenclaturas;
* Aplicação das regras de negócio.

---

# ⭐ Gold Layer — Data Warehouse

A camada Gold contém o modelo dimensional utilizado para análises de negócio.

## Modelagem Dimensional

Foi implementado um Star Schema composto por:

### Tabela Fato

```text
fact_vendas
```

Responsável por armazenar as métricas do negócio:

* Quantidade vendida;
* Valor total vendido;
* Receita;
* Indicadores operacionais.

### Dimensões

```text
dim_clientes
dim_produtos
dim_tempo
```

Essas tabelas permitem análises por:

* Cliente;
* Produto;
* Categoria;
* Data;
* Mês;
* Ano.

---

# 📊 Analytics Layer

Para otimizar consultas analíticas e aplicações de IA foi criada uma camada específica.

## View Analítica

```text
vw_ia_vendas
```

Objetivos:

* Desnormalização dos dados;
* Facilidade para consumo por IA;
* Consultas mais rápidas;
* Menor complexidade analítica.

---

# 📈 Integração com Power BI

O Power BI consome os dados da camada Gold para construção de dashboards executivos.

## Indicadores Disponíveis

* Receita Total;
* Quantidade de Pedidos;
* Ticket Médio;
* Clientes Únicos;
* Produtos Mais Vendidos;
* Categorias Mais Vendidas;
* Evolução Temporal das Vendas;
* Status de Entregas;
* Controle de Estoque.

<p align="center">
  <img src="https://github.com/user-attachments/assets/09da183c-68db-4113-9987-7e9b232a854f" width="48%" />
  <img src="https://github.com/user-attachments/assets/f67382f8-9b40-4ca2-918d-71ede7b49c4b" width="48%" />
</p>
---

# 🧪 Testes de Qualidade com dbt

O projeto pode ser validado através dos testes nativos do dbt.

Exemplos:

* `not_null`
* `unique`
* `accepted_values`
* `relationships`

Objetivos:

* Garantir integridade dos dados;
* Evitar registros inválidos;
* Monitorar qualidade do pipeline.

---

# 🛠️ Tecnologias Utilizadas

* Python
* Google Cloud Storage (GCS)
* BigQuery
* dbt Core
* SQL
* Power BI
* Git
* GitHub

---

# 📂 Estrutura do Projeto

```text
ecommerce-data-engineering/
│
├── models/
│   │
│   ├── staging/
│   │   ├── stg_clientes.sql
│   │   ├── stg_produtos.sql
│   │   ├── stg_vendas.sql
│   │   ├── stg_pagamentos.sql
│   │   ├── stg_entregas.sql
│   │   ├── stg_estoque.sql
│   │   └── schema.yml
│   │
│   └── marts/
│       ├── dim_clientes.sql
│       ├── dim_produtos.sql
│       ├── dim_tempo.sql
│       ├── fact_vendas.sql
│       ├── vw_ia_vendas.sql
│       └── schema.yml
│
├── seeds/
│
├── snapshots/
│
├── macros/
│
├── analyses/
│
├── target/
│
├── logs/
│
├── dbt_project.yml
├── packages.yml
├── profiles.yml
├── .gitignore
└── README.md
```

---

# 🚀 Como Executar o Projeto

## 1️⃣ Clonar o Repositório

```bash
git clone https://github.com/seu-usuario/ecommerce-data-engineering.git
```

## 2️⃣ Entrar na Pasta

```bash
cd ecommerce-data-engineering
```

## 3️⃣ Configurar o Perfil do dbt

```yaml
ecommerce:
  target: dev
  outputs:
    dev:
      type: bigquery
      method: oauth
      project: seu-projeto
      dataset: ecommerce
      threads: 4
```

## 4️⃣ Executar os Modelos

```bash
dbt run
```

## 5️⃣ Executar os Testes

```bash
dbt test
```

## 6️⃣ Gerar a Documentação

```bash
dbt docs generate
dbt docs serve
```

---

# ✅ Benefícios do Projeto

* Arquitetura moderna de dados;
* Pipeline escalável;
* Dados padronizados e confiáveis;
* Separação por camadas (Bronze, Silver e Gold);
* Modelagem dimensional otimizada;
* Integração com BI e IA;
* Governança e rastreabilidade com dbt;
* Testes automatizados de qualidade;
* Pronto para ambientes corporativos e produção.
