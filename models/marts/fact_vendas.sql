WITH vendas AS (

    SELECT *
    FROM {{ ref('stg_vendas') }}

),

pagamentos AS (

    SELECT *
    FROM {{ ref('stg_pagamentos') }}

),

entregas AS (

    SELECT *
    FROM {{ ref('stg_entregas') }}

)

SELECT

    v.id_venda,

    v.data_venda,

    v.id_cliente,
    v.id_produto,

    p.forma_pagamento,

    e.transportadora,
    e.status,

    v.quantidade,
    v.valor_total

FROM vendas v

LEFT JOIN pagamentos p
    ON v.id_venda = p.id_venda

LEFT JOIN entregas e
    ON v.id_venda = e.id_venda