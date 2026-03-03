# Scalable Cloud-Native Text Analytics System

## Overview

This project implements a production-oriented, cloud-native text analytics system built on Google Cloud Platform (Google Cloud console).

The system integrates:

- BigQuery-based distributed data pipelines  
- Classical machine learning models using BigQuery ML (Logistic Regression, Random Forest)  
- Gemini integration via Vertex AI remote model in BigQuery  
- Prompt strategy comparison (zero-shot vs few-shot)  
- Cost and latency benchmarking  

The project extends foundational concepts explored through Google Cloud Skills Boost labs into a fully architected, experimentally evaluated analytical system.

The emphasis is on scalability, analytical rigor, and cost-aware cloud engineering.

---

## Objectives

The system is designed to:

- Compare classical ML and generative AI approaches for text classification  
- Evaluate performance under real cloud constraints  
- Measure cost per inference and overall experiment cost  
- Benchmark latency and scalability  
- Maintain production-style structure and reproducibility  

Cost, performance, and architectural clarity are treated as first-class evaluation dimensions.

---

## System Architecture

The architecture follows a structured cloud-native workflow:

1. Dataset ingestion into BigQuery  
2. SQL-based preprocessing and feature preparation  
3. Classical model training using BigQuery ML  
4. Gemini inference via Vertex AI remote model  
5. Structured evaluation and benchmarking  

The design prioritises scalability, reproducibility, and engineering discipline.

---

## Modelling Approach

### Classical Baselines
- Logistic Regression (BigQuery ML)
- Random Forest (BigQuery ML)

Evaluation Metrics:
- Accuracy  
- Precision / Recall / F1  
- Training time  
- Inference latency  
- Cost  

---

### Generative AI (Gemini via Vertex AI)

Prompt strategies evaluated:
- Zero-shot prompting  
- Few-shot prompting  

Evaluation Metrics:
- Classification accuracy  
- Token usage  
- Cost per 1,000 predictions  
- Response latency  
- Performance variance  

---

## Cost Management

The system is developed under a constrained Google Cloud credit budget of £222 or ($300)

Cost control strategies include:

- Use of BigQuery free-tier limits  
- Controlled dataset size  
- Batched inference queries  
- Budget alerts configured in GCP  
- Explicit cost tracking per experiment  

Cloud cost-awareness is incorporated directly into experimental evaluation.

---

## Repository Structure

```
cloud-native-text-analytics/
│
├── docs/               # Architecture and experiment documentation
├── sql/                # BigQuery SQL scripts and model definitions
├── evaluation/         # Analysis notebooks and metrics evaluation
├── results/            # Experimental outputs
└── README.md
```

The structure reflects reproducibility and software engineering discipline.

---

## Academic Context

Developed alongside an MSc in Advanced Computer Science (Data Analytics) at the University of Leeds.

The system bridges statistical learning, distributed cloud systems, and generative AI within a unified experimental framework.

---

## Future Work

- Multi-class classification benchmarking  
- Prompt robustness testing  
- Throughput stress testing  
- Infrastructure automation (Terraform)  
- Deployment as a lightweight inference API  

---
