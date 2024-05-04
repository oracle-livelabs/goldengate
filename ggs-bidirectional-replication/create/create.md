# Create the Oracle Cloud Infrastructure GoldenGate Deployment

## Introduction

This lab walks you through the steps to create Oracle Cloud Infrastructure (OCI) GoldenGate resources that you'll need to complete this workshop.

Estimated time: 15 minutes

### About Oracle Cloud Infrastructure GoldenGate resources

A Oracle Cloud Infrastructure GoldenGate deployment manages the resources it requires to function. The GoldenGate deployment also lets you access the GoldenGate deployment console, where you can access the OCI GoldenGate deployment console to create and manage processes such as Extracts and Replicats.

Database Registrations capture source and target credential information. A database registration also enables networking between the Oracle Cloud Infrastructure (OCI) GoldenGate service tenancy virtual cloud network (VCN) and your tenancy VCN using a private endpoint.

### Objectives

In this lab, you will:
* Locate Oracle Cloud Infrastructure GoldenGate in the Console
* Create a OCI GoldenGate deployment
* Create database registrations for the source and target Autonomous Databases
* Review the OCI GoldenGate deployment details
* Access the OCI GoldenGate deployment console

### Prerequisites

This lab assumes that you completed all preceding labs.

## Task 1: Review the deployment's details

> **Note:** Compartment names in the screenshots may differ from values that appear in your environment.

1.  If you're not already in the GoldenGate Service, open the **Navigation Menu**, navigate to **Oracle Database**, and select **GoldenGate**.

    ![GoldenGate in Oracle Cloud navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/database-goldengate.png " ")

2.  On the GoldenGate **Overview** page, click **Deployments**.

    ![GoldenGate Overview page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-02-ggs-overview.png " ")

3.  You may need to select a compartment. Under List Scope, from the Comparment dropdown, expand the root compartment, and then select the compartment associated with your username. For example, if your LiveLab username is LL1234-user, expand root, and then select the compartment **LL1234-COMPARTMENT**.

4.  On the Deployments page, select the deployment.

After the deployment is created and active, you can perform the following actions on the deployment details page:

* Review the deployment's status
* Launch the GoldenGate service deployment console
* Edit the deployment's name or description
* Stop and start the deployment
* Move the deployment to a different compartment
* Review the deployment resource information
* Add tags

    ![Deployment Details page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/05-01-deployment-details.png " ")


## Task 2: Create the source connection

Follow the steps below to connect the source Oracle Autonomous Transaction Processing \(ATP\) Database.

[](include:01-create-source-connection.md)

## Task 3: Unlock the GGADMIN user and check support mode for the source database

Oracle Autonomous Databases come with a GGADMIN user that is locked by default. The following steps guide you through how to unlock the GGADMIN user.

1.  From the Oracle Cloud Console **Navigation Menu** (hamburger icon), click **Oracle Database**, and then select **Autonomous Transaction Processing**.

	![Autonomous Transaction Processing in Oracle Cloud Console navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-01-auto-db.png " ")

2.  From the list of databases, select **SourceATP**.

    ![Autonomous Databases page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-02-sourceatp.png " ")

3.  On the SourceATP Database Details page, click **Database actions**, and select **Database Users** from the dropdown.

    ![Database Details page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-03-db-actions.png " ")

    > **Note:** If you're prompted to log in to Database Actions, use the source database admin credentials.

4.  From the list of users, locate **GGADMIN**, and then click the ellipsis (three dots) icon and select **Edit**.

    ![GGADMIN user context menu highlighted](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-05-ggadmin.png " ")

5.  In the Edit User panel, deselect **Account is Locked**, enter the password you gave the ggadmin user in the database registration steps above, and then click **Apply Changes**.

    ![Edit user](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-06-ggadmin-edit-user.png " ")

    Note that the user icon changes from a padlock to a checkmark.

6.  From the navigation menu (hamburger icon), click **SQL**.

    ![Open navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-07-sql.png " ")

7.  In the worksheet, enter the following, and then click **Run Statement**:

    ```
    <copy>
select * from DBA_GOLDENGATE_SUPPORT_MODE where owner = 'SRC_OCIGGLL';
    </copy>
    ```

    The Script Output panel displays eight tables whose Support_Mode is **FULL**.

    ![Script output](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-09-sql-script-return.png " ")

You can leave the source database SQL window open for use in a later lab.

## Task 4: Create the target connection

Now, follow the steps below to create the target Autonomous Data Warehouse \(ADW\) instance.

1.  Use the Oracle Cloud Console navigation menu to navigate back to GoldenGate.

2.  Click **Connections** and then **Create connection**.

    ![Create Connection in GoldenGate menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/04-02-connections.png " ")

3.  The Create connection panel consists of two pages. On the General information page, for Name, enter **TargetADW** and optionally, a description.

4.  From the **Compartment** dropdown, select a compartment.

5.  From the a Type dropdown, select **Oracle Autonomous Database**.

6.  Click **Next**.

    ![Source Database details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/04-06-create-connec-general-info.png " ")

7. On the Connection details page, under Database details, select **Select database**.

8. For **Database in &lt;compartment-name&gt;**, select **TargetADW-&lt;numbers&gt;** from the dropdown. 

9. For Database username, enter `ggadmin`.

10. Enter the database's password in the Password field.

11. For Traffic routing method, select **Shared endpoint**.

12. For Session mode, select **Direct**.

13. Click **Create**.

    ![Target Database details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/04-13-create-connec-details.png " ")

    The source and target databases appear in the list of Connections. The database registration becomes Active after a few minutes.

14.  Repeat Task 3, steps 1-7, to unlock the GGADMIN user, enable supplemental logging, and check support mode on the TargetADW database.

## Task 5: Assign connections to the deployment

[](include:05-assign-connection.md)

## Learn More

* [Create data replication resources](https://docs.oracle.com/en/cloud/paas/goldengate-service/llyhq/)
* [Connect to Oracle Autonomous Database](https://docs.oracle.com/en/cloud/paas/goldengate-service/tqrlh/)

## Acknowledgements
* **Author** - Jenny Chan, Consulting User Assistance Developer, Database User Assistance
* **Contributors** -  Denis Gray, Database Product Management; Katherine Wardhana, User Assistance Developer
* **Last Updated By/Date** - Katherine Wardhana, May 2024
