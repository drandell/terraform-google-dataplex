# terraform-google-dataplex

*UNOFFICIAL*

This module allows the creation of Google Cloud Platform Dataplex Lakes and Zones

## Compatibility 

This module is meant for use with Terraform 1.3.0.

## Usage

Basic usage of this module can be found in the [basic data plex example](examples/basic_dataplex_usage)

## Requirements

These sections describe requirements for using this module.

### Software

The following dependencies must be available:

- [Terraform](https://www.terraform.io/downloads.html) >= 1.3.0, < 2.0.0
- [Terraform Provider for GCP](https://registry.terraform.io/providers/hashicorp/google/latest) >= v4.32.0, < 5.0.0

### Service Account

A service account with the following roles must be used to provision
the resources of this module:

- Dataplex Admin: `roles/dataplex.admin`

### APIs

A project with the following APIs enabled must be used to host the
resources of this module:

- Dataplex API: `dataplex.googleapis.com`

## Install

### Terraform
Be sure you have the correct Terraform version (1.3.0 or greater but less than 2.0), you can choose the binary here:
- https://releases.hashicorp.com/terraform/

## File structure
The project has the following folders and files:

- /: root folder
- /examples: examples for using this module
- /main.tf: main file for this module, contains all the resources to create
- /variables.tf: all the variables for the module
- /output.tf: the outputs of the module
- /README.md: this file
