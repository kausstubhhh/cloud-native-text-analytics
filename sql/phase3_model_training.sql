-- =====================================================
-- PHASE 3: Classical Machine Learning Baseline
-- =====================================================


-- =====================================================
-- Train Logistic Regression Model
-- =====================================================

CREATE OR REPLACE MODEL text_analytics.logistic_regression_model
OPTIONS(
  model_type='logistic_reg',
  input_label_cols=['label']
) AS
SELECT
  text,
  label
FROM text_analytics.train_split;



-- =====================================================
-- Train Random Forest Model
-- =====================================================

CREATE OR REPLACE MODEL text_analytics.random_forest_model
OPTIONS(
  model_type='random_forest_classifier',
  input_label_cols=['label'],
  num_parallel_tree=50
) AS
SELECT
  text,
  label
FROM text_analytics.train_split;



-- =====================================================
-- Evaluate Logistic Regression
-- =====================================================

SELECT *
FROM ML.EVALUATE(
  MODEL text_analytics.logistic_regression_model,
  (
    SELECT text, label
    FROM text_analytics.validation_split
  )
);



-- =====================================================
-- Evaluate Random Forest
-- =====================================================

SELECT *
FROM ML.EVALUATE(
  MODEL text_analytics.random_forest_model,
  (
    SELECT text, label
    FROM text_analytics.validation_split
  )
);
