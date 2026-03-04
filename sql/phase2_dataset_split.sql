-- PHASE 2: Dataset Preparation for BigQuery ML
-- Project: Scalable Cloud-Native Text Analytics System
-- Dataset: text_analytics

-- 1. Inspect Clean Dataset

SELECT *
FROM text_analytics.train_clean
LIMIT 5;


-- 2. Check Class Distribution

SELECT
  label,
  COUNT(*) AS samples
FROM text_analytics.train_clean
GROUP BY label
ORDER BY label;


-- 3. Create Training Split (80%)

CREATE OR REPLACE TABLE text_analytics.train_split AS
SELECT *
FROM text_analytics.train_clean
WHERE RAND() < 0.8;


-- 4. Create Validation Split (20%)

CREATE OR REPLACE TABLE text_analytics.validation_split AS
SELECT *
FROM text_analytics.train_clean
WHERE RAND() >= 0.8;


-- 5. Verify Training Split Size

SELECT COUNT(*) AS train_rows
FROM text_analytics.train_split;


-- 6. Verify Validation Split Size

SELECT COUNT(*) AS validation_rows
FROM text_analytics.validation_split;


-- 7. Check Training Label Distribution

SELECT
  label,
  COUNT(*) AS samples
FROM text_analytics.train_split
GROUP BY label
ORDER BY label;


-- 8. Check Validation Label Distribution

SELECT
  label,
  COUNT(*) AS samples
FROM text_analytics.validation_split
GROUP BY label
ORDER BY label;
