WITH

-- Carrega os dados brutos da camada Bronze.
source AS (
    SELECT *
    FROM {{ source("bronze", "raw_produtos") }}
),

-- Padroniza os tipos de dados e trata os valores da categoria.
renamed AS (
    SELECT
        -- Converte o identificador do produto para inteiro.
        CAST(id_produto AS INTEGER) AS id_produto,

        -- Garante que o nome do produto seja armazenado como texto.
        CAST(nome_produto AS STRING) AS nome_produto,

        -- Padroniza os nomes das categorias para evitar inconsistências.
        CASE
            WHEN LOWER(categoria) IN ('eletronicos', 'eletrônicos') THEN 'Eletrônicos'
            WHEN LOWER(categoria) = 'games' THEN 'Games'
            WHEN LOWER(categoria) = 'informática' THEN 'Informática'
            ELSE 'Outros'
        END AS categoria,

        -- Converte o preço para valor numérico.
        SAFE_CAST(preco AS FLOAT64) AS preco

    FROM source
)

-- Retorna os dados tratados da camada Silver.
SELECT *
FROM renamed;
