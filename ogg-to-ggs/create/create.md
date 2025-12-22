# Create the Oracle Cloud Infrastructure GoldenGate resources

## Introduction

In this lab, you learn to create Oracle Cloud Infrastructure (OCI) GoldenGate resources necessary to complete this workshop.

Estimated time: 20 minutes

Watch the video below for a walk through of the lab.
[](youtube:qW8ulWBx99s)

### About Oracle Cloud Infrastructure GoldenGate Resources

A Oracle Cloud Infrastructure GoldenGate deployment manages the resources it requires to function. The GoldenGate deployment also lets you access the GoldenGate deployment console, where you can access the OCI GoldenGate deployment console to create and manage processes such as Extracts and Replicats.

Connections capture source and target credential information. A connection also enables networking between the Oracle Cloud Infrastructure (OCI) GoldenGate service tenancy virtual cloud network (VCN) and your tenancy VCN using a private endpoint.

### Objectives

In this lab, you will:
* Locate Oracle Cloud Infrastructure GoldenGate in the Console
* Review the OCI GoldenGate deployment
* Create the source and target connections
* Assign connections to deployments

### Prerequisites

This lab assumes that you completed the preceding lab.

## Task 1: Review the deployment details

[](include:01-review-deployment.md)

## Task 2: Create the source and target connections

[](include:01-create-source-connection.md)

12. Repeat the steps above to create the TargetALK connection to the TargetALK database.

## Task 3: Unlock the GGADMIN user and add supplemental logging

[](include:02-unlock-source-ggadmin.md)

10. Repeat steps 1 to 6 to unlock the GGADMIN user for **Autonomous AI Lakehouse**. Log out of Database Actions when you're done.

## Task 4: Assign connections to the deployment

[](include:05-assign-connection.md)

## Task 5: Launch the GoldenGate deployment console

[](include:01-launch-console.md)

In this lab, you created the OCI GoldenGate deployment and registered the source and target databases. **Proceed to the next lab**.

## Learn more

* [Create an Oracle Autonomous AI Database connection](https://docs.oracle.com/en/cloud/paas/goldengate-service/tqrlh/index.html)
* [Assign connections to a deployment](https://docs.oracle.com/en/cloud/paas/goldengate-service/llyhq/#GUID-69F7C944-DD31-40FA-8589-4CB5113E74D0)

## Acknowledgements
* **Author** - Jenny Chan, Manager, Data Integration & Essbase User Assistance
* **Contributors** -  Julien Testut, Database Product Management; Katherine Wardhana, User Assistance Developer
* **Last Updated By/Date** - Jenny Chan, December 2025
