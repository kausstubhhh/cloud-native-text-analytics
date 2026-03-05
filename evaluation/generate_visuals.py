import matplotlib.pyplot as plt
import os

# Create visuals directory if it doesn't exist

output_dir = "../visuals"
os.makedirs(output_dir, exist_ok=True)

# Experiment results from BigQuery evaluation

models = [
    "Logistic Regression",
    "Gemini Zero-Shot",
    "Gemini Few-Shot"
]

accuracy = [0.789, 0.8735, 0.901]

latency = [0.05, 1.8, 2.3]  # seconds (approximate)

# Accuracy Comparison Chart

plt.figure()

plt.bar(models, accuracy)

plt.title("Model Accuracy Comparison")
plt.ylabel("Accuracy")
plt.xlabel("Model")

plt.ylim(0.7, 1.0)

plt.tight_layout()

plt.savefig(f"{output_dir}/accuracy_comparison.png")

plt.close()

# Latency vs Accuracy Trade-off

plt.figure()

plt.scatter(latency, accuracy)

for i, label in enumerate(models):
    plt.annotate(label, (latency[i], accuracy[i]))

plt.title("Latency vs Accuracy Trade-off")

plt.xlabel("Latency (seconds)")
plt.ylabel("Accuracy")

plt.tight_layout()

plt.savefig(f"{output_dir}/latency_vs_accuracy.png")

plt.close()

print("Visuals generated successfully.")
