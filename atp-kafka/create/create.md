# Create the Oracle Cloud Infrastructure GoldenGate Deployment

## Introduction

This lab walks you through the steps to create Oracle Cloud Infrastructure (OCI) GoldenGate resources that you'll need to complete this workshop.

Estimated time: 30 minutes

### About Oracle Cloud Infrastructure GoldenGate resources

An Oracle Cloud Infrastructure GoldenGate deployment manages the resources it requires to function. The GoldenGate deployment also lets you access the GoldenGate deployment console, where you can create and manage processes such as Extracts and Replicats.

Connections capture source and target credential information. A connection also enables networking between the Oracle Cloud Infrastructure (OCI) GoldenGate service tenancy virtual cloud network (VCN) and your tenancy VCN using a private endpoint.

### Objectives

In this lab, you will:
* Locate Oracle Cloud Infrastructure GoldenGate in the Console
* Create an OCI GoldenGate deployment for the Autonomous Database
* Create an OCI GoldenGate deployment for Apache Kafka
* Create connections for the source Autonomous Databases and target Apache Kafka node.
* Assign connections to deployments

### Prerequisites
This lab assumes that you completed the preceding lab, and your Autonomous Database is in the Active state.

> **Note:** *Compartment names in the screenshots may differ from values that appear in your environment.*

## Task 1: Create a deployment

1.  Open the **Navigation Menu**, navigate to **Oracle Database**, and select **GoldenGate**.

    ![GoldenGate in Oracle Cloud navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/database-goldengate.png " ")

2.  On the GoldenGate **Overview** page, click **Deployments**.

    ![GoldenGate Overview page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-02-ggs-overview.png " ")

3.  You may need to select a compartment. Under List Scope, from the Compartment dropdown, expand the root compartment, and then select the compartment associated with your username. For example, if your LiveLab username is LL1234-user, expand root, and then select the compartment **LL1234-COMPARTMENT**.

4.  On the Deployments page, click **Create Deployment**.

    ![Deployments page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-04-create-deployment.png "")

5.  In the Create Deployment panel, enter **ATPDeployment** for Name.

6.  From the Compartment dropdown, select a compartment.

7.  For OCPU Count, enter **1**.

8.  For Subnet, select a subnet. If you're using the workshop environment, select **&lt;user&gt;pubsubnt**.

9.  For License type, select **Bring Your Own License (BYOL)**.

10. Click **Show Advanced Options**, and then select **Create Public Endpoint**.

    ![Completed Create GoldenGate Deployment fields](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-10-create-deployment-summary.png " ")

11. Click **Next**.

12. From the Select a technology dropdown, select **Oracle Database**.

13. For GoldenGate Instance Name, enter **ATPinstance**.

14. For Administrator Username, enter **oggadmin**.

15. For Administrator Password, enter a password. Take note of this password.

16. Click **Create**.

    ![Completed GoldenGate details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-16-create-deployment-summary.png " ")

You're brought to the Deployment Details page. It takes a few minutes for the deployment to be created. Its status will change from CREATING to ACTIVE when it is ready for you to use.

## Task 2: Create a deployment for Apache Kafka

1.  On the Deployments page, click **Create Deployment**.

2.  In the Create Deployment panel, enter **BDDeployment** for Name.

3.  From the Compartment dropdown, select a compartment.

4.  For OCPU Count, enter **1**.

5.  For Subnet, select a subnet. If you're using the workshop environment, select **&lt;user&gt;pubsubnt**.

6.  For License type, select **Bring You Own License (BYOL)**.

7.  Click **Show Advanced Options**, and then select **Create Public Endpoint**.

    ![Completed Create GoldenGate Deployment fields](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-07-bigdata.png " ")

8.  Click **Next**.

9.  From the Select a technology dropdown, select **Oracle Database**.

10. For GoldenGate Instance Name, enter **BDinstance**.

11. For Administrator Username, enter **oggadmin**.

12. For Administrator Password, enter a password. Take note of this password.

13. Click **Create**.

    ![Completed GoldenGate details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-13-bigdata.png " ")

You're brought to the Deployment Details page. It takes a few minutes for the deployment to be created. Its status will change from CREATING to ACTIVE when it is ready for you to use.

## Task 3: Create an Autonomous Database connection

Follow the steps below to create a connection for the source Oracle Autonomous Transaction Processing \(ATP\) Database.

1.  Use the Oracle Cloud Console breadcrumb to navigate back to the GoldenGate page.

    ![GoldenGate highlighted in Oracle Cloud Console breadcrumb](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-01-breadcrumb.png " ")

2.  Click **Connections**.

    ![Connections in GoldenGate menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-02-goldengatemenu.png " ")

3.  Click **Create Connection**.

    ![Connections page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-03-connections.png " ")

4.  In the Create Connection panel, for Name, enter **SourceATP**.

5.  From the Type dropdown, select **OCI Autonomous Database**.

6.  Click **Next**.

7.  For **Database in &lt;compartment-name&gt;**, click **Change Compartment**, select the compartment you created your ATP instance, and then select **SourceATP** from the dropdown. Some fields are autopopulated based on your selection.

8.  Enter a password for the `ggadmin` user in the Password field, and then click **Create**.

    ![Source Database details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-08-atpconnection.png)

    The database registration becomes Active after a few minutes.

## Task 4: Unlock the GGADMIN user and check support mode for the source database

Oracle Autonomous Databases come with a GGADMIN user that is locked by default. The following steps guide you through how to unlock the GGADMIN user.

1.  From the Oracle Cloud Console **Navigation Menu** (hamburger icon), click **Oracle Database**, and then select **Autonomous Transaction Processing**.

	![Autonomous Transaction Processing in Oracle Cloud Console navigation menu](https://oracle-livelabs.github.io/common/images/console/database-atp.png " ")

2.  From the list of databases, select **SourceATP**.

    ![Autonomous Databases page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-02-sourceatp.png " ")

3.  On the SourceATP Database Details page, click **Database Actions**.

    ![Database Details page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-03-db-tools.png " ")

    > **Note:** *If you're prompted to log in to Database Actions, use the source database admin credentials.*

4.  Under **Administration**, click **Database Users**.

    ![Database Actions](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/sql-dbusers.png " ")

5.  From the list of users, locate **GGADMIN**, and then click the ellipsis (three dots) icon and select **Edit**.

    ![GGADMIN user context menu highlighted](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-06-locked.png)

6.  In the Edit User panel, deselect **Account is Locked**, enter the password you gave the ggadmin user in the database registration steps above, and then click **Apply Changes**.

    ![Edit user](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-07-edit.png)

    Note that the user icon changes from a padlock to a checkmark.

7.  From the navigation menu (hamburger icon), click **SQL**.

8.  In the worksheet, enter the following, and then click **Run Statement**:

    ```
    <copy>
select * from DBA_GOLDENGATE_SUPPORT_MODE where owner = 'SRC_OCIGGLL';
    </copy>
    ```

    The Script Output panel displays six tables whose Support_Mode is **FULL**.

    ![Script output](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-09b-supportmode.png " ")

You can leave the source database SQL window open for use in a later lab.

## Task 5: Create a connection for Apache Kafka

1.  Use the Oracle Cloud Console navigation menu to navigate back to GoldenGate.

2.  Click **Connections** and then **Create Connection**.

3.  In the Create Connection panel, enter **TargetKafka** for Name.

4.  From the Type dropdown, select **Apache Kafka**.

5.  Click **Next**.

6.  For Connection Details, enter the **Host** and **Port** for the bootstrap server.

7.  For **Security Protocol**, select a protocol and complete the corresponding fields.

8.  Click **Create**.

    The Connection becomes Active after a few minutes.

## Task 6: Assign connections to deployments

After your deployments and connections become active, you can assign the connections to the appropriate deployments.

1.  In the GoldenGate menu, click **Deployments**.

2.  Select **ATPDeployment** to view its details.

3.  On the ATPDeployment details page, under Resources, click **Assigned connections**.

    ![Deployment details page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/06-03-assignedconnections.png " ")

4.  Under Assigned connections, click **Assign connection**.

    ![Assigned connections](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/06-04-assignconnection.png " ")

5.  In the Assign connection dialog, from the **Connection** dropdown, select **SourceATP**, and then click **Assign connection**.

    ![Assign connection dialog](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/06-05-assignconnection.png " ")

6.  Use the breadcrumb to return to the Deployments page.

    ![Deployment details breadcrumb](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/06-06-breadcrumb.png " ")

7.  Repeat steps 2 to 6 to assign the TargetKafka connection to the BDDeployment.

    ![OBJDeployment details](images/06-07-bdconnection.png " ")

## Task 7: (Optional) Create a GoldenGate connection

Create a GoldenGate connection if your Big Data deployment doesn't have a public endpoint, and then assign it to the source ATP deployment.

1.  On the Connections page, click **Create Connection**.

2.  In the Create connection panel, enter a **Name** and **Description**.

3.  For **Compartment**, select the compartment in which to create this connection.

4.  For **Type**, select **GoldenGate**.

5.  Click **Next**.

6.  For Connection details, select **BDDeployment**.

7.  Under Network connectivity, select **Network connectivity via private endpoint**.

8.  For **Subnet**, select the subnet to which a private endpoint is created from the OCI GoldenGate service tenancy.

9.  For **Private IP address**, enter the private IP for the BDDeployment.

10. Click **Create**.

11. After the connection is active, on its details page, under **Resources**, click **Assigned deployments**.

12. Click **Assign deployment**.

13. In the Assign deployment dialog, select the source **ATPDeployment**, and then click **Assign deployment**.

**Proceed to the next lab**.


## Learn More

* [Create a deployments](https://docs.oracle.com/en/cloud/paas/goldengate-service/llyhq/index.html)
* [Create a connection to Autonomous Database](https://docs.oracle.com/en/cloud/paas/goldengate-service/tqrlh/index.html)
* [Create a connection to Apache Kafka](https://docs.oracle.com/en/cloud/paas/goldengate-service/wkynw/index.html)
* [Assign connections to a deployment](https://docs.oracle.com/en/cloud/paas/goldengate-service/qsqts/index.html)

## Acknowledgements
* **Author** - Jenny Chan, Consulting User Assistance Developer, Database User Assistance
* **Contributors** -  Denis Gray, Database Product Management
* **Last Updated By/Date** - Jenny Chan, October 2022
