select
    id as id_ordine,
    id_utente,
    id_piano,
    id_metodo,
    id_coupon,
    data_ordine
from {{ source('raw_pay', 'ordini') }}