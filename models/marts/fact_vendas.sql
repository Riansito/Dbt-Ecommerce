-- Consolida os dados de vendas com informações de pagamento e entrega.
-- Este modelo centraliza atributos que pertencem ao mesmo evento de negócio,
-- preparando os dados para a construção da tabela fato.

WITH vendas AS (

    -- Carrega os dados tratados das vendas.
    SELECT *
    FROM {{ ref('stg_vendas') }}

),

pagamentos AS (

    -- Carrega os dados tratados dos pagamentos.
    SELECT *
    FROM {{ ref('stg_pagamentos') }}

),

entregas AS (

    -- Carrega os dados tratados das entregas.
    SELECT *
    FROM {{ ref('stg_entregas') }}

)

SELECT

    -- Identificador único da venda.
    v.id_venda,

    -- Data em que a venda foi realizada.
    v.data_venda,

    -- Chaves que referenciam as dimensões.
    v.id_cliente,
    v.id_produto,

    -- Forma de pagamento utilizada na compra.
    p.forma_pagamento,

    -- Informações logísticas da entrega.
    e.transportadora,
    e.status,

    -- Métricas da venda.
    v.quantidade,
    v.valor_total

FROM vendas v

-- Associa cada venda ao respectivo pagamento.
LEFT JOIN pagamentos p
    ON v.id_venda = p.id_venda

-- Associa cada venda às informações de entrega.
LEFT JOIN entregas e
    ON v.id_venda = e.id_venda
