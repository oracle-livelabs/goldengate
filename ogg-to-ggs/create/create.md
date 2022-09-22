# Create the Oracle Cloud Infrastructure GoldenGate resources

## Introduction

This lab walks you through the steps to create an Oracle Cloud Infrastructure (OCI) GoldenGate Deployment.

Estimated time: 20 minutes

Watch the video below for a walk through of the lab.
[](youtube:qW8ulWBx99s)

### About Oracle Cloud Infrastructure GoldenGate Resources

A Oracle Cloud Infrastructure GoldenGate deployment manages the resources it requires to function. The GoldenGate deployment also lets you access the GoldenGate deployment console, where you can access the OCI GoldenGate deployment console to create and manage processes such as Extracts and Replicats.

Database Registrations capture source and target credential information. A database registration also enables networking between the Oracle Cloud Infrastructure (OCI) GoldenGate service tenancy virtual cloud network (VCN) and your tenancy VCN using a private endpoint.

### Objectives

In this lab, you will:
* Locate Oracle Cloud Infrastructure GoldenGate in the Console
* Create a OCI GoldenGate deployment
* Register the source and target databases

### Prerequisites

This lab assumes that you completed all preceding labs.

## Task 1: Create a deployment

> **Note:** *Compartment names in the screenshots may differ from values that appear in your environment.*

1.  Open the **Navigation Menu**, navigate to **Oracle Database**, and select **GoldenGate**.

    ![GoldenGate in Oracle Cloud navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/database-goldengate.png " ")

2.  On the GoldenGate **Overview** page, click **Deployments**.

    ![GoldenGate Overview page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-02-ggs-overview.png " ")

3.  You may need to select a compartment. Under List Scope, from the Comparment dropdown, expand the root compartment, and then select the compartment associated with your username. For example, if your LiveLab username is LL1234-user, expand root, expand LiveLabs, and then select the compartment **LL1234-COMPARTMENT**.

    > **Tip:** *You can find your User name in the Workshop Details section.*

4.  On the Deployments page, click **Create Deployment**.

    ![Deployments page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-02-01.png "")

5.  In the Create Deployment panel, enter **GGSDeployment** for Name.

6.  From the Compartment dropdown, select a compartment.

7.  For OCPU Count, enter **1**.

8.  For Subnet, select a subnet. If you're using the workshop environment, select **&lt;user&gt;pubsubnt**.

9.  For License type, select **Bring You Own License (BYOL)**.

10. Click **Show Advanced Options**, and then select **Create Public Endpoint**.

    ![Completed Create GoldenGate Deployment fields](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-09.png " ")

11. Click **Next**.

12. For GoldenGate Instance Name, enter **ggsinstance**.

13. For Administrator Username, enter **oggadmin**.

14. For Administrator Password, enter a password. Take note of this password, or use the same password for the source or target database users from the Workshop Details section.

15. Click **Create**.

    ![Completed GoldenGate details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-13.png " ")

You're brought to the Deployment Details page. It takes a few minutes for the deployment to be created. Its status will change from CREATING to ACTIVE when it is ready for you to use. While you're waiting, proceed to the next Tasks.

## Task 2: Register the source and target databases

While the deployment is being created, you can register the source and target Autonomous Database instances.

1.  Use the Oracle Cloud Console breadcrumb to navigate back to the GoldenGate page.

    ![GoldenGate highlighted in Oracle Cloud Console breadcrumb](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-01-breadcrumb.png " ")

2.  Click **Registered Databases**.

    ![Registered Databases in GoldenGate menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-02-ggs-registerdb.png " ")

3.  Click **Register database**.

    ![Registered Databases page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-03-ggs-registerdb.png " ")

4.  In the Register Database panel, for Name and Alias, enter **SourceATP**.

5.  From the Compartment dropdown, select a compartment.

6.  Click **Select Database**.

7.  From the Database Type dropdown, select **Autonomous Database**.

8.  For **Autonomous Database in &lt;compartment-name&gt;**, click **Change Compartment**, select the compartment you created your ATP instance, and then select **SourceATP** from the dropdown. Some fields are autopopulated based on your selection.

9.  For Database user password, enter a password for the `ggadmin` user, and then click **Register**. Take note of this password.

  >**NOTE:** *If you're completing this lab in a Sandbox Tenancy, then click **View Login Info** in your LiveLab instructions and copy database Admin password under Terraform Values and paste it into the Database user password field.*

  ![Source Database details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-01-12-regsourcedb.png)

    The database registration becomes Active after a few minutes.

10. Repeat steps 2 to 9 to register the TargetADW Autonomous Database.

  ![Target Database details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-10-ggs-regdb-target.png)

## Task 3: Unlock the GGADMIN user and add supplemental logging

Although the GGADMIN user is created during the database registration process, it is locked by default. The following steps guide you through how to unlock the GGADMIN user.

1.  From the Oracle Cloud console navigation menu, click to **Oracle Database**, and then click **Autonomous Transaction Processing**.

    ![Oracle Cloud Console navigation menu with Oracle Database and Autonomous Transaction Processing highlighted](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/database-atp.png " ")

2.  From the list of databases, select **SourceATP**.

    ![List of Autonomous Transaction Processing instances with SourceATP highlighted](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-02-sourceatp.png " ")

3.  On the SourceATP Database Details page, click **Database Actions**.

    ![SourceATP database details page with Database Actions highlighted](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-03-db-tools.png " ")

4.  Sign in to Database Actions using the ADMIN user details from Lab 1: Set Up the Environment. If you're running this lab on a Sandbox tenancy, copy the ADMIN password provided with your Login Info.

5.  Under **Administration**, click **Database Users**.

6.  From the list of users, locate **GGADMIN**, and then click the ellipsis (three dots) icon and select **Edit**.

    ![Tiles of database users with Edit option in GGADMIN menu icon highlighted](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-06-locked.png " ")

7.  In the Edit User panel, deselect **Account is Locked**, enter the password you gave the GGADMIN user in Task 2 Step 9, and then click **Apply Changes**.

    ![Edit User panel with Password and Account is Locked options highlighted](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-07-edit.png " ")

    Note that the user icon changes from a blue padlock to a green checkmark.

8.  From the Database Actions menu, select **SQL**.

    ![Database Actions menu with SQL tool highlighted](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-08-sql.png " ")

9.  Enter the following into the worksheet, and then click **Run Script**.

    ```
    <copy>ALTER PLUGGABLE DATABASE ADD SUPPLEMENTAL LOG DATA;</copy>
    ```

10. Log out of Database Actions.

11. Repeat steps 1 to 7 to unlock the GGADMIN user for **TargetADW** with the password from Task 2 Step 10. Log out of Database Actions when you're done.

## Task 4: Review the deployment details

On the Deployment Details page, you can:

* Review the deployment's status
* Launch the GoldenGate service deployment console
* Edit the deployment's name or description
* Stop and start the deployment
* Move the deployment to a different compartment
* Review the deployment resource information
* Add tags

    ![Deployment details pages](images/01-03-gg-deployment-details.png " ")

## Task 5: Launch the GoldenGate Deployment Console

1. When the deployment is active, click **Launch Console**.

    ![Launch console button on deployment details page](images/04-01-ggs-launchconsole.png " ")

2. To log in to the GoldenGate deployment console, enter **oggadmin** for User Name and the password you provided in Task 1, steps 12 and 13, and then click **Sign In**.

    ![OCI GoldenGate deployment console sign in page](images/04-02-ggs-deploymentconsole-signin.png " ")

After you log in successfully, you're brought to the GoldenGate deployment console home page. Here, you can access the GoldenGate Administration, Performance Metrics, Distribution, and Receiver services, as well as add Extracts and Replicats for your data replication tasks.

In this lab, you created the OCI GoldenGate deployment and registered the source and target databases. **Proceed to the next lab**.

## Learn more

* [Managing Deployments](https://docs.oracle.com/en/cloud/paas/goldengate-service/using/deployments.html)

## Acknowledgements
* **Author** - Jenny Chan, Consulting User Assistance Developer, Database User Assistance
* **Contributors** -  Julien Testut, Database Product Management
* **Last Updated By/Date** - Jenny Chan, July 2022
