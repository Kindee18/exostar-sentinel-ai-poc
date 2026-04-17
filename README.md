# 🛡️ Exostar Sentinel: AI-Driven Security Remediation

## Project Overview
Exostar Sentinel is a Proof of Concept (PoC) demonstrating a **Self-Healing Infrastructure** approach tailored for highly regulated environments (Aerospace & Defense). 

This tool uses a Python-based "AI logic agent" to scan Infrastructure-as-Code (Terraform) for security violations against compliance standards (like NIST 800-53 or FedRAMP) and automatically applies remediation before deployment.

## 💎 The Edge: Why This Matters
*   **AI-Assisted Coding:** Directly implements the "AI-assisted coding" skill requested in the Exostar job description.
*   **Compliance-First:** Specifically addresses the security needs of regulated industries.
*   **Shift-Left Security:** Detects and fixes vulnerabilities in the CI/CD pipeline, preventing insecure deployments.

## 🏗️ Technical Stack
*   **Infrastructure:** Terraform (Azure)
*   **Automation:** GitHub Actions
*   **Logic Engine:** Python (AI Remediation Agent)
*   **Management:** Makefile

## 🚀 How It Works
1.  **Detect:** The `remediate.py` script scans `terraform/main.tf` for insecure configurations (e.g., Public Network Access enabled).
2.  **Reason:** The agent identifies the violation and determines the correct compliant state.
3.  **Repair:** The agent automatically modifies the Terraform code to disable public access.
4.  **Validate:** The CI/CD pipeline (GitHub Actions) verifies the new code is syntactically correct and compliant.

## 🛠️ Local Demo
You can simulate the AI remediation locally using the included Makefile:
```bash
# See the insecure state
cat terraform/main.tf

# Run the AI Audit & Repair
make audit

# Verify the fix
cat terraform/main.tf
```

---
**Built for the Exostar DevOps Team by Aegis Agent.**
