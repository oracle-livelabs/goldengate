# Create a trusted connection between Oracle GoldenGate and OCI GoldenGate

## Introduction

In this lab, you learn to download the root certificate from Oracle Cloud Infrastructure (OCI) and add it to the Oracle GoldenGate Service Manager. Adding the Oracle Cloud Infrastructure root certificate to Oracle GoldenGate creates a trusted TLS connection between OCI GoldenGate and Oracle GoldenGate.

Estimated time: 10 minutes

Watch the video below for a walk through of the lab.
[](youtube:c73kK9JDuo8)

### Objectives

In this lab, you will:

* Download the root certificate for Oracle Cloud Infrastructure from your web browser to your local machine
* Add the certificate to Oracle GoldenGate's Administration Server
* Create a credential on Oracle GoldenGate to connect to OCI GoldenGate

### Prerequisites

To successfully complete this lab, you must have:

* An on-premises or Marketplace Oracle GoldenGate instance running
* The URL and log in credentials for the Oracle GoldenGate Service Manager
* The log in credentials for the OCI GoldenGate Deployment Console

## Task 1A: Using Chrome to download the root certificate

[](include:01a-chrome-root-certificate.md)

## Task 1B: Using FireFox to download the root certificate

[](include:01b-firefox-root-certificate.md)

## Task 2: Upload the certificate to the Oracle GoldenGate Marketplace Service Manager

[](include:02-upload-certificate.md)

## Task 3: Add a credential for Oracle GoldenGate to connect to OCI GoldenGate

[](include:03-add-credential.md)

In this lab, you created a trusted connection between Oracle GoldenGate and OCI GoldenGate using a self-signed certificate. **Proceed to the next lab**.

## Acknowledgements
* **Author** - Jenny Chan, Consulting User Assistance Developer, Database User Assistance
* **Contributors** -  Werner He and Julien Testut, Database Product Management
* **Last Updated By/Date** - Katherine Wardhana, December 2024
