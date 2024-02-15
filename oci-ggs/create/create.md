# Create the Oracle Cloud Infrastructure GoldenGate resources

## Introduction

In this lab, you learn to create an Oracle Cloud Infrastructure (OCI) GoldenGate deployment.

Estimated time: 20 minutes

### About Oracle Cloud Infrastructure GoldenGate Deployments and Connections

A Oracle Cloud Infrastructure GoldenGate deployment manages the resources it requires to function. The GoldenGate deployment also lets you access the GoldenGate deployment console, where you can access the OCI GoldenGate deployment console to create and manage processes such as Extracts and Replicats.

Connections capture source and target credential information. A connection also enables networking between the Oracle Cloud Infrastructure (OCI) GoldenGate service tenancy virtual cloud network (VCN) and your tenancy VCN using a private endpoint.

### Objectives

In this lab, you will:
* Locate Oracle Cloud Infrastructure GoldenGate in the Console
* Create a OCI GoldenGate deployment
* Create the source and target connections

### Prerequisites

To successfully complete this lab in your own tenancy, you must have access to OCI Vault and have a Vault created. [Learn more.](https://docs.oracle.com/en-us/iaas/Content/KeyManagement/Tasks/managingvaults_topic-To_create_a_new_vault.htm#createnewvault)

## Task 1: Create a deployment

[](include:01-create-deployment.md)

## Task 2: Create a connection to the source database

[](include:02-create-source-connection.md)

## Task 3: Unlock the GGADMIN user and check support mode for the source database

[](include:03-unlock-source-ggadmin.md)

## Task 4: Create a connection to the target database and unlock the GGADMIN user

[](include:04-create-target-connection.md)

## Task 5: Review the deployment details

Return to OCI GoldenGate in the Oracle Cloud console. After the deployment is created and active, you can perform the following actions on the deployment details page:

[](include:05-deployment-details.md)

## Task 6: Assign connections to the deployment

[](include:06-assign-connection.md)

You may now **proceed to the next lab.**

## Learn more

* [Managing deployments](https://docs.oracle.com/en/cloud/paas/goldengate-service/ebbpf/index.html)
* [Managing connections](https://docs.oracle.com/en/cloud/paas/goldengate-service/mcjzr/index.html)

## Acknowledgements
* **Author** - Jenny Chan, Consulting User Assistance Developer, Database User Assistance
* **Contributors** -  Denis Gray, Database Product Management; Katherine Wardhana, User Assistance Developer
* **Last Updated By/Date** - Katherine Wardhana, February 2024
