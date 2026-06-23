{{ config(materialized='view') }}

SELECT
    f.id_venda,
    c.nome,
    p.nome_produto,
    p.categoria,
    f.data_venda,
    f.quantidade,
    f.valor_total
FROM {{ ref('fact_vendas') }} f
LEFT JOIN {{ ref('dim_clientes') }} c
    ON f.id_cliente = c.id_cliente
LEFT JOIN {{ ref('dim_produtos') }} p
    ON f.id_produto = p.id_produto