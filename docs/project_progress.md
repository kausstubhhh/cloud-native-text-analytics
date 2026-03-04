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

# Next Phase

Phase 4 will introduce Gemini integration via Vertex AI remote models.

Experiments will include:

- Zero-shot classification  
- Few-shot prompting  
- Latency measurement  
- Cost evaluation  
