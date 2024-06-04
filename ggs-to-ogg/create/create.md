# Create the Oracle Cloud Infrastructure GoldenGate resources

## Introduction

This lab walks you through the steps to create an Oracle Cloud Infrastructure (OCI) GoldenGate Deployment and create connections.

Estimated time: 20 minutes

### About Oracle Cloud Infrastructure GoldenGate Resources

A OCI GoldenGate **deployment** manages the resources it requires to function. The deployment also lets you access the GoldenGate deployment console, where you can create and manage GoldenGate processes such as Extracts, Replicats, and paths.

A **connection** captures source or target database credential information and syncs the information to OCI GoldenGate.

### Objectives

In this lab, you will:

* Review the OCI GoldenGate deployment
* Create the source and target connections
* Enable the GGADMIN user and supplemental logging
* Review the OCI GoldenGate deployment details
* Access the OCI GoldenGate deployment console

### Prerequisites

This lab assumes that you completed all preceding labs.

## Task 1: Select the compartment

[](include:00-select-compartment.md)

## Task 2: Review the deployment details

1. In the Oracle Cloud console, open the **navigation menu**, navigate to **Oracle Database**, and then select **GoldenGate**.

    ![GoldenGate in Oracle Cloud navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/database-goldengate.png " ")

2. You may need to select a compartment. Under List Scope, from the Compartment dropdown, expand the root compartment, and then select the compartment.

3. On the GoldenGate **Overview** page, click **Deployment** and then **OCI GoldenGate Deployment**.

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

## Task 3: Create the source connection

[](include:01-create-source-connection.md)

## Task 4: Unlock the GGADMIN user and enable supplemental logging for the source database

[](include:02-unlock-source-ggadmin.md)

## Task 5: Create the target connection and unlock the GGADMIN user

[](include:03-create-target-connection.md)

## Task 6 Assign connections to the deployment

1. On the deployment details page, in the Resources menu, click **Assigned connections**.

    ![Assigned connections under Resources](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/06-03-assigned-connections.png " ")

2. Under Assigned connections, click **Assign connection**.

    ![Assigned connections under Resources](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/06-02-assign-connection.png " ")

3. In the Assign connection panel, from the Connection in &lt;compartment-number&gt;-COMPARTMENT dropdown, select **SourceATP**, and then click **Assign connection**.

    ![Assigned connection to SourceATP](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/06-05-sourceatp-assign-connec.png " ")

4.  Repeat Task 6, steps 1-3, to assign the TargetADW connection to the deployment.

    ![Assigned connections to SourceATP and TargetADW](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/06-06b-assigned-connections-list.png " ") 

## Task 6: Launch the GoldenGate Deployment Console

1. On the deployment details page, click **Launch Console**.

    ![Launch Console](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/07-01-launchconsole.png " ") 

2. To log in to the GoldenGate deployment console, enter **oggadmin** for User Name and the password you provided in Task 1, Step 15, and then click **Sign In**.

    ![GoldenGate Deployment Console](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/07-02-ggs-deploymentconsole-signin.png " ")

After you log in successfully, you're brought to the GoldenGate deployment console home page. Here, you can access the GoldenGate Administration, Performance Metrics, Distribution, and Receiver Services, as well as add Extracts and Replicats for your data replication tasks.

In this lab, you created the OCI GoldenGate deployment and registered the source and target databases. You can now **proceed to the next lab**.

## Learn More

* [Create an Oracle Autonomous Database connection](https://docs.oracle.com/en/cloud/paas/goldengate-service/tqrlh/index.html)
* [Assign connections to a deployment](https://docs.oracle.com/en/cloud/paas/goldengate-service/qsqts/index.html)

## Acknowledgements
* **Author** - Jenny Chan, Consulting User Assistance Developer, Database User Assistance
* **Contributors** -  Julien Testut, Database Product Management; Katherine Wardhana, User Assistance Developer
* **Last Updated By/Date** - Katherine Wardhana, June 2024
