# Create the Oracle Cloud Infrastructure GoldenGate Deployment

## Introduction

This lab walks you through the steps to create Oracle Cloud Infrastructure (OCI) GoldenGate resources that you'll need to complete this workshop.

Estimated time: 10 minutes

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

## Task 1: Create a deployment

> **Note:** *Compartment names in the screenshots may differ from values that appear in your environment.*

1.  Open the **Navigation Menu**, navigate to **Oracle Database**, and select **GoldenGate**.

    ![GoldenGate in Oracle Cloud navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/database-goldengate.png " ")

2.  On the GoldenGate **Overview** page, click **Deployments**.

    ![GoldenGate Overview page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-02-ggs-overview.png " ")

3.  You may need to select a compartment. Under List Scope, from the Comparment dropdown, expand the root compartment, and then select the compartment associated with your username. For example, if your LiveLab username is LL1234-user, expand root, and then select the compartment **LL1234-COMPARTMENT**.

4.  On the Deployments page, click **Create Deployment**.

    ![Deployments page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-04-create-deployment.png "")

5.  In the Create Deployment panel, enter **GGSDeployment** for Name.

6.  From the Compartment dropdown, select a compartment.

7.  Select **Development or testing**. The OCPU count is autopopulated based on your selection.

8.  For Subnet, select a subnet. If you're using the workshop environment, select **&lt;USER&gt;-SUBNET-PRIVATE**.

    ![Completed Create GoldenGate Deployment fields](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-07-create-deployment-general-info.png " ")

9.  For License type, select **Bring Your Own License (BYOL)**.

10. Click **Show advanced options**, and then select **Enable GoldenGate console public access**.

11. For Load balancer subnet, select a subnet. If you're using the workshop environment, select **&lt;USER&gt;-SUBNET-PUBLIC**.

12. Click **Next**.

    ![Completed Create GoldenGate Deployment fields](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-10-create-deployment-general-info.png " ")

10. Click **Show advanced options**, and then select **Enable GoldenGate console public access**.

13. For Choose a deployment type, select **Data replication**.

14. For Select a technology dropdown, select **Oracle Database** from the dropdown.

15. For GoldenGate Instance Name, enter **ggsinstance**.

16. For Administrator Username, enter **oggadmin**.

17. For Password secret in &lt;USER&gt;-COMPARTMENT, click **Create password secret**.

    ![GoldenGate details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-16-create-deployment-gg-details.png " ")

18. In the Create secret panel, enter `LLsecret`.

19. For User password, enter a password 8 to 30 alphanumeric characters in length, containing at least 1 uppercase, 1 lowercase, 1 numeric, and 1 special character.

    > **NOTE**: The special characters must not be $, ^, or ?. 

    ![Create Password secret](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-19-passwordsecret.png " ")

20. Confirm the password, and then click **Create**.

21. Back in the Create deployment panel, for Password secret, ensure **LLsecret** is selected, and then click **Create**.

You're brought to the Deployment Details page. It takes a few minutes for the deployment to be created. Its status changes from CREATING to ACTIVE when it's ready for you to use. You can continue with Tasks 2, 3, and 4 while you wait for the deployment creation to complete.

## Task 2: Create the source connection

First, follow the steps below to connect the source Oracle Autonomous Transaction Processing \(ATP\) Database.

1.  Use the Oracle Cloud Console breadcrumb to navigate back to the Deployments page.

    ![GoldenGate highlighted in Oracle Cloud Console breadcrumb](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-01-deployment-details.png " ")

2.  Click **Connections**.

    ![Connections in GoldenGate menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-02-connections.png " ")

3.  Click **Create connection**.

    ![Connections page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-03-create-connection.png " ")

4.  The Create connection panel consists of two pages. On the General information page, for Name, enter **SourceATP** and optionally, a description.

5.  From the Compartment dropdown, select a compartment.

6.  From the a Type dropdown, select **Oracle Autonomous Database**.

7.  Click **Next**.

    ![Source Database details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-06-create-connection-general-info.png)

8. On the Connection details page, under Database details, select **Select database**.

9.  For **Database in &lt;compartment-name&gt;**, select **SourceATP-&lt;numbers&gt;** from the dropdown. 

10.  For Database username, enter `ggadmin`.

11.  Enter the database's password in the Password field. Take note of the password.

    > **NOTE:** This password will be used to unlock `GGADMIN` in Task 3.

12. For Traffic routing method, select **Shared endpoint**.

13. For Session mode, select **Direct**.

14. Click **Create**

    ![Source Database details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-13-create-connection-gg-details.png)

    The connection becomes Active after a few minutes.

## Task 3: Unlock the GGADMIN user and enable supplemental logging for the source database

Oracle Autonomous Databases come with a GGADMIN user that is locked by default. The following steps guide you through how to unlock the GGADMIN user.

1.  From the Oracle Cloud Console **Navigation Menu** (hamburger icon), click **Oracle Database**, and then select **Autonomous Transaction Processing**.

	![Autonomous Transaction Processing in the Oracle Cloud Console navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-01-auto-db.png " ")

2.  From the list of databases, select **SourceATP**.

    ![Autonomous Transaction Processing page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-02-sourceatp.png " ")

3.  On the SourceATP Database Details page, click **Database actions**, and select **Database Users** from the dropdown.

    ![SourceATP Database Details page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-03-db-actions.png " ")

    > **Note:** *If you're prompted to log in to Database Actions, use the SourceATP admin credentials located in the Workshop Details.*

4.  From the list of users, locate **GGADMIN**, and then click the ellipsis (three dots) icon and select **Edit**.

    ![Database users](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-05-ggadmin.png " ")

5.  In the Edit User panel, deselect **Account is Locked**, enter the password you gave the ggadmin user in the database registration steps above, and then click **Apply Changes**.

    ![Edit user](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-06-ggadmin-edit-user.png " ")

    Note that the user icon changes from a padlock to a checkmark.

6.  Open the navigation menu (hamburger icon), and then under **Development**, select **SQL**.

    ![Open navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-07-sql.png " ")

7.  Enter the following into the Worksheet, and then click **Run Statement**.

    ```
    <copy>ALTER PLUGGABLE DATABASE ADD SUPPLEMENTAL LOG DATA;</copy>
    ```

    ![Script Output](./images/03-08-sql-script-return.png " ")

8.  Replace the supplemental logging script with the following to check support mode, and then click **Run Statement**:

    ```
    <copy>
    select * from DBA_GOLDENGATE_SUPPORT_MODE where owner = 'SRC_OCIGGLL';
    </copy>
    ```

    The Script Output panel displays six tables whose Support_Mode is **FULL**.

    ![Script Output](./images/03-09-sql-script-return.png " ")

    You can leave the SQL window open and continue with the next Task.

## Task 4: Create the target connection and unlock the GGADMIN user

Now, follow the steps below to connect the target Autonomous Data Warehouse \(ADW\) instance.

1.  Use the Oracle Cloud Console navigation menu to navigate back to GoldenGate.

2.  Click **Connections** and then **Create Connection**.

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

    The source and target databases appear in the list of Connections. The connection becomes Active after a few minutes.

10.  Repeat Task 3, steps 1-7, to unlock the GGADMIN user and enable supplemental logging on the TargetADW database.

11.  Replace the supplemental logging script with the following to check support mode, and then click **Run Statement**:

    ```
    <copy>
    select * from DBA_GOLDENGATE_SUPPORT_MODE where owner = 'SRCMIRROR_OCIGGLL';
    </copy>
    ```

    The Script Output panel displays six tables whose Support_Mode is **FULL**.

    ![Script Output](./images/04-11-sql-script-return.png " ")


## Task 5: Review the deployment details

After the deployment is created and active, you can perform the following actions on the deployment details page:

* Review the deployment's status
* Launch the GoldenGate service deployment console
* Edit the deployment's name or description
* Stop and start the deployment
* Move the deployment to a different compartment
* Review the deployment resource information
* Add tags

    ![Deployment Details page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/05-01-deployment-details.png " ")

## Task 6: Assign connections to the deployment
1. Click **Assigned connections**.

    ![Assigned connections under Resources](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/06-01-assigned-connections.png " ")

2. Click **Assign connection**.

    ![Assigned connections under Resources](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/06-02-assign-connection.png " ")

3. In the Assign connection panel, from the Connection in &lt;compartment-number&gt;-COMPARTMENT dropdown, select **SourceATP**. Click **Assign connection**.

    ![Assigned connection to SourceATP](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/06-03-sourceatp-assign-connec.png " ")

4.  Repeat Task 6, steps 1-3, to assign connection on the TargetADW database.

    ![Assigned connections to SourceATP and TargetADW](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/06-04-targetadw-assign-connec.png " ") 

## Learn More

* [Managing deployments](https://docs.oracle.com/en/cloud/paas/goldengate-service/ebbpf/index.html#articletitle)
* [Managing connections](https://docs.oracle.com/en/cloud/paas/goldengate-service/mcjzr/index.html#articletitle)

## Acknowledgements
* **Author** - Jenny Chan, Consulting User Assistance Developer, Database User Assistance
* **Contributors** -  Julien Testut, Database Product Management; Katherine Wardhana, User Assistance Developer
* **Last Updated By/Date** - Katherine Wardhana, January 2024
