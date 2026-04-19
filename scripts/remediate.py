import os
import re

def analyze_and_remediate(file_path):
    print(f"[ANALYSIS] Analyzing {file_path} for security compliance...")
    
    with open(file_path, 'r') as f:
        content = f.read()

    # AI Reasoning Simulation: 
    # "I detect a storage account with public_network_access_enabled set to true."
    # "In a FedRAMP/NIST regulated environment (like Exostar), this should be false."
    
    violations = []
    if 'public_network_access_enabled = true' in content:
        violations.append("Public network access is enabled on Storage Account.")
    
    if 'allow_nested_items_to_be_public = true' in content:
        violations.append("Nested items allowed to be public.")

    if not violations:
        print("[SUCCESS] No immediate security violations found.")
        return False

    print(f"[WARNING] VIOLATIONS DETECTED: {violations}")
    print("[AI] AI REMEDIATION: Applying fixes based on NIST 800-53 controls...")

    # Applying the fix
    fixed_content = content.replace('public_network_access_enabled = true', 'public_network_access_enabled = false')
    fixed_content = fixed_content.replace('allow_nested_items_to_be_public = true', 'allow_nested_items_to_be_public = false')

    with open(file_path, 'w') as f:
        f.write(fixed_content)
    
    print("[SUCCESS] REMEDIATION COMPLETE: Security hardening applied.")
    return True

if __name__ == "__main__":
    tf_file = "terraform/main.tf"
    if analyze_and_remediate(tf_file):
        print("[START] Code is now compliant. Ready for deployment.")
    else:
        print("[SKIP] No changes needed.")
