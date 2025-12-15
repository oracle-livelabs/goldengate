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

## Task 1: Select the compartment

[](include:00-select-compartment.md)

## Task 2: Review the deployment details

1. In the Oracle Cloud console, open the **navigation menu**, select to **Oracle AI Database**, and then select **GoldenGate**.

    ![GoldenGate in Oracle Cloud navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/database-goldengate.png " ")

2. You may need to select a compartment. From the **Compartment** dropdown, expand the root compartment, and then select the compartment.

3. On the GoldenGate **Overview** page, click **Deployments** and then **OCI GoldenGate Deployment**.

    ![GoldenGate highlighted in Oracle Cloud Console breadcrumb](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-02-ggs-overview-deployment.png " ")

You can perform the following actions on the deployment details page:

* Review the deployment's status
* Launch the GoldenGate service deployment console
* Edit the deployment's name or description
* Stop and start the deployment
* Move the deployment to a different compartment
* Review the deployment resource information
* Add tags

    ![Deployment Details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/05-01-deployment-details.png " ")

## Task 3: Create the source and target connections

[](include:01-create-source-connection.md)

12. Repeat the steps above to create the TargetALK connection to the TargetALK database.

## Task 4: Unlock the GGADMIN user and add supplemental logging

[](include:02-unlock-source-ggadmin.md)

10. Repeat steps 1 to 6 to unlock the GGADMIN user for **Autonomous AI Lakehouse**. Log out of Database Actions when you're done.

## Task 5: Assign connections to the deployment

[](include:05-assign-connection.md)

## Task 6: Launch the GoldenGate deployment console

[](include:01-launch-console.md)

In this lab, you created the OCI GoldenGate deployment and registered the source and target databases. **Proceed to the next lab**.

## Learn more

* [Create an Oracle Autonomous AI Database connection](https://docs.oracle.com/en/cloud/paas/goldengate-service/tqrlh/index.html)
* [Assign connections to a deployment](https://docs.oracle.com/en/cloud/paas/goldengate-service/llyhq/#GUID-69F7C944-DD31-40FA-8589-4CB5113E74D0)

## Acknowledgements
* **Author** - Jenny Chan, Manager, Data Integration & Essbase User Assistance
* **Contributors** -  Julien Testut, Database Product Management; Katherine Wardhana, User Assistance Developer
* **Last Updated By/Date** - Jenny Chan, December 2025
