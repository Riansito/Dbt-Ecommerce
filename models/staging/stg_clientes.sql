with 
source AS (
    SELECT * FROM {{ source("bronze" , "raw_clientes")}}
),
renamed AS (
    SELECT 
        CAST(id_cliente AS INTEGER)	AS id_cliente,
        INITCAP(CAST(nome AS STRING)) AS nome,
        CAST(email AS STRING) AS email,
        INITCAP(CAST(cidade AS STRING)) AS cidade,
        CAST(estado AS STRING) AS estado,
        CAST(data_cadastro AS DATE) AS data_cadastro
    FROM source
)
SELECT * FROM renamed