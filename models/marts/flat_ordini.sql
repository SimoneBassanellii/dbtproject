with fact as (select * from {{ ref('fact_ordini') }}),
utenti as (select * from {{ ref('dim_utenti') }}),
piani as (select * from {{ ref('stg_piani') }})

select
    f.*,
    u.nome as utente_nome,
    u.cognome as utente_cognome,
    p.nome_piano,
    p.durata_mesi
from fact f
left join utenti u on f.id_utente = u.id_utente
left join piani p on f.id_piano = p.id_piano