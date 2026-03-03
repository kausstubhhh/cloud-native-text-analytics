# Scalable Cloud-Native Text Analytics System

## Overview

This project implements a production-oriented, cloud-native text analytics system built on Google Cloud Platform.

The system integrates:

- BigQuery-based distributed data pipelines  
- Classical machine learning models using BigQuery ML (Logistic Regression, Random Forest)  
- Gemini integration via Vertex AI remote model in BigQuery  
- Prompt strategy comparison (zero-shot vs few-shot)  
- Cost and latency benchmarking  

This project is developed independently alongside my MSc in Advanced Computer Science (Data Analytics) at the University of Leeds.

The foundational concepts were introduced through Google Cloud Skills Boost labs and extended into a fully designed, architected, and experimentally evaluated system.

This is **not** my MSc dissertation project.

---

## Objectives

The system is designed to:

- Compare classical ML and generative AI approaches for text classification  
- Evaluate performance under real cloud constraints  
- Measure cost per inference and overall experiment cost  
- Benchmark latency and scalability  
- Maintain production-style structure and reproducibility  

The focus is analytical rigor under practical cloud engineering limits.

---

## System Architecture

The architecture follows a structured cloud-native workflow:

1. Dataset ingestion into BigQuery  
2. SQL-based preprocessing and feature preparation  
3. Classical model training using BigQuery ML  
4. Gemini inference via Vertex AI remote model  
5. Structured evaluation and benchmarking  

The design prioritises scalability, clarity, and cost-awareness.

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
- Variance across runs

---

## Cost Discipline

This project operates under a constrained Google Cloud credit budget (£222).

Cost management strategies include:

- Use of BigQuery free-tier limits  
- Controlled dataset size  
- Batched inference queries  
- Budget alerts configured in GCP  
- Explicit cost tracking per experiment  

Cost is treated as a first-class evaluation metric, not an afterthought.

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

## Academic Alignment

This project aligns with MSc modules in:

- Machine Learning  
- Cloud Computing Systems  
- Data Mining & Text Analytics  
- Advanced Software Engineering  

It bridges statistical modelling and generative AI within a scalable cloud architecture.

---

## Future Work

- Multi-class classification benchmarking  
- Prompt robustness testing  
- Throughput stress testing  
- Infrastructure automation (Terraform)  
- Deployment as a lightweight API endpoint  

---

## Author

MSc Advanced Computer Science (Data Analytics)  
University of Leeds  
Independent Cloud-Native Systems Project
