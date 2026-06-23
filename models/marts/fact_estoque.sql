select
    id_produto,
    qtd_estoque,
    data_atualizacao,

    case
        when qtd_estoque <= 5 then 'Crítico'
        when qtd_estoque <= 20 then 'Baixo'
        when qtd_estoque <= 50 then 'Médio'
        else 'Normal'
    end as status_estoque

from {{ ref('stg_estoque') }}