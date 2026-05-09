# Azure DevOps Terraform Security Pipeline

Enterprise-grade DevSecOps pipeline for Terraform Infrastructure-as-Code validation, security scanning, and vulnerability assessment using **Terraform · Checkov · Trivy · Azure DevOps**.

![Azure DevOps](https://img.shields.io/badge/Azure_DevOps-0078D7?style=flat-square&logo=azuredevops&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-623CE4?style=flat-square&logo=terraform&logoColor=white)
![IaC](https://img.shields.io/badge/Infrastructure-As_Code-0052CC?style=flat-square)
![Checkov](https://img.shields.io/badge/Checkov-IaC_Security-success?style=flat-square)
![Trivy](https://img.shields.io/badge/Trivy-Vulnerability_Scanning-blueviolet?style=flat-square)
![DevSecOps](https://img.shields.io/badge/DevSecOps-Enabled-critical?style=flat-square)

## Overview

This repository provides a **reusable Azure DevOps pipeline template** for deploying Terraform-based infrastructure on Azure, with **security and governance built in by design**.

It integrates **Terraform**, **Checkov**, and **Trivy** to enforce **policy-as-code** controls and perform **continuous security scanning** across the entire deployment lifecycle.

## Goals

- Infrastructure-as-Code automation
- Continuous security validation
- Vulnerability scanning
- Policy-as-Code enforcement
- Enterprise-ready CI/CD pipeline design
- Cloud governance alignment
  
## Key Features

**Security-first approach**\
Built-in security and compliance checks are seamlessly integrated into the CI/CD workflow, enabling **DevSecOps** practices and reinforcing **shift-left** security.

**Plan-based validation**\
The Terraform execution plan (*tfplan*) is analyzed to validate actual infrastructure changes, instead of relying solely on static analysis of the source code.

**Multi environment configuration**\
A single, reusable template ensures deployment consistency and reduces configuration drift across dev, test, and prod environments.

**Automated quality gates**\
Integrated *stop-and-fix* mechanisms automatically halt the pipeline if security or compliance standards aren't met, preventing risky deployments.

## Configuration and Usage

### Terraform Backend (`provider.tf`)

Configure the Terraform backend by defining the Azure Storage Account reference used to manage the Terraform state:

``` hcl
backend "azurerm" {
  resource_group_name  = "<your_resource_group_name_for_tfstate>"
  storage_account_name = "<your_storage_account_name_for_tfstate>"
  container_name       = "<your_container_name_for_tfstate>"
}
```

###  Azure DevOps Environments 
    
In Azure DevOps, create an *Azure DevOps Environment* for each target environment (dev, test, and prod). Optionally, configure the appropriate *Approvals and Checks* for each environment.

### Azure DevOps Service Connection

In Azure DevOps, create an *Azure Resource Manager service connection* using *Workload Identity Federation*. Then grant the generated service principal the *Storage Blob Data Contributor* role on the Azure Storage account used for Terraform state management.

Update each environment-specific pipeline YAML file (`dev-pipeline.yml`, `test-pipeline.yml`, and `prod-pipeline.yml`) to reference the created Azure service connection:

``` yaml
azureServiceConnection: "<your_service_connection_name>"
```

### Azure Pipeline 

In Azure DevOps, create an *Azure DevOps Pipeline* for each target environment using the provided `dev-pipeline.yml`, `test-pipeline.yml`, and `prod-pipeline.yml` files.

## Checkov & Trivy Customization

Checkov and Trivy can be customized to tailor security and governance controls by using:

- Custom policies
- Rule exclusions

This flexibility enables alignment with organizational security standards and compliance requirements.

For implementation details, refer to the official Checkov and Trivy documentation. Below are some useful links:

* [Checkov - Suppressing and Skipping Policies](https://www.checkov.io/2.Basics/Suppressing%20and%20Skipping%20Policies.html)
* [Checkov - Custom Policies Overview](https://www.checkov.io/3.Custom%20Policies/Custom%20Policies%20Overview.html)
* [Trivy - Custom Checks](https://trivy.dev/docs/latest/scanner/misconfiguration/custom/)
* [Trivy - Filtering with .trivyignore](https://trivy.dev/docs/latest/configuration/filtering/#trivyignore)

## Performance Optimization

Pipeline performance can be improved by using an *Azure Container Apps job* runner  with pre-installed tooling:
-   Terraform 
-   Checkov 
-   Trivy

Benefits:
- Faster pipeline startup times 
- No runtime tool installation 
- Consistent and reproducible execution environment 
- Improved reliability

## Screenshots

**Pipeline Execution**

![Pipeline execution result](doc/imgs/pipeline-execution.png)

**Pipeline Execution Summary**

![Pipeline security report](doc/imgs/pipeline-summary.png)

**Pipeline Security Report**

![Pipeline security report](doc/imgs/pipeline-security-report.png)
