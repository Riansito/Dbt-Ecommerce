-- Classifica o nível de estoque dos produtos com base na quantidade disponível.
-- Este modelo facilita o monitoramento do estoque e a identificação de produtos
-- que necessitam de reposição.

SELECT

    -- Identificador do produto.
    id_produto,

    -- Quantidade disponível em estoque.
    qtd_estoque,

    -- Data da última atualização do estoque.
    data_atualizacao,

    -- Classifica o estoque conforme faixas pré-definidas.
    CASE
        WHEN qtd_estoque <= 5 THEN 'Crítico'
        WHEN qtd_estoque <= 20 THEN 'Baixo'
        WHEN qtd_estoque <= 50 THEN 'Médio'
        ELSE 'Normal'
    END AS status_estoque

FROM {{ ref('stg_estoque') }}
