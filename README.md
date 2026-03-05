# Scalable Cloud-Native Text Analytics System

![Platform](https://img.shields.io/badge/Platform-Google%20Cloud-blue)
![ML](https://img.shields.io/badge/Machine%20Learning-BigQuery%20ML-green)
![LLM](https://img.shields.io/badge/LLM-Gemini%202.5%20Flash-purple)
![Dataset](https://img.shields.io/badge/Dataset-AG%20News-orange)
![Status](https://img.shields.io/badge/Project-Complete-brightgreen)
![GCP](https://img.shields.io/badge/Cloud-Google%20Cloud%20Platform-blue)

## Overview

This project implements a cloud-native text analytics system built on Google Cloud Platform.

The system integrates distributed data processing, classical machine learning, and generative AI to perform large-scale news topic classification using the AG News dataset.

Core components include:

- BigQuery-based distributed data pipelines  
- Classical machine learning using BigQuery ML (Logistic Regression, Random Forest)  
- Gemini integration via Vertex AI remote models in BigQuery  
- Prompt strategy comparison (zero-shot vs few-shot)  
- Cost, latency, and performance benchmarking  

The project extends concepts explored in Google Cloud Skills Boost labs into a fully structured and experimentally evaluated analytical system.

The focus is on scalability, reproducibility, and cost-aware cloud engineering.

---

## Objectives

The system was designed to:

- Compare classical ML models and LLM-based approaches for text classification  
- Evaluate performance under real cloud infrastructure constraints  
- Measure accuracy, latency, and cost per inference  
- Demonstrate scalable SQL-based ML pipelines  
- Maintain production-style project structure and reproducibility  

Accuracy, latency, and cost are treated as core evaluation dimensions.

---

## System Architecture

The system follows a structured cloud-native pipeline:

AG News Dataset → BigQuery Data Ingestion → SQL Data Cleaning & Feature Preparation → BigQuery ML Baseline Models → Vertex AI Remote Model Connection → Gemini LLM Classification → Evaluation & Benchmarking

This architecture enables experimentation with both statistical models and large language models within a unified cloud-native workflow.

---

## Modelling Approach

### Classical Machine Learning Baselines

Models trained using BigQuery ML:

- Logistic Regression  
- Random Forest  

Evaluation metrics:

- Accuracy  
- Precision / Recall / F1-score  
- Training time  
- Inference latency  
- Cloud cost  

Logistic Regression served as the primary baseline due to its strong performance on high-dimensional text features.

---

### Generative AI (Gemini via Vertex AI)

Large language model inference was integrated directly into BigQuery using Vertex AI remote models.

Two prompt strategies were evaluated:

- Zero-shot prompting  
- Few-shot prompting  

Evaluation metrics:

- Classification accuracy  
- Token usage  
- Cost per inference  
- Response latency  
- Performance variance across prompts  

---

## Experimental Results

| Model | Method | Accuracy |
|------|------|------|
| Logistic Regression | Classical ML | 0.789 |
| Gemini 2.5 Flash | Zero-Shot | 0.873 |
| Gemini 2.5 Flash | Few-Shot | **0.901** |

Few-shot prompting achieved the best overall performance, demonstrating how prompt engineering can significantly improve LLM classification accuracy.

---

## Cost Management

The system was developed under a Google Cloud credit

Cost control strategies included:

- Use of BigQuery free-tier limits where possible  
- Restricting dataset sampling for LLM inference  
- Batched inference queries  
- Budget alerts configured in GCP  
- Explicit cost monitoring via Google Cloud Billing reports  

The total experiment cost remained under a few pounds, demonstrating that LLM-enabled analytics pipelines can be built and evaluated with minimal cloud cost.

---

## Repository Structure

The repository structure emphasizes clarity, reproducibility, and engineering discipline.

---

## Academic Context

Developed alongside an MSc in Advanced Computer Science (Data Analytics) at the University of Leeds.

The project explores the intersection of statistical learning, distributed cloud data systems, and generative AI within a unified experimental framework.

---

## Future Work

Potential extensions include:

- Larger-scale benchmarking across additional datasets  
- Robustness testing of prompt strategies  
- Throughput and scalability stress testing  
- Infrastructure automation using Terraform  
- Deployment as a lightweight LLM-assisted inference API  

---
