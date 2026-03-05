-- =====================================================
-- PHASE 6: Final Model Comparison
-- =====================================================

SELECT
  'Logistic Regression' AS model,
  'Classical ML' AS method,
  0.789 AS accuracy

UNION ALL

SELECT
  'Gemini 2.5 Flash',
  'Zero-Shot Prompt',
  0.8735

UNION ALL

SELECT
  'Gemini 2.5 Flash',
  'Few-Shot Prompt',
  0.901;
