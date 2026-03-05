# Project Progress Log

Project: Scalable Cloud-Native Text Analytics System  
Platform: Google Cloud Platform (BigQuery + Vertex AI)  
Dataset: AG News (4-class topic classification)

This document records the structured development phases of the system, including environment setup, data pipeline construction, and baseline model evaluation.

---

# Phase 0 — Environment Setup

## Objective

Prepare a controlled cloud environment with cost safeguards before experimentation.

## Configuration

Project Name: cloud-text-analytics  
Region: EU  
Vertex AI Region: europe-west4  
Budget Limit: £222  

Budget Alerts:
- 10%
- 30%
- 70%
- 90%

APIs Enabled:
- BigQuery API
- Vertex AI API

## Outcome

A dedicated GCP project was configured with cost controls and required APIs.  
This ensures all experimentation occurs within a controlled cloud environment.

---

# Phase 1 — Data Ingestion

## Objective

Load the AG News dataset into BigQuery and prepare a clean text dataset for modelling.

## Dataset

AG News Dataset  

Classes:

0 — World  
1 — Sports  
2 — Business  
3 — Sci/Tech  

Training Samples: 120,000  
Test Samples: 7,600

## Pipeline Steps

1. Upload CSV files into BigQuery  
2. Create raw tables  
3. Generate cleaned text field combining title and description  

Tables created:

text_analytics.train_raw  
text_analytics.test_raw  
text_analytics.train_clean  
text_analytics.test_clean  

## Outcome

Structured dataset prepared for ML training.

---

# Phase 2 — Dataset Splitting

## Objective

Create training and validation datasets for model evaluation.

## Strategy

Random split:

Training set: 80%  
Validation set: 20%

Tables created:

text_analytics.train_split  
text_analytics.validation_split  

## Result

Training samples: ~96,000  
Validation samples: ~24,000  

Class distribution remained balanced across all labels.

## Outcome

Dataset prepared for reproducible ML experimentation.

---

# Phase 3 — Classical ML Baseline

## Objective

Establish baseline performance using classical machine learning models before introducing LLM-based classification.

Models trained using BigQuery ML.

## Models

Logistic Regression  
Random Forest

Training dataset: train_split  
Evaluation dataset: validation_split

---

## Logistic Regression Results

Accuracy: ~0.79  
Precision: ~0.89  
Recall: ~0.79  
F1 Score: ~0.80  
ROC AUC: ~0.92  

Logistic regression performs well on text classification tasks due to its effectiveness with high-dimensional sparse feature spaces.

---

## Random Forest Results

Accuracy: ~0.27  
Precision: ~0.34  
Recall: ~0.27  
F1 Score: ~0.19  
ROC AUC: ~0.20  

Random forest performed poorly because tree-based models do not handle raw text features effectively without engineered numerical representations.

---

## Baseline Model

Logistic regression is selected as the classical ML baseline for further comparison.

Future phases will compare this baseline with generative AI approaches.

---

# Phase 4 — Generative AI Classification (Gemini)

## Objective

Integrate a generative AI model into the cloud-native pipeline and evaluate its performance on the AG News classification task.

Gemini was accessed through **Vertex AI remote models in BigQuery**, allowing LLM inference directly from SQL queries.

---

## Architecture Integration

A remote connection was created between **BigQuery and Vertex AI**.

Pipeline flow:

BigQuery Dataset  
→ SQL Prompt Construction  
→ Vertex AI Remote Model  
→ Gemini 2.5 Flash  
→ Predictions returned to BigQuery  

---

## Experimental Setup

To control cost and latency, a subset of the validation dataset was used.

Evaluation sample size:

2000 news articles

Table created:

text_analytics.llm_test_sample  

Each article was classified using a **zero-shot prompt**.

Prompt used:

Classify the following news article into one of these categories:  
World, Sports, Business, Sci/Tech.  
Return only the category name.

---

## Results

Predictions were generated using **ML.GENERATE_TEXT** and stored in:

text_analytics.gemini_zero_shot_predictions  

Predicted labels were converted to numeric format for evaluation.

Evaluation sample:

Total Samples: 2000  
Correct Predictions: 1747  

Accuracy:

0.8735

---

## Comparison with Baseline

| Model | Approach | Accuracy |
|------|------|------|
| Logistic Regression | Classical ML | ~0.79 |
| Gemini 2.5 Flash | Zero-Shot LLM | **0.8735** |

Gemini achieved higher accuracy than the classical baseline on the evaluation dataset.

# Phase 5 — Prompt Engineering Experiment

## Objective

Evaluate the effect of prompt engineering on generative AI classification performance.

Few-shot prompting was tested by providing labelled examples within the prompt to guide the model.

---

## Results

Evaluation sample: 2000 articles

Gemini Few-Shot Accuracy:

0.901

---

## Comparison

| Model | Method | Accuracy |
|------|------|------|
| Logistic Regression | Classical ML | ~0.79 |
| Gemini 2.5 Flash | Zero-Shot | ~0.87 |
| Gemini 2.5 Flash | Few-Shot | **~0.90** |

Few-shot prompting improved performance compared to zero-shot prompting by providing structured examples within the prompt.


# Phase 6 — System Evaluation

## Objective

Evaluate the performance of classical machine learning and generative AI approaches within the cloud-native text analytics system.

The evaluation focuses on three aspects:

- Accuracy
- Latency
- Cost

---

## Accuracy Comparison

The final experiment compares three approaches:

| Model | Method | Accuracy |
|------|------|------|
| Logistic Regression | Classical ML | 0.789 |
| Gemini 2.5 Flash | Zero-Shot Prompt | 0.8735 |
| Gemini 2.5 Flash | Few-Shot Prompt | 0.901 |

Few-shot prompting achieved the highest performance on the evaluation dataset.

---

## Latency Comparison

Approximate inference latency per prediction:

| Model | Latency |
|------|------|
| Logistic Regression | ~50 ms |
| Gemini Zero-Shot | ~1.5–2 seconds |
| Gemini Few-Shot | ~2–2.5 seconds |

Classical models provide significantly faster inference, while LLM-based methods trade speed for improved semantic understanding.

---

## Cost Analysis

Approximate cloud cost for the experiments:

| Component | Estimated Cost |
|------|------|
| BigQuery ML Training | ~$0–1 |
| Gemini Zero-Shot (2000 predictions) | ~$2–3 |
| Gemini Few-Shot (2000 predictions) | ~$3–4 |

Total estimated cost:

~$5

---

## Observations

The experiments highlight the trade-off between traditional machine learning and generative AI approaches.

Classical models offer low latency and minimal cost, while LLM-based methods provide higher accuracy for semantic classification tasks.

Prompt engineering also plays a significant role in improving LLM performance.
