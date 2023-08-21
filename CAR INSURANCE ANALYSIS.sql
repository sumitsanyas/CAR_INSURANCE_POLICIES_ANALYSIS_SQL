use test
select * from car
DESCRIBE CAR

--Demographic Analysis:
--What is the distribution of policyholders by gender?

SELECT
    GENDER,
    COUNT(ID) AS COUNT_OF_POLICIES,
    (COUNT(ID) * 100 / (SELECT COUNT(ID) FROM CAR)) AS PERCENTAGE_OF_TOTAL
FROM
    CAR
GROUP BY
    GENDER;

--How many policyholders are married vs. single?

SELECT MARITAL_STATUS ,COUNT(ID) AS COUNT_OF_POLICIES
FROM CAR 
GROUP BY MARITAL_STATUS 
ORDER BY COUNT(ID) DESC

--What is the average age of policyholders?

SELECT AVG(DATEDIFF(CURRENT_DATE, BIRTHDATE) / 365) AS AVERAGE_AGE
FROM CAR;

--Car Information Analysis:
--What are the most common car makes and models among policyholders?

SELECT car_make, car_model, COUNT(*) AS num_policies
FROM CAR
GROUP BY car_make, car_model
ORDER BY num_policies DESC;

--How many policyholders have kids who are driving?

SELECT COUNT(ID) AS policyholders
FROM CAR
WHERE KIDS_DRIVING <>0

--Claim Analysis:
--What is the average claim amount?

SELECT AVG(CLAIM_AMT)
FROM CAR

--How frequently do policyholders make claims 

SELECT CLAIM_FREQ , COUNT(ID) AS policyholders
FROM CAR
GROUP BY CLAIM_FREQ 
ORDER BY policyholders DESC 

--How many policyholders are parents? How many of them have kids driving?

SELECT MARITAL_STATUS , COUNT(ID) AS POLICY_HOLDERS 
FROM CAR WHERE MARITAL_STATUS <> 'SINGLE' AND KIDS_DRIVING<>0
GROUP BY MARITAL_STATUS

--How many policyholders are there in each coverage zone?

SELECT COVERAGE_ZONE , COUNT(ID) AS POLICY_HOLDERS
FROM CAR
GROUP BY COVERAGE_ZONE ORDER BY POLICY_HOLDERS DESC

---What is the average claim amount for each coverage zone?

SELECT COVERAGE_ZONE , AVG(CLAIM_AMT) AS AVG_AMOUNT
FROM CAR
GROUP BY COVERAGE_ZONE ORDER BY AVG_AMOUNT DESC

--What is the average household income of policyholders?

SELECT AVG(HOUSEHOLD_INCOME) FROM CAR

--What is the distribution of policyholders' education levels?

SELECT EDUCATION , COUNT(ID) AS POLICY_HOLDERS
FROM CAR
GROUP BY EDUCATION ORDER BY POLICY_HOLDERS DESC

