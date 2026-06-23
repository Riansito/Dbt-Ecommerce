with 
source AS (
    SELECT * FROM {{ source("bronze" , "raw_produtos")}}
),
renamed AS (
    SELECT 
        CAST(id_produto AS INTEGER)	AS id_produto,
        CAST(nome_produto AS STRING) AS nome_produto,
        CASE 
            WHEN LOWER(categoria) IN ('eletronicos', 'eletrônicos') THEN 'Eletrônicos'
            WHEN LOWER(categoria) = 'games' THEN 'Games'
            WHEN LOWER(categoria) = 'informática' THEN 'Informática'
            ELSE 'Outros'
        END AS categoria,
        SAFE_CAST(preco AS FLOAT64) AS preco,
    FROM source
)
SELECT * FROM renamed