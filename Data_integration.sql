-- Is learner.relation_id equal to opportunity.pk?
select p.pk from opportunity as p
join learner as l
on l.relation_id= p.pk;
-- No rows in output means are not equal

-- pk and sk.learner
select p.pk from opportunity as p
join learner as l
on l.sk= p.pk;



-- Is learner.relation_id equal to opportunity.opportunity_id?
select p.opportunity_id from opportunity as p
join learner as l
on l.relation_id= p.opportunity_id;
-- not same


-- opportunity_id uniquesness
select opportunity_id, count(*)
from opportunity
group by  opportunity_id
having count(*) >1;
-- yes all value are unique


-- relation_id check
select count(*) filter (where relation_id is null) from learner;
-- 14784

select relation_id, count(*)
from learner
group by  relation_id
having count(*) >1;
-- only 6 realtion_id where unique are only 3

select code, count(*)
from opportunity
group by  code
having count(*) >1;

select work_item_sk, count(*)
from learner
group by  work_item_sk
having count(*) >1;

-- pk and realtion id
select pk from opportunity
limit 10;

select external_reference_url from learner
limit 10;



-- replace the learner to opportunity
select opportunity_id from opportunity;
select sk from learner;

select sk,
replace(sk,'Learner#','Opportunity#') as converted_value
from learner
limit 10;


-- compare both data
SELECT COUNT(*) AS matched_rows
FROM learner l
JOIN opportunity o
ON REPLACE(l.sk, 'Learner#', 'Opportunity#') = o.opportunity_id;
-- 14799 rows


-- checking the data is same
SELECT
    l.sk,
    REPLACE(l.sk, 'Learner#', 'Opportunity#') AS converted_sk,
    o.opportunity_id,
    o.name
FROM learner l
JOIN opportunity o
ON REPLACE(l.sk, 'Learner#', 'Opportunity#') = o.opportunity_id
LIMIT 20;


-- total matching percentage
SELECT
    COUNT(*) AS total_learners,
    COUNT(o.opportunity_id) AS matched,
    COUNT(*) - COUNT(o.opportunity_id) AS unmatched,
    ROUND(COUNT(o.opportunity_id) * 100.0 / COUNT(*), 2) AS match_percentage
FROM learner l
LEFT JOIN opportunity o
ON REPLACE(l.sk, 'Learner#', 'Opportunity#') = o.opportunity_id;


-- create table and join
CREATE TABLE merge_data AS
SELECT

    /* =========================
       Opportunity Columns
       ========================= */

    o.pk                  AS opportunity_pk,
    o.opportunity_id,
    o.badge,
    o.careeraddon,
    o.category            AS opportunity_category,
    o.code,
    o.cohort,
    o.created_at          AS opportunity_created_at,
    o.currency_type,
    o.current_editor,
    o.dropouttransaction,
    o.duration,
    o.duration_type,
    o.eligibility,
    o.fee                 AS opportunity_fee,
    o.image_link,
    o.is_archived,
    o.is_auto_approve,
    o.last_date_to_apply,
    o.location,
    o.long_description,
    o.microscholarship,
    o.modified_at         AS opportunity_modified_at,
    o.name,
    o.notstartedtransaction,
    o.panellist,
    o.reward,
    o.role,
    o.role_responsibility,
    o.short_description,
    o.summary,
    o.testimonial,
    o.tracking_questions,

    /* =========================
       Learner Columns
       ========================= */

    l.*

FROM opportunity o

INNER JOIN learner l

ON o.opportunity_id =
REPLACE(l.sk,'Learner#','Opportunity#');


-- check the intergated table
-- Total rows 
select count(*) from merge_data;
-- 14799

-- Total columns
select count(*) from information_schema.columns
where table_name='merge_data';
-- 289 columns

-- verify the join quality
select
count(*) as total_records,
count(distinct opportunity_id) as total_opp,
count(distinct application_id) as total_app
from merge_data;
-- total_opp= 5730, app- 247


-- check the unmatched rows
select
count(*) as unmatched_rows
from learner l
left join opportunity o
on o.opportunity_id= replace(l.sk, 'Learner#', 'Opportunity#')
where o.opportunity_id is null;
-- 230 rows


