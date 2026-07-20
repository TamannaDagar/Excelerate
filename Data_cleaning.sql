-- 1. Understand the integrated data
select count(*) from cleaned_data;

select count(*) from
information_schema.columns
where table_name= 'cleaned_data';


-- checking the data types
select column_name,
data_type
from information_schema.columns
where table_name='cleaned_data'



