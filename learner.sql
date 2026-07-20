-- 1. Total Records
select count(*) as Total_records from learner;
--15029


-- 2. Total columns
select count(*) as total_columns
from information_schema.columns
 where table_name='learner';
 -- 256 columns


 -- 3. Preview the dataset
 select * from learner
 limit 10;


 -- 4. check duplicate primary key
 select pk, count(*) total
 from learner
 group by pk
 having count(*)>1;
 -- 304 duplicated pk


 -- 5. duplicate sk
 select sk, count(*) total
 from learner
 group by sk
 having count(*)>1; 
 -- have duplicated sk with null(184)


-- 6. Check duplicate application_id
select application_id, count(*) 
from learner
group by application_id
having count(*)>1;
-- having duplicate app_id

-- 7. Duplicate relation_id
SELECT relation_id, COUNT(*)
FROM learner
GROUP BY relation_id
HAVING COUNT(*) > 1;
-- null 14784, have duplicate 


-- 8. check missing values with %
-- 9. completeness

-- 10. status distribution
select status, count(*) as total
from learner
group by status
order by total desc;
-- null- 5978, outlier-                        {                         %22label%22: %22Yemen%22


-- 11. Payment status distribution
select payment_status, count(*) as total
from learner
group by payment_status
order by payment_status desc;
-- null- 5995
-- unpaid- 8529
-- paid- 504, outlier-                       {                         %22label%22: %22Zimbabwe%22


-- 13. Assigned cohort distributiion
select assigned_cohort, count(*) as total
from learner
group by assigned_cohort
order by total desc;
-- total- 2822


-- 14. student_status_distribution
select please_identify_your_student_status, count(*) as total
from learner
group by please_identify_your_student_status
order by total desc;
-- null (15023), 
-- prospectiveUndergraduateStudent- 4
-- prospectiveGraduateStudents-1 
-- outlier-                    %22tableView%22: true


-- 15. Fee distribution
select fee, count(*) as total
from learner
group by fee
order by total desc;
-- text datatype


-- 16. pending amount paid
select amount_to_be_paid, count(*) as total
from learner
group by amount_to_be_paid
order by total desc;
-- text


-- 17. withdrawal analysis
select count(*) Total_withdraws
from learner
where withdraw_date is not null;
-- 386


-- 18. Droupout analysis
select count(*) Total_dropout
from learner
where dropped_out_date is not null;
-- 322


-- 19. Completion analysis
select count(*) Total_completion
from learner
where completion_date is not null;
-- 1132


-- 20. Marketing source
select how_did_you_hear_about_this_opportunity, count(*) as total_source
from learner
group by how_did_you_hear_about_this_opportunity
order by total_source desc;
-- null(14978)
-- socialMedia, emailFromRochesterInstituteofTechnology, emailFromSaintLouisUniversity,myFriendRelative, googleSearch,
-- Gwendolyn Brooks College Prep, Gwendolyn Brooks College Prep, Kruu Website, Saint Louis University, other
-- outlier-                    %22type%22: %22select%22, '"size'":'"25566'"



-- 21. Internship source
select from_which_medium_did_you_hear_about_the_internship, count(*) as total_source
from learner
group by from_which_medium_did_you_hear_about_the_internship
order by total_source desc;
-- null(15005)
-- workshopFairOrganisedBySaintLouisUniversity, printedLetter, socialMedia, recommendedByAFriendFamilyCounsellor, googleSearch
-- outlier-                    %22type%22: %22textfield%22



-- 22. Wishlist analysis
select appear_in_wishlist, count(*) as total_wishlist
from learner
group by appear_in_wishlist
order by total_wishlist desc;
-- null(10831)


-- 23. Team appications
select team_name, count(*) as members
from learner
group by team_name
order by members desc;


-- 24. Transaction status
select transaction_id, payment_status, count(*) as trans
from learner
group by transaction_id, payment_status
order by trans desc;
