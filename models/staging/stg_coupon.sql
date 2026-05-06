select
    id as id_coupon,
    codice,
    sconto as percentuale_sconto
from {{ source('raw_pay', 'coupon') }}