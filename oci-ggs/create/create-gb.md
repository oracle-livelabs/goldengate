# Create the Oracle Cloud Infrastructure GoldenGate resources

## Introduction

In this lab, you learn to create an Oracle Cloud Infrastructure (OCI) GoldenGate deployment.

Estimated time: 20 minutes

### About Oracle Cloud Infrastructure GoldenGate deployments and connections

A Oracle Cloud Infrastructure GoldenGate deployment manages the resources it requires to function. The GoldenGate deployment also lets you access the GoldenGate deployment console, where you can access the OCI GoldenGate deployment console to create and manage processes such as Extracts and Replicats.

Connections store the source and target credential information for OCI GoldenGate. A connection also enables networking between the Oracle Cloud Infrastructure (OCI) GoldenGate service tenancy virtual cloud network (VCN) and your tenancy VCN using a private endpoint.

### Objectives

In this lab, you will:
* Locate Oracle Cloud Infrastructure GoldenGate in the Console
* Create a OCI GoldenGate deployment
* Create the source and target connections


## Task 1: Create a deployment

> **Note:** Compartment names in the screenshots may differ from values that appear in your environment.

1.  In the Oracle Cloud console, open the **navigation menu**, navigate to **Oracle Database**, and then select **GoldenGate**.

    ![GoldenGate in Oracle Cloud navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/database-goldengate.png " ")

2.  On the GoldenGate **Overview** page, click **Deployments**.

    ![GoldenGate Overview page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-02-ggs-overview.png " ")

3.  You may need to select a compartment. Under List Scope, from the Compartment dropdown, expand the root compartment, and then select the compartment associated with your username. For example, if your LiveLab username is LL1234-user, expand root, expand LiveLabs, and then select the compartment **LL1234-COMPARTMENT**.

    > **Tip:** You can find your User name in the Workshop Details section.

4.  On the Deployments page, click **Create deployment**.

    ![Deployments page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-04-create-deployment.png " ")

5.  In the Create Deployment panel, enter **GGSDeployment** for Name.

6.  From the Compartment dropdown, select a compartment.

7.  For OCPU Count, enter **1**.

8.  For Subnet, select a subnet. If you're using the workshop environment, select **&lt;user&gt;pubsubnt**.

9.  For License type, select **Bring Your Own License (BYOL)**.

10. Click **Show advanced options**, and then select **Create public endpoint**.

    ![Completed Create GoldenGate Deployment fields](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-10-create-deployment-general-info.png " ")

11. Click **Next**.

12. For Select a technology dropdown, select **Oracle Database**.

13. For GoldenGate Instance Name, enter **ggsinstance**.

14. For Administrator Username, enter **oggadmin**.

15. For Administrator Password, enter a password. Take note of this password.

16. Click **Create**.

    ![Completed GoldenGate details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-16-create-deployment-summary.png " ")

You're brought to the Deployment Details page. It takes a few minutes for the deployment to be created. Its status will change from CREATING to ACTIVE when it is ready for  you to use.

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

6.  From the a Type dropdown, select **OCI Autonomous Database**.

    ![Source Database details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-06-create-connection-general-info.png)

7.  Click **Next**.

8. On the Connection details page, under Database details, select **Select database**.

9.  For **Database in &lt;compartment-name&gt;**, select **SourceATP &lt;numbers&gt;** from the dropdown. 

10.  Enter the database's password in the Password field, and then click **Create**.

    ![Source Database details](./images/02-10-create-connection-gg-details.png)

    The connection becomes Active after a few minutes.

## Task 3: Unlock the GGADMIN user and enable supplemental logging for the source database

Oracle Autonomous Databases come with a GGADMIN user that is locked by default. The following steps guide you through how to unlock the GGADMIN user.

1.  From the Oracle Cloud Console navigation menu, click **Oracle Database**, and then select **Autonomous Transaction Processing**.

	![Autonomous Transaction Processing in the Oracle Cloud Console navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/database-atp.png " ")

2.  From the list of databases, select **SourceATP**.

    ![Autonomous Transaction Processing page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-02-sourceatp.png " ")

3.  On the SourceATP Database Details page, click **Database actions**.

    ![SourceATP Database Details page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-03-db-actions.png " ")

    > **Note:** If you're prompted to log in to Database Actions, use the SourceATP admin credentials located in the Workshop Details.

4.  Under **Administration**, click **Database Users**.

    ![Database Actions](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-04-db-users.png " ")

5.  From the list of users, locate **GGADMIN**, and then click the ellipsis (three dots) icon and select **Edit**.

    ![Database users](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-05-ggadmin.png " ")

6.  In the Edit User panel, deselect **Account is Locked**, enter the password you gave the ggadmin user in the database registration steps above, and then click **Apply Changes**.

    ![Edit user](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-06-ggadmin-edit-user.png " ")

    Note that the user icon changes from a padlock to a checkmark.

7.  Open the Database actions navigation menu, and then under **Development**, select **SQL**.

    ![Open navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-07-sql.png " ")

8.  Enter the following into the Worksheet, and then click **Run Statement**.

    ```
    <copy>ALTER PLUGGABLE DATABASE ADD SUPPLEMENTAL LOG DATA;</copy>
    ```

    ![Script Output](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-08-sql-script-return.png " ")

9.  Replace the supplemental logging script with the following to check support mode, and then click **Run Statement**:

    ```
    <copy>
    select * from DBA_GOLDENGATE_SUPPORT_MODE where owner = 'SRC_OCIGGLL';
    </copy>
    ```

    The Script Output panel displays six tables whose Support_Mode is **FULL**.

    ![Script Output](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-09-sql-script-return.png " ")

    You can leave the SQL window open and continue with the next Task.

## Task 4: Create the target connection and unlock the GGADMIN user

Now, follow the steps below to connect the target Autonomous Data Warehouse \(ADW\) instance.

1.  Use the Oracle Cloud Console navigation menu to navigate back to **GoldenGate**.

2.  Click **Connections** and then **Create Connection**.

    ![Create Connection in GoldenGate menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/04-02-connections.png " ")

3.  The Create connection panel consists of two pages. On the General information page, for Name, enter **TargetADW** and optionally, a description.

4.  From the **Compartment** dropdown, select a compartment.

5.  From the a Type dropdown, select **OCI Autonomous Database**.

    ![Source Database details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/04-05-create-connec-general-info.png " ")

6.  Click **Next**.

7. On the Connection details page, under Database details, select **Select database**.

8. For **Database in &lt;compartment-name&gt;**, select **TargetATP &lt;numbers&gt;** from the dropdown. 

9. Enter the database's password in the Password field, and then click **Create**.

    ![Target Database details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/04-09-create-connec-details.png " ")

    The source and target databases appear in the list of Connections. The connection becomes Active after a few minutes.

10.  Repeat Task 3, steps 1-8, to unlock the GGADMIN user and enable supplemental logging on the TargetADW database.

11.  Replace the supplemental logging script with the following to check support mode, and then click **Run Statement**:

    ```
    <copy>
    select * from DBA_GOLDENGATE_SUPPORT_MODE where owner = 'SRCMIRROR_OCIGGLL';
    </copy>
    ```

    The Script Output panel displays six tables whose Support_Mode is **FULL**.

    ![Script Output](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/04-11-sql-script-return.png " ")


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

3. In the Assign connection dialog, from the Connection in &lt;compartment-number&gt;-COMPARTMENT dropdown, select **SourceATP**. Click **Assign connection**.

    ![Assigned connection to SourceATP](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/06-03-sourceatp-assign-connec.png " ")

4.  Repeat Task 6, steps 1-3, to assign the TargetADW connection to the deployment.

    ![Assigned connections to SourceATP and TargetADW](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/06-04-targetadw-assign-connec.png " ") 

**Proceed to the next lab.**

## Learn more

* [Managing deployments](https://docs.oracle.com/en/cloud/paas/goldengate-service/ebbpf/index.html)
* [Managing connections](https://docs.oracle.com/en/cloud/paas/goldengate-service/mcjzr/index.html)

## Acknowledgements
* **Author** - Jenny Chan, Consulting User Assistance Developer, Database User Assistance
* **Contributors** -  Denis Gray, Database Product Management; Katherine Wardhana, User Assistance Developer
* **Last Updated By/Date** - Jenny Chan, February 2023

