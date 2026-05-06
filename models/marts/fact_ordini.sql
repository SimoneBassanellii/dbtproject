with ordini as (select * from {{ ref('stg_ordini') }}),
transazioni as (select * from {{ ref('stg_transazioni') }}),
piani as (select * from {{ ref('stg_piani') }})

select
    o.id_ordine,
    o.id_utente,
    o.id_piano,
    o.id_metodo,
    o.id_coupon,
    cast(o.data_ordine as date) as id_data,
    t.importo_pagato,
    p.prezzo_listino,
    -- Logica denormalizzata per i tipi di ordine
    case 
        when o.id_ordine in (select id_ordine from {{ source('raw_pay', 'rinnovi') }}) then 'Rinnovo'
        when o.id_ordine in (select id_ordine from {{ source('raw_pay', 'abbonamenti') }}) then 'Abbonamento'
        else 'Standard'
    end as tipo_ordine
from ordini o
left join transazioni t on o.id_ordine = t.id_ordine
left join piani p on o.id_piano = p.id_piano