-- =====================================================
-- PHASE 5: Prompt Engineering Experiment
-- Few-Shot Classification using Gemini
-- =====================================================


-- =====================================================
-- Generate Few-Shot Predictions
-- =====================================================

CREATE OR REPLACE TABLE text_analytics.gemini_few_shot_predictions AS
SELECT
  text,
  label,
  JSON_VALUE(
    ml_generate_text_result,
    '$.candidates[0].content.parts[0].text'
  ) AS gemini_prediction
FROM ML.GENERATE_TEXT(
  MODEL `text_analytics.gemini_model`,
  (
    SELECT
      text,
      label,
      CONCAT(
        'You are a news classifier.\n',
        'Choose ONLY one label from the following list:\n',
        'World, Sports, Business, Sci/Tech.\n\n',

        'Example 1:\n',
        'Article: Apple releases new iPhone model with improved processor.\n',
        'Label: Sci/Tech\n\n',

        'Example 2:\n',
        'Article: Manchester United defeats Chelsea in Premier League match.\n',
        'Label: Sports\n\n',

        'Example 3:\n',
        'Article: Global stock markets fall amid recession concerns.\n',
        'Label: Business\n\n',

        'Example 4:\n',
        'Article: UN holds emergency meeting on international conflict.\n',
        'Label: World\n\n',

        'Now classify this article.\n\n',
        'Article:\n',
        text,
        '\n\nLabel:'
      ) AS prompt
    FROM text_analytics.llm_test_sample
  )
);



-- =====================================================
-- Convert Predictions to Numeric Labels
-- =====================================================

CREATE OR REPLACE TABLE text_analytics.gemini_few_shot_numeric AS
SELECT
  text,
  label AS true_label,
  gemini_prediction,
  CASE
    WHEN gemini_prediction = 'World' THEN 0
    WHEN gemini_prediction = 'Sports' THEN 1
    WHEN gemini_prediction = 'Business' THEN 2
    WHEN gemini_prediction = 'Sci/Tech' THEN 3
  END AS predicted_label
FROM text_analytics.gemini_few_shot_predictions;



-- =====================================================
-- Evaluate Few-Shot Accuracy
-- =====================================================

SELECT
  COUNT(*) AS total_samples,
  SUM(CASE WHEN true_label = predicted_label THEN 1 ELSE 0 END) AS correct_predictions,
  AVG(CASE WHEN true_label = predicted_label THEN 1 ELSE 0 END) AS accuracy
FROM text_analytics.gemini_few_shot_numeric;
