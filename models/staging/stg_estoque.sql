with 
source AS (
    SELECT * FROM {{ source("bronze" , "raw_estoque")}}
),
renamed AS (
    SELECT 
        CAST(id_produto AS INTEGER)	AS id_produto,
        CAST(quantidade_estoque AS INTEGER)	AS qtd_estoque,
        CAST(data_atualizacao AS DATE) AS data_atualizacao,
    FROM source
)
SELECT * FROM renamed