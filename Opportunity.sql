-- 1. Total Application Records
select count (*) as Total_Records from opportunity;
-- total records= 5733

-- 2. Total Number of columns
select count(*) from information_schema.columns
where table_name='opportunity' ;
-- 33 columns

-- 3. Preview the data
select * from opportunity
limit 10;

-- 4. Check the Duplicate Opportunities
select opportunity_id from opportunity;
select opportunity_id, count(*) from opportunity
group by opportunity_id
having count(*) > 1;
-- No duplicate opportunity

-- 5. Check the duplicate Primary Key
select pk, count(*) from opportunity
group by pk
having count(*) > 1;
-- 5730 

-- 6. Count Missing values

-- 1 Name column
select count(*)as total_rows,

count(*) filter (where name is NULL) as missing_name,

round(
count(*) filter (where name is null) * 100.0 /count(*),2) as missing_name_per 
from opportunity;
-- 3 missing_name, 0.05 %


-- 2 pk Column
select count(*) filter (where pk is null) as missing_pk,
round(
count(*) filter (where pk is null) * 100.0 /count(*),2) as missing_pk_per 
from opportunity;
-- 0 pk missing, 0.00%


-- 3 opportunity_id column
select count(*) filter (where opportunity_id is null) as missiing_opp_id,
round(
count(*) filter (where opportunity_id is null) * 100.0 /count(*),2) as missing_opportunity_id_per 
from opportunity;
-- 0 mising opportunity_id, 0.00 %


-- 4 role column
select count(*) filter (where role is null) as missing_role,
round(
count(*) filter (where role is null) * 100.0 /count(*),2) as missing_role_per 
from opportunity;
-- 3840 missing_role, 66.98%


-- 5 fee column
select count(*) filter (where fee is null) as missing_fee,
round(
count(*) filter (where fee is null) * 100.0 /count(*),2) as missing_fee_per 
from opportunity;
-- 2 missing_fee, 0.03%


-- 6 category column
select count(*) filter (where category is null) as missing_category,
round(
count(*) filter (where category is null) * 100.0 /count(*),2) as missing_category_per 
from opportunity;
-- 2 missing_category, 0.03%


-- 7 location category
select count(*) filter (where location is null) as missing_location,
round(
count(*) filter (where location is null) * 100.0 /count(*),2) as missing_location_per 
from opportunity;
-- 976 misisng_location, 17.02 %


-- 8 duration column
select count(*) filter (where duration is null) as missing_duration,
round(
count(*) filter (where duration is null) * 100.0 /count(*),2) as missing_duration_per 
from opportunity;
-- 2 missing_duration, 0.03 %


-- 9 current_editor column
select count(*) filter (where current_editor is null) as missing_current_editor,
round(
count(*) filter (where current_editor is null) * 100.0 /count(*),2) as missing_current_editor_per 
from opportunity;
-- 5516 missing_current_editor, 96.21%


-- 10 tracking_questions
select count(*) filter (where tracking_questions is null) as misisng_tracking_ques,
round(
count(*) filter (where tracking_questions is null) * 100.0 /count(*),2) as missing_tracking_questions_per 
from opportunity;
-- 1108 missing_tracking_ques, 19.33 %


-- 11 role_responsibility column
select count(*) filter (where role_responsibility is null) as misisng_role_res,
round(
count(*) filter (where role_responsibility is null) * 100.0 /count(*),2) as missing_role_responsibility_per
from opportunity;
-- 4654 missing_role_res, 81.18 %


-- 12 code column
select count(*) filter (where code is null) as mising_code,
round(
count(*) filter (where code is null) * 100.0 /count(*),2) as missing_code_per
from opportunity;
-- 3 missing_code, 0.05%


-- 12 created_at column
select count(*) filter (where created_at is null) as mising_created_at,
round(
count(*) filter (where created_at is null) * 100.0 /count(*),2) as missing_created_at_per
from opportunity;
-- 3 missing_created_at, 0.05%


-- 14 currency_type column
select count(*) filter (where currency_type is null) as mising_currency_type,
round(
count(*) filter (where currency_type is null) * 100.0 /count(*),2) as missing_currency_type_per
from opportunity;
-- 342 missing_currency_type, 5.97%


-- 15 duration_type column
select count(*) filter (where duration_type is null) as mising_duration_type,
round(
count(*) filter (where duration_type is null) * 100.0 /count(*),2) as missing_duration_type_per
from opportunity;
-- 4 misisng_duration_type, 0.07%


-- 16 image_link column
select count(*) filter (where image_link is null) as mising_image_link,
round(
count(*) filter (where image_link is null) * 100.0 /count(*),2) as missing_image_link_per
from opportunity;
-- 8 missing_image_link, 0.14%


-- 17 is_archived column
select count(*) filter (where is_archived is null) as mising_is_archived,
round(
count(*) filter (where is_archived is null) * 100.0 /count(*),2) as missing_is_archived_per
from opportunity;
-- 5205 misisng_is_archived, 90.79%


-- 18 is_aotuo_approve column
select count(*) filter (where is_auto_approve is null) as missing_is_auto_approve,
round(
count(*) filter (where is_auto_approve is null) * 100.0 /count(*),2) as missing_is_auto_approve_per
from opportunity;
-- 2 misisng_is_auto_approve, 0.03%


-- 19 last_date_to_apply column
select count(*) filter (where last_date_to_apply is null) as missing_last_date_to_apply,
round(
count(*) filter (where last_date_to_apply is null) * 100.0 /count(*),2) as missing_last_date_to_apply_per
from opportunity;
-- 3 missing_last_date_to_apply, 0.05%


-- 20 long_description column/ Opportunity without discription
select count(*) filter (where long_description is NULL) as missing_long_description,
round(
count(*) filter (where long_description is null) * 100.0 /count(*),2) as missing_long_description_per
from opportunity;
-- 346 mising_long_description, 6.04%


-- 21 microscholarship column
select count(*) filter (where microscholarship is NULL) as missing_microscholarship,
round(
count(*) filter (where microscholarship is null) * 100.0 /count(*),2) as missing_microscholarship_per
from opportunity;
-- 3 missing_microscholarship, 0.05%


-- 22 modified_at column
select count(*) filter (where modified_at is NULL) as missing_modified_at,
round(
count(*) filter (where modified_at is null) * 100.0 /count(*),2) as missing_modified_ats_per
from opportunity;
-- 2 missing_modified_at, 0.03%


-- 23 short_description column
select count(*) filter (where short_description is NULL) as missing_short_description,
round(
count(*) filter (where short_description is null) * 100.0 /count(*),2) as missing_short_description_per
from opportunity;
-- 3 missing_short_description, 0.05%


-- 24 summary column
select count(*) filter (where summary is NULL) as missing_summary,
round(
count(*) filter (where summary is null) * 100.0 /count(*),2) as missing_summary_per
from opportunity;
-- 5532 missing_summary

-- changed the column name beacause started with capital letter which cannot used for analysis

-- 25 eligibility column
alter table opportunity
rename column "Eligibility" to eligibility;

select count(*) filter (where eligibility is NULL) as missing_eligibility,

round(
count(*) filter (where eligibility is null ) * 100.0 / count(*), 2
) as missing_eligibility_per
from opportunity;
-- 352 missing_eligibility, 6.12 %



-- 26 Reward column
alter table opportunity
rename column "Reward" to reward;

select count(*) filter (where reward is null) as missing_reward,

round(
count(*) filter (where reward is null ) * 100.0 / count(*), 2
) as missing_reward_per
from opportunity;
-- 367 missing_reward, 6.40 %


-- 27 Badge column
alter table opportunity
rename column "Badge" to badge;

select count(*) filter (where badge is null) as misisng_badge,

round(
count(*) filter (where badge is null ) * 100.0 / count(*), 2
) as missing_badge_per 
from opportunity;
-- 367 missing_badge, 6.40%


-- 28 CareerAddOn column
alter table opportunity
rename column "CareerAddOn" to careerAddOn;

select count(*) filter (where careerAddOn is null) as missing_careerAddOn,

round(
count(*) filter (where careerAddOn is null ) * 100.0 / count(*), 2
) as missing_careerAddOn_per 
from opportunity;
-- 4825 missing_careerAddOn, 88.16 %


--  29 Cohort column
alter table opportunity
rename column "Cohort" to cohort;

select count(*) filter (where cohort is null) as missing_cohort,

round(
count(*) filter (where cohort is null ) * 100.0 / count(*), 2
) as missing_cohort_per
from opportunity;
-- 21 missing_cohort, 0.37 %



-- 30 DropoutTransaction column
alter table opportunity
rename column "DropoutTransaction" to dropoutTransaction;

select count(*) filter (where dropoutTransaction is null) as missing_DropoutTransaction,

round(
count(*) filter (where dropoutTransaction is null ) * 100.0 / count(*), 2
) as missing_dropoutTransaction_per 
from opportunity;
-- 5720 missing_DropoutTransaction, 99.77%



-- 31 NotStartedTransaction column
alter table opportunity
rename column "NotStartedTransaction" to notStartedTransaction;

select count(*) filter (where notStartedTransaction is null) as missing_NotStartedTransaction,

round(
count(*) filter (where notStartedTransaction is null ) * 100.0 / count(*), 2
) as missing_notStartedTransaction_per from opportunity;
-- 5719 missing_NotStartedTransaction, 99.76%



-- 32 Panellist column
alter table opportunity
rename column "Panellist" to panellist;

select count(*) filter (where panellist is null) as missing_Panellist,

round(
count(*) filter (where panellist is null ) * 100.0 / count(*), 2
) as missing_penellist_per
from opportunity;
-- 4560 missing_Panellist, 79.54 %



-- 33 Testimonial column
alter table opportunity
rename column "Testimonial" to testimonial;

select count(*) filter (where testimonial is null) as missing_Testimonial,

round(
count(*) filter (where testimonial is null ) * 100.0 / count(*), 2
) as missing_testimonial_per 
from opportunity;
-- 4882 missing_Testimonial, 85.16 %


-- 7. Missing Percentage
select 
round(
((
count(*) filter (where pk is null)+
COUNT(*) FILTER (WHERE name IS NULL) +
                COUNT(*) FILTER (WHERE category IS NULL) +
                COUNT(*) FILTER (WHERE role IS NULL) +
                COUNT(*) FILTER (WHERE location IS NULL) +
                COUNT(*) FILTER (WHERE duration IS NULL) +
                COUNT(*) FILTER (WHERE eligibility IS NULL) +
                COUNT(*) FILTER (WHERE fee IS NULL) +
                COUNT(*) FILTER (WHERE reward IS NULL)+
				COUNT(*) FILTER (WHERE code IS NULL) +
                COUNT(*) FILTER (WHERE opportunity_id IS NULL) +
                COUNT(*) FILTER (WHERE badge IS NULL) +
                COUNT(*) FILTER (WHERE careerAddOn IS NULL) +
                COUNT(*) FILTER (WHERE cohort IS NULL) +
                COUNT(*) FILTER (WHERE created_at IS NULL) +
                COUNT(*) FILTER (WHERE currency_type IS NULL) +
                COUNT(*) FILTER (WHERE current_editor IS NULL)+
				COUNT(*) FILTER (WHERE dropoutTransaction IS NULL) +
                COUNT(*) FILTER (WHERE duration_type IS NULL) +
                COUNT(*) FILTER (WHERE image_link IS NULL) +
                COUNT(*) FILTER (WHERE is_archived IS NULL) +
                COUNT(*) FILTER (WHERE is_auto_approve IS NULL) +
                COUNT(*) FILTER (WHERE long_description IS NULL) +
                COUNT(*) FILTER (WHERE last_date_to_apply IS NULL) +
                COUNT(*) FILTER (WHERE microscholarship IS NULL)+
				COUNT(*) FILTER (WHERE modified_at IS NULL) +
                COUNT(*) FILTER (WHERE notStartedTransaction IS NULL) +
                COUNT(*) FILTER (WHERE panellist IS NULL) +
                COUNT(*) FILTER (WHERE role_responsibility IS NULL) +
                COUNT(*) FILTER (WHERE short_description IS NULL) +
                COUNT(*) FILTER (WHERE summary IS NULL) +
                COUNT(*) FILTER (WHERE testimonial IS NULL) +
                COUNT(*) FILTER (WHERE tracking_questions IS NULL)

) * 100.0
)/ (count(*) * 33),2 
) as missing_percentage
from opportunity;
-- 28.74 % missing values are in the dataset


-- 8. Overall Completeness
select 
round( 100-
((
count(*) filter (where pk is null)+
COUNT(*) FILTER (WHERE name IS NULL) +
                COUNT(*) FILTER (WHERE category IS NULL) +
                COUNT(*) FILTER (WHERE role IS NULL) +
                COUNT(*) FILTER (WHERE location IS NULL) +
                COUNT(*) FILTER (WHERE duration IS NULL) +
                COUNT(*) FILTER (WHERE eligibility IS NULL) +
                COUNT(*) FILTER (WHERE fee IS NULL) +
                COUNT(*) FILTER (WHERE reward IS NULL)+
				COUNT(*) FILTER (WHERE code IS NULL) +
                COUNT(*) FILTER (WHERE opportunity_id IS NULL) +
                COUNT(*) FILTER (WHERE badge IS NULL) +
                COUNT(*) FILTER (WHERE careerAddOn IS NULL) +
                COUNT(*) FILTER (WHERE cohort IS NULL) +
                COUNT(*) FILTER (WHERE created_at IS NULL) +
                COUNT(*) FILTER (WHERE currency_type IS NULL) +
                COUNT(*) FILTER (WHERE current_editor IS NULL)+
				COUNT(*) FILTER (WHERE dropoutTransaction IS NULL) +
                COUNT(*) FILTER (WHERE duration_type IS NULL) +
                COUNT(*) FILTER (WHERE image_link IS NULL) +
                COUNT(*) FILTER (WHERE is_archived IS NULL) +
                COUNT(*) FILTER (WHERE is_auto_approve IS NULL) +
                COUNT(*) FILTER (WHERE long_description IS NULL) +
                COUNT(*) FILTER (WHERE last_date_to_apply IS NULL) +
                COUNT(*) FILTER (WHERE microscholarship IS NULL)+
				COUNT(*) FILTER (WHERE modified_at IS NULL) +
                COUNT(*) FILTER (WHERE notStartedTransaction IS NULL) +
                COUNT(*) FILTER (WHERE panellist IS NULL) +
                COUNT(*) FILTER (WHERE role_responsibility IS NULL) +
                COUNT(*) FILTER (WHERE short_description IS NULL) +
                COUNT(*) FILTER (WHERE summary IS NULL) +
                COUNT(*) FILTER (WHERE testimonial IS NULL) +
                COUNT(*) FILTER (WHERE tracking_questions IS NULL)

) * 100.0
)/ (count(*) * 33),2 
) as data_completeness_percentage
from opportunity;
-- 71.26 %


-- 9. Check Empty String
select count(*) from opportunity
where trim(name)='';
-- 0 count


-- 10. Category Distribution
select category, count(*) as total
from opportunity
group by category
order by total desc;
-- 14 total category, outlier- \""ct\"":\""1766057859531\""(1), %22value%22: %221%22 }(1), { %22label%22: %22United Kingdom%22(1), Xploreu(2)


-- 11. Location Distribution
select location, count(*) as total
from opportunity
group by location
order by total desc;
-- null- 976, lack of standardization 


-- 12 Duration Distributiono
select duration,duration_type,  count(*) as total
from opportunity
group by duration, duration_type
order by duration desc;
-- Max duration- 99 weeks (G1-1 Opportunity tracking internship)
-- outlier- 0 week invalid data, 0 hour, %22value%22: %22Vanuatu%22 }
-- duartion type - da


-- 13. Archived Vs Active Opportunity
select is_archived , count(*) as total 
from opportunity
group by  is_archived
order by total desc;
-- null- 5205
-- True- 384
-- False- 141
-- outlier-\""mt\"":\""1766057859531\""}"",  { %22label%22: %22Yemen%22


-- 14. Auto Approval Distrbution
select is_auto_approve, count(*) as total from opportunity
group by is_auto_approve
order by total desc;
-- false- 4917
-- true- 811
-- outlier- {\""sk\"":\""PE#1766057859639A\"", %22value%22: %22Yemen%22 }, %22key%22: %22whyDoYouWantToApplyForThisInternship%22


-- 15. Fee Statistics
select fee , count(*) as total from opportunity
group by fee
order by total desc;
-- text datatype fee
-- 0 fee(free)- 4518, total 106 frequency, 
-- outlier- %22className%22: %22mb-6%22, 6.00E+12, \""ct\"":\""1766057859531\"", { %22label%22: %22Venezuela%22


-- data type check
select column_name, data_type
from information_schema.columns
where table_name= 'opportunity'
and column_name='fee';


-- 16. rerward distribution
select column_name, data_type
from information_schema.columns
where table_name= 'opportunity'
and column_name='reward';
-- text datatype


select reward , count(*) as total from opportunity
group by reward
order by total desc;
-- distribtuion- 5366 unique reward


-- 17. Currency Distribution
select currency_type , count(*) as total from opportunity
group by currency_type
order by total desc;
-- max- USD(4699), INR(355)
-- outlier- { %22label%22: %22Uzbekistan%22, \""ct\"":\""1766057859531\"", %22value%22: %224%22 }


-- 18. cohort distribution
SELECT cohort,
COUNT(*) as total
FROM opportunity
GROUP BY cohort
ORDER BY total DESC;
-- 5712 unique cohort


-- 19. created opportunities by month
select column_name, data_type
from information_schema.columns
where table_name='opportunity'
 and column_name= 'created_at'
 -- text
 -- cannot find month of the opportunity without converting it into datetime 

select created_at , count(*) as total from opportunity
group by created_at
order by total desc;


 -- 20. Last_date_to_apply distribution
 select last_date_to_apply , count(*) as total from opportunity
group by last_date_to_apply
order by total desc;
-- text cannot finnd last or first date to apply 


-- 21. Opportunity without deadline
select last_date_to_apply
from opportunity
where last_date_to_apply is null;
-- 3 only 


-- 22. Check Text length of description
select
min(length(long_description)) from opportunity;-- 1

select
max(length(long_description)) from opportunity;-- 4870

select
avg(length(long_description)) from opportunity;-- 320.60




