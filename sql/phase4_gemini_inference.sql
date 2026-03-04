-- Phase 4: Gemini Zero-Shot Classification

CREATE OR REPLACE TABLE text_analytics.gemini_zero_shot_predictions AS
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
        'Classify the following news article into one of these categories: ',
        'World, Sports, Business, Sci/Tech. ',
        'Return only the category name.',
        '\n\nArticle:\n',
        text
      ) AS prompt
    FROM text_analytics.llm_test_sample
  )
);
