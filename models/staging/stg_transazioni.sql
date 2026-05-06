select
    id as id_transazione,
    id_ordine,
    importo as importo_pagato,
    data_transazione
from {{ source('raw_pay', 'transazioni') }}