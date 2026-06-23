with 
source AS (
    SELECT * FROM {{ source("bronze" , "raw_pagamentos")}}
),
renamed AS (
    SELECT 
        CAST(id_pagamento AS INTEGER)	AS id_pagamento,
        CAST(id_venda AS INTEGER)	AS id_venda,
        CAST(cliente.id_cliente AS INTEGER)	AS id_cliente,
        CAST(forma_pagamento AS STRING)	AS forma_pagamento,
        SAFE_CAST(valor_pago AS FLOAT64)	AS valor_pago
    FROM source
)
SELECT * FROM renamed