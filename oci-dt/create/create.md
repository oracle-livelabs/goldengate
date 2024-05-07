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
* Create the source and target connections
* Review the deployment details
* Assign connections to the deployments 


## Task 1: Create the source connection

[](include:01-create-source-connection.md)

## Task 2: Unlock the GGADMIN user and enable supplemental logging for the source database

[](include:02-unlock-source-ggadmin.md)

## Task 3: Create the target connection and unlock the GGADMIN user

[](include:03-create-target-connection.md)

## Task 4: Review the deployment details

Return to OCI GoldenGate in the Oracle Cloud console. After the deployment is created and active, you can perform the following actions on the deployment details page:

[](include:04-deployment-details.md)

## Task 5: Assign connections to the deployment

[](include:05-assign-connection.md)

You may now **proceed to the next lab.**

## Learn more

* [Managing deployments](https://docs.oracle.com/en/cloud/paas/goldengate-service/ebbpf/index.html)
* [Managing connections](https://docs.oracle.com/en/cloud/paas/goldengate-service/mcjzr/index.html)

## Acknowledgements
* **Author** - Katherine Wardhana, User Assistance Developer
* **Contributors** -  Jenny Chan, Consulting User Assistance Developer, Database User Assistance; Julien Testut, Database Product Management
* **Last Updated By/Date** - Katherine Wardhana, March 2024
