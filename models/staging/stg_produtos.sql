with 
source AS (
    SELECT * FROM {{ source("bronze" , "raw_produtos")}}
),
renamed AS (
    SELECT 
        CAST(id_produto AS INTEGER)	AS id_produto,
        CAST(nome_produto AS STRING) AS nome_produto,
        CAST(categoria AS STRING)	AS categoria,
        SAFE_CAST(preco AS FLOAT64) AS preco,
    FROM source
)
SELECT * FROM renamed