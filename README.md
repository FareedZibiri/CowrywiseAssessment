# Approach to Problems and Challenges

#### Q1 - To find customers who have at least one saving plan and one investment plan, we create a CTE, query id, customer full name, number of savings plan, number of investments plan and the total deposit amount, grouping by name and id. In the main query, we then query all the columns in the CTE,  and filter for customers having one at least savings plan AND one investment plant. 

#### Q2 -

#### Q3 - To get accounts with no inflows for a year, we get their plan_id, owner_id, type of account (using plan_type_id) and last transaction date using MAX() first in the sub query. Then use the main query to get all the columns of the subquery in addition to finding the number of days the account has been inactive by doing a difference between current timestamp and last transaction date (use TIMESTAMP diff since it has a time part in the date). Then filter for accounts where the number of inactive days are greater than 365.

#### Q4 - Giving that for each customer, we want to ascertain the lifetime value through their transactions volume and value, we use a subquery to first get each customer id, their full name, their total transactions and transaction vaalue. In the main query, we then get the id, name, tenure months through TIMESTAMPDIFF, total transactions, and the estimated_clv



## Overall challenges
* Dealing with large number of columns and trying to determine correctly what the relevant columns mean.
* Identifying the primary keys and foriegn keys accurately.
