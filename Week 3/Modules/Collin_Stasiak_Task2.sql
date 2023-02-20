 -- Written by Collin Stasiak on 2/20/23 for IT2351
 -- Update terms for terms_id 6, to change due date. 
UPDATE ap.terms -- update destination is terms table
SET 
	terms_description = "Net due in 125 days",
	terms_due_days = 125 -- change these columns in the terms table to new values
WHERE terms_id = 6; -- select the row in terms table where the id = 6
-- check that our update worked
SELECT * FROM ap.terms
WHERE terms_id=6;
