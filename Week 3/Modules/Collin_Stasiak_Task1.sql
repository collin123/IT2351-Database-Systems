 -- Written by Collin Stasiak on 2/20/23 for IT2351
 -- Adds static data to the ap.terms table
 -- add data to ap.terms
INSERT INTO ap.terms (terms_id, terms_description, terms_due_days)
VALUES
-- adds these values in order column list is defined
(6, "Net due 120 days", 120);
-- check that our insertion worked
SELECT * FROM ap.terms
WHERE terms_id = 6;
