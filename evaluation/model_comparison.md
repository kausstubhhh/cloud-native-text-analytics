# Model Evaluation

This document summarises the evaluation of classical machine learning models and generative AI approaches used in the system.

## Models Evaluated

- Logistic Regression (BigQuery ML)
- Random Forest (BigQuery ML)
- Gemini 2.5 Flash (Vertex AI)

## Evaluation Dataset

AG News validation subset.

Total samples used for LLM evaluation: 2000.

## Metrics

The following metrics were considered:

- Accuracy
- Precision / Recall
- Latency
- Cost per inference

## Results Summary

| Model | Method | Accuracy |
|------|------|------|
| Logistic Regression | Classical ML | 0.789 |
| Gemini 2.5 Flash | Zero-Shot | 0.873 |
| Gemini 2.5 Flash | Few-Shot | **0.901** |

Few-shot prompting provided the highest classification performance.

## Key Observation

Large language models demonstrated stronger semantic understanding compared to classical statistical models, though with higher latency.
