.PHONY: audit test clean help

help:
	@echo "Exostar Sentinel PoC: AI-Driven Security Remediation"
	@echo ""
	@echo "Usage:"
	@echo "  make audit    Run the AI-driven security audit and remediation"
	@echo "  make test     Test the Terraform code for validity after audit"
	@echo "  make clean    Reset the Terraform code to its initial insecure state"

audit:
	@echo "[START] Starting AI Security Audit..."
	@python3 scripts/remediate.py

test:
	@echo "[SETUP] Testing Terraform validity..."
	@cd terraform && terraform init -backend=false && terraform validate

clean:
	@echo "[CLEANUP] Resetting Terraform code to insecure state..."
	@sed -i 's/public_network_access_enabled = false/public_network_access_enabled = true/' terraform/main.tf
	@sed -i 's/allow_nested_items_to_be_public = false/allow_nested_items_to_be_public = true/' terraform/main.tf
	@echo "[SUCCESS] Reset complete."
