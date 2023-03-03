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
* Create a OCI GoldenGate deployment
* Create the source and target connections
* Assign connections to deployments

### Prerequisites

This lab assumes that you completed all preceding labs.

## Task 1: Create a deployment

> **Note:** Compartment names in the screenshots may differ from values that appear in your environment.


1.  In the Oracle Cloud console, open the navigation menu, navigate to **Oracle Database**, and select **GoldenGate**.

    ![GoldenGate in Oracle Cloud navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/database-goldengate.png " ")

2.  On the GoldenGate **Overview** page, click **Deployments**.

    ![GoldenGate Overview page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-02-ggs-overview.png " ")

3.  On the Deployments page, click **Create Deployment**.

    ![Deployments page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-04-create-deployment.png " ")

4.  In the Create Deployment panel, enter **GGSDeployment** for Name.

5.  From the Compartment dropdown, select a compartment.

6.  For OCPU Count, enter **1**.

7.  For Subnet, select a subnet. If you're using the workshop environment, select **&lt;user&gt;pubsubnt**.

8.  For License type, select **Bring Your Own License (BYOL)**.

9.  Click **Show advanced options**, and then select **Create public endpoint**.

    ![Completed Create GoldenGate Deployment fields](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-10-create-deployment-general-info.png " ")

10. Click **Next**.

11. For Select a technology dropdown, select **Oracle Database**.

12. For GoldenGate Instance Name, enter **ggsinstance**.

13. For Administrator Username, enter **oggadmin**.

14. For Administrator Password, enter a password. Take note of this password.

15. Click **Create**.

You're brought to the Deployment Details page. It takes a few minutes for the deployment to be created. Its status will change from CREATING to ACTIVE when it is ready for you to use.

## Task 2: Create the source and target connections

1.  Use the Oracle Cloud Console breadcrumb to navigate back to the GoldenGate page.

    ![GoldenGate in Oracle Cloud Console breadcrumb highlighted](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-01-breadcrumb.png " ")

2.  Click **Connections**.

    ![Connections in GoldenGate menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-02-connections.png " ")

3.  Click **Create Connections**.

    ![Connections page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-03-create-connection.png " ")

4.  In the Create connection panel, for Name, enter **SourceATP** and optionally, a description.

5.  From the Type dropdown, select **Oracle Autonomous Database**.

6.  Click **Next**.

    ![Source Database details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-06-create-connection-general-info.png)

7. On the Connection details page, under Database details, select **Select database**.

8.  For **Database in &lt;compartment-name&gt;**, select **SourceATP &lt;numbers&gt;** from the dropdown. 

9.  Enter the database's password in the Password field, and then click **Create**.

    ![Source Database details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-10-create-connection-gg-details.png)

    The connection becomes Active after a few minutes.

10. Repeat steps 2 to 9 to create the TargetADW connection.

## Task 3: Unlock the GGADMIN user and add supplemental logging

Oracle Autonomous Databases come with a GGADMIN user that is locked by default. The following steps guide you through how to unlock the GGADMIN user.

1.  From the Oracle Cloud console navigation menu, click **Oracle Database**, and then select **Autonomous Transaction Processing**.

	![Autonomous Transaction Processing in Oracle Cloud Console navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/database-atp.png " ")

2.  From the list of databases, select **SourceATP**.

    ![Autonomous Databases page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-02-auto-db.png " ")

3.  On the SourceATP database details page, click **Database actions**.

    ![SourceATP Database Details page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-03-db-actions.png " ")

4.  Under **Administration**, click **Database Users**.

    ![Database Actions](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-04-db-users.png " ")

5.  From the list of users, locate **GGADMIN**, and then click the ellipsis (three dots) icon and select **Edit**.

    ![Database users](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-05-ggadmin.png)

6.  In the Edit User panel, deselect **Account is Locked**, enter the password you gave the ggadmin user in the connection steps above, and then click **Apply changes**.

    ![Edit user](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-06-ggadmin-edit-user.png)

    Note that the user icon changes from a padlock to a checkmark.

7.  Open the navigation menu (hamburger icon), and then under **Development**, select **SQL**.

    ![Open navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-07-sql.png)

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


11. Repeat steps 1 to 7 to unlock the GGADMIN user for **Autonomous Data Warehouse** with the password from Task 2 Step 10. Log out of Database Actions when you're done.

## Task 4: Review the deployment details

Return to the OCI GoldenGate Deployments page and select your GGSDeployment to view its details. On the deployment details page, you can:

* Review the deployment's status
* Launch the GoldenGate service deployment console
* Edit the deployment's name or description
* Stop and start the deployment
* Move the deployment to a different compartment
* Review the deployment resource information
* Add tags

    ![Deployment Details page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/05-01-deployment-details.png " ")


## Task 5: Assign connections to the deployment

1. Click **Assigned connections**.

    ![Assigned connections under Resources](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/06-01-assigned-connections.png " ")

2. Click **Assign connection**.

    ![Assigned connections under Resources](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/06-02-assign-connection.png " ")

3. In the Assign connection panel, from the Connection in &lt;compartment-number&gt;-COMPARTMENT dropdown, select **SourceATP**. Click **Assign connection**.

    ![Assigned connection to SourceATP](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/06-03-sourceatp-assign-connec.png " ")

4.  Repeat Task 6, steps 1-3, to assign the TargetADW connection to the deployment.

    ![Assigned connections to SourceATP and TargetADW](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/06-04-targetadw-assign-connec.png " ") 

In this lab, you created an OCI GoldenGate deployment, and created connections to the source and target databases.


## Task 6: Launch the GoldenGate Deployment Console

1. After the two connections are assigned, click **Launch Console**.

    ![Launch console](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/02-01-launchconsole.png " ")

2. To log in to the GoldenGate deployment console, enter **oggadmin** for User name and the password you provided in the previous Lab, and then click **Sign In**.

    ![GoldenGate Deployment Console](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/02-02-oggadmin.png " ")

After you log in successfully, you're brought to the GoldenGate deployment console home page. Here, you can access the GoldenGate Administration, Performance Metrics, Distribution, and Receiver services, as well as add Extracts and Replicats for your data replication tasks.

In this lab, you created the OCI GoldenGate deployment and registered the source and target databases. **Proceed to the next lab**.

## Learn more

* [Managing Deployments](https://docs.oracle.com/en/cloud/paas/goldengate-service/using/deployments.html)

## Acknowledgements
* **Author** - Jenny Chan, Consulting User Assistance Developer, Database User Assistance
* **Contributors** -  Julien Testut, Database Product Management
* **Last Updated By/Date** - Jenny Chan, October 2022
