# System Architecture

This project implements a cloud-native text analytics system using Google Cloud.

## Architecture Overview

AG News Dataset  
→ BigQuery Data Pipeline  
→ Data Cleaning & Processing  
→ BigQuery ML Baseline Model  
→ Vertex AI Remote Model  
→ Gemini 2.5 Flash  
→ Prompt Engineering Experiments  
→ Evaluation & Comparison

## Components

### BigQuery
Used for:
- dataset storage
- SQL-based data processing
- ML model training via BigQuery ML

### Vertex AI

Provides access to generative AI models.

A remote model connection allows BigQuery to send prompts directly to Gemini.

### Gemini

Gemini 2.5 Flash is used to perform text classification using:

- zero-shot prompting
- few-shot prompting

## System Design Goals

The system was designed with:

- scalability
- cost awareness
- modular experimentation

in mind.
