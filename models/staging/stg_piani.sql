select
    id as id_piano,
    nome as nome_piano,
    prezzo as prezzo_listino,
    durata as durata_mesi
from {{ source('raw_pay', 'piani') }}