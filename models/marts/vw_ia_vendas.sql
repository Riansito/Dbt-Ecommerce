{{ config(materialized='view') }}

-- View analítica que consolida informações de vendas, clientes e produtos.
-- Facilita consultas e o consumo por ferramentas de BI e aplicações de IA,
-- evitando a necessidade de realizar joins entre as tabelas do Data Warehouse.

SELECT
    -- Identificador único da venda.
    f.id_venda,

    -- Nome do cliente que realizou a compra.
    c.nome,

    -- Nome do produto vendido.
    p.nome_produto,

    -- Categoria do produto.
    p.categoria,

    -- Data em que a venda foi realizada.
    f.data_venda,

    -- Quantidade de itens vendidos.
    f.quantidade,

    -- Valor total da venda.
    f.valor_total

FROM {{ ref('fact_vendas') }} f

-- Relaciona cada venda ao cliente correspondente.
LEFT JOIN {{ ref('dim_clientes') }} c
    ON f.id_cliente = c.id_cliente

-- Relaciona cada venda ao produto correspondente.
LEFT JOIN {{ ref('dim_produtos') }} p
    ON f.id_produto = p.id_produto
