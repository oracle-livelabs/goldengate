# Create the Oracle Cloud Infrastructure GoldenGate resources

## Introduction

In this lab, you learn to create an Oracle Cloud Infrastructure (OCI) GoldenGate deployment.

Estimated time: 20 minutes

Watch the video below for a quick walk through of the lab.
[Watch the video](videohub:1_hz7gsiin)

### About Oracle Cloud Infrastructure GoldenGate deployments and connections

A Oracle Cloud Infrastructure GoldenGate deployment manages the resources it requires to function. The GoldenGate deployment also lets you access the GoldenGate deployment console, where you can access the OCI GoldenGate deployment console to create and manage processes such as Extracts and Replicats.

Connections store the source and target credential information for OCI GoldenGate. A connection also enables networking between the Oracle Cloud Infrastructure (OCI) GoldenGate service tenancy virtual cloud network (VCN) and your tenancy VCN using a private endpoint.

### Objectives

In this lab, you will:
* Locate Oracle Cloud Infrastructure GoldenGate in the Console
* Create the source and target connections
* Review the deployment details
* Assign connections to the deployments 

## Task 1: Review the deployment

1. In the Oracle Cloud console, open the **navigation menu**, navigate to **Oracle AI Database**, and then select **GoldenGate**.

    ![GoldenGate in Oracle Cloud navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/database-goldengate.png " ")

2. On the GoldenGate **Overview** page, click **Deployments**.

    ![GoldenGate Overview - Deployments](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-02-ggs-overview.png " ")

3. On the Deployments page, select your compartment from the **Compartment** dropdown.

    > **NOTE**: If you're using the LiveLab Sandbox environment, you can find your compartment number in the Reservation Information panel (View Login Info) of the workshop instructions.

4. Select **OCI GoldenGate Deployment** in the Deployments list.

    ![Select OCI GoldenGate Deployment](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-04-ggs-deployments.png " ")

You can perform the following actions on the deployment details page:

* Review the deployment's status
* Launch the GoldenGate service deployment console
* Edit the deployment's name or description
* Stop and start the deployment
* Move the deployment to a different compartment
* Review the deployment resource information
* Add tags

    ![Deployment Details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/05-01-deployment-details.png " ")

## Task 2: Create the source connection

[](include:01-create-source-connection.md)

## Task 3: Unlock the GGADMIN user and enable supplemental logging for the source database

[](include:02-unlock-source-ggadmin.md)

## Task 4: Create the target connection and unlock the GGADMIN user

[](include:03-create-target-connection.md)

13. Repeat Task 3, steps 1-6, to unlock the GGADMIN user for the TargetALK database.

## Task 5: Assign connections to the deployment

[](include:05-assign-connection.md)

You may now **proceed to the next lab.**

## Learn more

* [Create a data replication deployment](https://docs.oracle.com/en/cloud/paas/goldengate-service/llyhq/#GUID-899C1348-58CA-43EE-B775-EAD3B365A7A9)
* [Connect to Oracle Autonomous Database](https://docs.oracle.com/en/cloud/paas/goldengate-service/tqrlh/)
* [Assign a connection to a deployment](https://docs.oracle.com/en/cloud/paas/goldengate-service/llyhq/#GUID-69F7C944-DD31-40FA-8589-4CB5113E74D0)

## Acknowledgements
* **Author** - Jenny Chan, Consulting User Assistance Developer, Database User Assistance
* **Contributors** -  Denis Gray, Database Product Management; Katherine Wardhana, User Assistance Developer
* **Last Updated By/Date** - Jenny Chan, November 2025