WITH source AS (

    SELECT *
    FROM {{ source('bronze', 'raw_vendas') }}

),

renamed AS (

    SELECT
        CAST(id_venda AS INT64) AS id_venda,
        CAST(data_venda AS TIMESTAMP) AS data_venda,

        CAST(cliente.id_cliente AS INT64) AS id_cliente,
        CAST(cliente.nome AS STRING) AS nome_cliente,
        CAST(cliente.cidade AS STRING) AS cidade_cliente,

        CAST(produto.id_produto AS INT64) AS id_produto,
        CAST(produto.nome_produto AS STRING) AS nome_produto,
        CAST(produto.categoria AS STRING) AS categoria_produto,

        CAST(pagamento.tipo AS STRING) AS tipo_pagamento,
        CAST(pagamento.parcelas AS INT64) AS parcelas,

        CAST(quantidade AS INT64) AS quantidade,
        SAFE_CAST(valor_total  AS FLOAT64) AS valor_total,

        CAST(metadata.ip AS STRING) AS ip_origem,
        CAST(metadata.origem AS STRING) AS origem

    FROM source

)

SELECT *
FROM renamed