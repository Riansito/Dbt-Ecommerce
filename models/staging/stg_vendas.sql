-- Extrai e padroniza os dados de vendas provenientes da camada Bronze.
-- Além da conversão dos tipos de dados, este modelo desestrutura os campos
-- aninhados (cliente, produto, pagamento e metadata), preparando os dados
-- para as próximas etapas da camada Silver.

WITH source AS (

    -- Carrega os dados brutos da camada Bronze.
    SELECT *
    FROM {{ source('bronze', 'raw_vendas') }}

),

renamed AS (

    SELECT

        -- Identificação da venda.
        CAST(id_venda AS INT64) AS id_venda,
        CAST(data_venda AS TIMESTAMP) AS data_venda,

        -- Informações do cliente.
        CAST(cliente.id_cliente AS INT64) AS id_cliente,
        CAST(cliente.nome AS STRING) AS nome_cliente,
        CAST(cliente.cidade AS STRING) AS cidade_cliente,

        -- Informações do produto.
        CAST(produto.id_produto AS INT64) AS id_produto,
        CAST(produto.nome_produto AS STRING) AS nome_produto,
        CAST(produto.categoria AS STRING) AS categoria_produto,

        -- Informações do pagamento.
        CAST(pagamento.tipo AS STRING) AS tipo_pagamento,
        CAST(pagamento.parcelas AS INT64) AS parcelas,

        -- Métricas da venda.
        CAST(quantidade AS INT64) AS quantidade,
        SAFE_CAST(valor_total AS FLOAT64) AS valor_total,

        -- Metadados da origem da transação.
        CAST(metadata.ip AS STRING) AS ip_origem,
        CAST(metadata.origem AS STRING) AS origem

    FROM source

)

-- Retorna os dados tratados para utilização nos modelos da camada Silver.
SELECT *
FROM renamed