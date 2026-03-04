-- PHASE 1: AG News Data Ingestion and Preparation
-- Project: Scalable Cloud-Native Text Analytics System
-- Dataset: text_analytics

-- CLEAN TRAINING DATA

CREATE OR REPLACE TABLE text_analytics.train_clean AS
SELECT
  `Class Index` - 1 AS label,
  CONCAT(Title, ' ', Description) AS text
FROM text_analytics.train_raw
WHERE Title IS NOT NULL
  AND Description IS NOT NULL;

-- =========================================
-- CLEAN TEST DATA

CREATE OR REPLACE TABLE text_analytics.test_clean AS
SELECT
  `Class Index` - 1 AS label,
  CONCAT(Title, ' ', Description) AS text
FROM text_analytics.test_raw
WHERE Title IS NOT NULL
  AND Description IS NOT NULL;


-- VALIDATION QUERIES

SELECT COUNT(*) FROM text_analytics.train_clean;

SELECT COUNT(*) FROM text_analytics.test_clean;

SELECT label, COUNT(*)
FROM text_analytics.train_clean
GROUP BY label
ORDER BY label;
