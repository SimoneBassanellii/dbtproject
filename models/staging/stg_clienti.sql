select
    id as cliente_id, 
    nome as cliente_nome,   
    email 
from {{ source('deliveroo','clienti') }}