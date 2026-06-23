with 
source AS (
    SELECT * FROM {{ source("bronze" , "raw_entregas")}}
),
renamed AS (
    SELECT 
        CAST(id_entrega AS INTEGER)	AS id_entrega,
        CAST(id_venda AS INTEGER)	AS id_venda,
        CAST(transportadora.nome AS STRING)	AS transportadora,
        CASE 
            -- Padroniza todas as variações de "em trânsito"
            WHEN status IN ('em trânsito', 'EM TRANSITO', 'em transito', 'EM TRÂNSITO') THEN 'Em Trânsito'
            -- Mantém o padrão para "Entregue"
            WHEN status IN ('Entregue', 'entregue', 'ENTREGUE') THEN 'Entregue'
            -- Retorna o valor original caso exista outro status diferente
            ELSE status 
        END AS status,
        CAST(observacao AS STRING)	AS observacao
    FROM source
)
SELECT * FROM renamed


