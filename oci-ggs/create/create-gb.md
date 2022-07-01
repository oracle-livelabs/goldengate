# Create the Oracle Cloud Infrastructure GoldenGate resources

## Introduction

This lab walks you through the steps to create an Oracle Cloud Infrastructure (OCI) GoldenGate deployment.

Estimated time: 10 minutes

### About Oracle Cloud Infrastructure GoldenGate Deployments and Database Registrations

A Oracle Cloud Infrastructure GoldenGate deployment manages the resources it requires to function. The GoldenGate deployment also lets you access the GoldenGate deployment console, where you can access the OCI GoldenGate deployment console to create and manage processes such as Extracts and Replicats.

Database Registrations capture source and target credential information. A database registration also enables networking between the Oracle Cloud Infrastructure (OCI) GoldenGate service tenancy virtual cloud network (VCN) and your tenancy VCN using a private endpoint.

### Objectives

In this lab, you will:
* Locate Oracle Cloud Infrastructure GoldenGate in the Console
* Create a OCI GoldenGate deployment
* Register the source and target databases


## Task 1: Create a deployment

> **Note:** *Compartment names in the screenshots may differ from values that appear in your environment.*

1.  Open the **Navigation Menu**, navigate to **Oracle Database**, and select **GoldenGate**.

    ![GoldenGate in Oracle Cloud navigation menu](images/database-goldengate.png " ")

2.  On the GoldenGate **Overview** page, click **Deployments**.

    ![GoldenGate Overview page](images/01-02-ggs-overview.png " ")

3.  You may need to select a compartment. Under List Scope, from the Comparment dropdown, expand the root compartment, and then select the compartment associated with your username. For example, if your LiveLab username is LL1234-user, expand root, expand LiveLabs, and then select the compartment **LL1234-COMPARTMENT**.

    > **Tip:** *You can find your User name in the Workshop Details section.*

4.  On the Deployments page, click **Create Deployment**.

    ![Deployments page](images/01-02-01.png "")

5.  In the Create Deployment panel, enter **GGSDeployment** for Name.

6.  From the Compartment dropdown, select a compartment.

7.  For OCPU Count, enter **1**.

8.  For Subnet, select a subnet. If you're using the workshop environment, select **&lt;user&gt;pubsubnt**.

9.  For License type, select **Bring You Own License (BYOL)**.

10. Click **Show Advanced Options**, and then select **Create Public Endpoint**.

    ![Completed Create GoldenGate Deployment fields](images/01-09.png " ")

11. Click **Next**.

12. For GoldenGate Instance Name, enter **ggsinstance**.

13. For Administrator Username, enter **oggadmin**.

14. For Administrator Password, enter a password. Take note of this password, or use the same password for the source or target database users from the Workshop Details section.

15. Click **Create**.

    ![Completed GoldenGate details](images/02-13.png " ")

You're brought to the Deployment Details page. It takes a few minutes for the deployment to be created. Its status will change from CREATING to ACTIVE when it is ready for you to use. While you're waiting, proceed to the next Tasks.

## Task 2: Register the source database

Follow the steps below to register the source Oracle Autonomous Transaction Processing \(ATP\) Database.

1.  Use the Oracle Cloud Console breadcrumb to navigate back to the GoldenGate page.

    ![GoldenGate highlighted in Oracle Cloud Console breadcrumb](images/01-01-breadcrumb.png " ")

2.  Click **Registered Databases**.

    ![Registered Databases in GoldenGate menu](images/01-02-ggs-registerdb.png " ")

3.  Click **Register database**.

    ![Registered Databases page](images/01-03-ggs-registerdb.png " ")

4.  In the Register Database panel, for Name and Alias, enter **SourceATP**.

5.  From the Compartment dropdown, select a compartment.

6.  Click **Select Database**.

7.  From the Database Type dropdown, select **Autonomous Database**.

8.  For **Autonomous Database in &lt;compartment-name&gt;**, click **Change Compartment**, select the compartment you created your ATP instance, and then select **SourceATP** from the dropdown. Some fields are autopopulated based on your selection.

9.  Enter the database admin's password from the Workshop Details in the Password field, and then click **Register**.

    ![Source Database details](images/01-01-12-regSourceDB.png)

    The database registration becomes Active after a few minutes.

## Task 3: Register the target database
Follow the steps below to register the target Autonomous Data Warehouse \(ADW\) instance.

1.  On the Registered databases page, click **Register Database**.

    ![Registered Databases in GoldenGate menu](images/03-02.png)

2.  In the Register Database panel, enter **TargetADW** for Name and Alias.

3.  From the **Compartment** dropdown, select a compartment.

4.  Click **Select Database**.

5.  For **Autonomous Database in &lt;compartment-name&gt;**, click **Change Compartment**, select the compartment you created your ADW instance, and then select **TargetADW** from the dropdown. Some fields are autopopulated based on your selection.

6.  Enter the database admin's password from the Workshop Details section in the Password field, and then click **Register**.

    ![Target Database details](images/02-10-ggs-regDB-target.png)

    The source and target databases appear in the list of Registered Databases. The database registration becomes Active after a few minutes.

## Task 4: Unlock the GGADMIN user and enable supplemental logging for the source database

Oracle Autonomous Databases come with a GGADMIN user that is locked by default. The following steps guide you through how to unlock the GGADMIN user.

1.  From the Oracle Cloud Console **Navigation Menu** (hamburger icon), click **Oracle Database**, and then select **Autonomous Transaction Processing**.

	![Autonomous Transaction Processing in the Oracle Cloud Console navigation menu](https://raw.githubusercontent.com/oracle/learning-library/master/common/images/console/database-atp.png " ")

2.  From the list of databases, select **SourceATP**.

    ![Autonomous Transaction Processing page](images/02-02-adb.png " ")

3.  On the SourceATP Database Details page, click **Database Actions**.

    ![SourceATP Database Details page](images/02-03-db-tools.png " ")

    > **Note:** *If you're prompted to log in to Database Actions, use the SourceATP admin credentials located in the Workshop Details.*

4.  Under **Administration**, click **Database Users**.

    ![Database Actions](images/database-actions.png " ")

5.  From the list of users, locate **GGADMIN**, and then click the ellipsis (three dots) icon and select **Edit**.

    ![Database users](images/02-06-locked.png)

6.  In the Edit User panel, deselect **Account is Locked**, enter the password you gave the ggadmin user in the database registration steps above (Task 2, Step 9), and then click **Apply Changes**. Note that the user icon changes from a padlock to a checkmark.

    ![Edit user](images/02-07-edit.png)

>**Note:** If you encounter errors when entering the password, please make sure your password contains only upper case letters, lower case letters, numbers, and underscores. If you are using the green button (run on LiveLabs tenancy), you can use your database admin password given to you on the reservation page. Just make sure this password matches the ggadmin user's password.

7.  Open the navigation menu (hamburger icon), and then under **Development**, select **SQL**.

    ![Open navigation menu](images/01-08-sql.png)

8.  Enter the following into the Worksheet, and then click **Run Statement**.

    ```
    <copy>ALTER PLUGGABLE DATABASE ADD SUPPLEMENTAL LOG DATA;</copy>
    ```

9.  Replace the supplemental logging script with the following to check support mode, and then click **Run Statement**:

    ```
    <copy>
    select * from DBA_GOLDENGATE_SUPPORT_MODE where owner = 'SRC_OCIGGLL';
    </copy>
    ```

    The Script Output panel displays six tables whose Support_Mode is **FULL**.

    ![Script Output](images/02-09b.png " ")

    You can leave the SQL window open and continue with the next Task.

## Task 5: Unlock the GGADMIN user for the target database

1.  Back in the Oracle Cloud console, click Autonomous Database in the breadcrumb.

2.  Select TargetADW from the list of Autonomous Databases to view its details.

2.  Repeat Task 4, steps 3 to 6, to unlock the GGADMIN user on the TargetADW database.

## Learn More

* [Managing Deployments](https://docs.oracle.com/en/cloud/paas/goldengate-service/using/deployments.html)
* [Managing Database Registrations](https://docs.oracle.com/en/cloud/paas/goldengate-service/using/database-registrations.html)

## Acknowledgements
* **Author** - Jenny Chan, Consulting User Assistance Developer, Database User Assistance
* **Contributors** -  Denis Gray, Database Product Management; Arabella Yao, Database Product Management
* **Last Updated By/Date** - Jenny Chan, June 2022
