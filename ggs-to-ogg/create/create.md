# Create the Oracle Cloud Infrastructure GoldenGate Resources

## Introduction

This lab walks you through the steps to create an Oracle Cloud Infrastructure (OCI) GoldenGate Deployment and register connections.

Estimated Time: 20 minutes

### About Oracle Cloud Infrastructure GoldenGate Resources

A OCI GoldenGate **deployment** manages the resources it requires to function. The deployment also lets you access the GoldenGate deployment console, where you can create and manage GoldenGate processes such as Extracts, Replicats, and paths.

A **database registration** captures source or target database credential information and syncs the information to OCI GoldenGate.

### Objectives

In this lab, you will:

* Create an OCI GoldenGate deployment
* Register the source and target databases
* Enable the GGADMIN user and supplemental logging
* Review the OCI GoldenGate deployment details
* Access the OCI GoldenGate deployment console

### Prerequisites

This lab assumes that you completed all preceding labs.

## Task 1: Create a Deployment

> **Note:** *The compartment names in the screenshots may differ from values that appear in your environment.*

1.  Open the **Navigation Menu**, navigate to **Oracle Database**, and select **GoldenGate**.

    ![GoldenGate in Oracle Cloud navigation menu](./images/01-01a.png " ")

    You're brought to the **Overview** page.

    ![GoldenGate Overview page](./images/01-01b.png " ")

2.  Click **Create Deployment**.

    ![Deployments page](./images/01-02-create-dep.png " ")

3.  In the Create Deployment panel, enter **GGSDeployment** for Name.

4.  From the Compartment dropdown, select your compartment.

5.  For OCPU Count, enter **1**.

6.  For Subnet, select the public subnet you created in Lab 1. You may need to click **Change Compartment** to locate your subnet.

7.  For License type, select **Bring You Own License (BYOL)**.

8.  Click **Show Advanced Options**, and then select **Create Public Endpoint**.

    ![Completed Create GoldenGate Deployment fields](./images/01-08-create-deployment-panel.png " ")

9. Click **Next**.

10. For GoldenGate Instance Name, enter **ogginstance**.

11. For Administrator Username, enter **oggadmin**.

12. For Administrator Password, enter a password. Take note of this password.

13. Click **Create**.

    ![Completed GoldenGate details](./images/01-13.png " ")
    
You're brought to the Deployment Details page. It takes a few minutes for the deployment to be created. Its status will change from CREATING to ACTIVE when it is ready for you to use.

## Task 2: Register the Source and Target Connections

Now, follow the steps below to register the source and target Autonomous Database instances.

*For the purposes of this workshop, registering the target Autonomous Database is purely used for its connection string to help you create the credential in the Oracle GoldenGate Marketplace instance.*

1.  In the Oracle Cloud Console breadcrumb, click **GoldenGate**, and then **Connections**.

    ![GoldenGate highlighted in Oracle Cloud Console breadcrumb](./images/02-01-breadcrumb.png " ")

2.  On the Registered Databases page, click **Create connection**.

    ![Connections in GoldenGate menu](./images/02-02-create-connection.png " ")

3.  The Create connection panel consists of two pages. On the General information page, for Name, enter **SourceATP** and optionally, a description.

4.  From the Compartment dropdown, select a compartment.

5.  From the a Type dropdown, select **OCI Autonomous Database**.

    ![Source Database details](./images/02-05.png " ")

6. Click **Next**.

7.  On the Connection details page, under Database details, select **Select database**.

8.  For **Database in &lt;compartment-name&gt;**, select **SourceATP &lt;numbers&gt;** from the dropdown. 

9. Enter the database's password in the Password field, and then click **Create**.

    ![Source Database details](./images/02-09.png " ")

    The connection becomes Active after a few minutes.

10.  Repeat these steps for the Target Autonomous Database. Name the connection **TargetADW**.

    The source and target databases appear in the list of Registered Databases. The database becomes Active after a few minutes.

    ![List of connections](./images/02-10.png " ")

## Task 3: Unlock the GGADMIN User and add supplemental logging

Although the GGADMIN user is created during the database registration process, it is disabled by default. The following steps guide you through how to enable the GGADMIN user.

1.  Open the **Navigation Menu** (hamburger icon), navigate to **Oracle Database**, and then click **Autonomous Database**.

    ![Autonomous Transaction Processing in the Oracle Cloud Console navigation menu](./images/03-01.png " ")

2.  From the list of databases, select **SourceATP**.

    ![Autonomous Transaction Processing page](./images/03-02.png " ")

3.  On the SourceATP Database Details page, click **Database Actions**.

    ![SourceATP Database Details page](./images/03-03.png " ")

4.  Sign in to Database Actions using the ADMIN user details you created in Lab 1: Set Up the Environment.

5.  Under **Administration**, click **Database Users**.

    ![Database Actions](./images/03-05.png " ")

6.  From the list of users, locate **GGADMIN**, and then click the ellipsis (three dots) icon and select **Edit**.

    ![Edit user](./images/03-06-locked.png " ")

7.  In the Edit User panel, deselect **Account is Locked**, enter the password you gave the ggadmin user in the database registration steps above, and then click **Apply Changes**.

    ![Edit user](./images/03-07a-edit.png " ")

    The user icon changes from a an orange padlock to a green checkmark.

    ![Edit user](./images/03-07b.png " ")

8.  Open the Database Actions navigation menu (hamburger icon), and then select **SQL**.

    ![Open navigation menu](./images/03-08-sql.png " ")

9.  Enter the following into the worksheet, and then click **Run Script**.

    ```
    <copy>ALTER PLUGGABLE DATABASE ADD SUPPLEMENTAL LOG DATA;</copy>
    ```
    ![Script Output](./images/03-09.png " ")

10. Log out of Database Actions.

11. Repeat steps 1 to 7 to enable the ggadmin user for **TargetADW**. Log out of Database Actions when you're done.

## Task 4: Review the Deployment Details

On the Deployment Details page, you can:

* Review the deployment's status
* Launch the GoldenGate service deployment console
* Edit the deployment's name or description
* Stop and start the deployment
* Move the deployment to a different compartment
* Review the deployment resource information
* Add tags

  ![Deployment details](./images/04-gg-deployment-details.png " ")

## Task 5: Assign connections to the deployment
1. Click **Assigned connections**.

    ![Assigned connections under Resources](./images/05-01.png " ")

2. Click **Assign connection**.

    ![Assigned connections under Resources](./images/05-02.png " ")

3. In the Assign connection panel, from the Connection in &lt;compartment-number&gt;-COMPARTMENT dropdown, select **SourceATP**. Click **Assign connection**.

    ![Assigned connection to SourceATP](./images/05-03.png " ")

4.  Repeat Task 6, steps 1-3, to assign connection on the TargetADW database.

    ![Assigned connections to SourceATP and TargetADW](./images/05-04.png " ") 

## Task 6: Launch the GoldenGate Deployment Console

1. When the deployment is active, click **Launch Console**.

    ![Launch Console](./images/06-01-ggs-launchconsole.png " ")

2. To log in to the GoldenGate deployment console, enter **oggadmin** for User Name and the password you created in Task 1 of this lab, and then click **Sign In**.

    ![GoldenGate Deployment Console](./images/06-02-ggs-deploymentconsole-signin.png " ")

After you log in successfully, you're brought to the GoldenGate deployment console home page. Here, you can access the GoldenGate Administration, Performance Metrics, Distribution, and Receiver Servers, as well as add Extracts and Replicats for your data replication tasks.

In this lab, you created the OCI GoldenGate deployment and registered the source and target databases. You may now **proceed to the next lab**.

## Learn More

* [Managing Deployments](https://docs.oracle.com/en/cloud/paas/goldengate-service/ebbpf/index.html#articletitle)
* [Managing connections](https://docs.oracle.com/en/cloud/paas/goldengate-service/mcjzr/index.html#articletitle)

## Acknowledgements
* **Author** - Jenny Chan, Consulting User Assistance Developer, Database User Assistance
* **Contributors** -  Julien Testut, Database Product Management; Katherine Wardhana, User Assistance Developer
* **Last Updated By/Date** - Katherine Wardhana, October 2022
