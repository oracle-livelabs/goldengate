# Create the Oracle Cloud Infrastructure GoldenGate resources

## Introduction

This lab walks you through the steps to create Oracle Cloud Infrastructure (OCI) GoldenGate resources that you'll need to complete this workshop.

Estimated time: 30 minutes

### About Oracle Cloud Infrastructure GoldenGate resources

An Oracle Cloud Infrastructure GoldenGate deployment manages the resources it requires to function. You can create different deployments types such as, Oracle Database, MySQL, SQL Server, PostgreSQL, or Big Data. The GoldenGate deployment also lets you access the GoldenGate deployment console, where you can access the OCI GoldenGate deployment console to create and manage processes such as Extracts and Replicats.

Connections capture source and target credential information. A connection also enables networking between the Oracle Cloud Infrastructure (OCI) GoldenGate service tenancy virtual cloud network (VCN) and your tenancy VCN using a private endpoint.

### Objectives

In this lab, you will:
* Locate Oracle Cloud Infrastructure GoldenGate in the Console
* Create an OCI GoldenGate deployment for MySQL Heatwave
* Create an OCI GoldenGate deployment for Autonomous Data Warehouse
* Create connections for the source MySQL Heatwave and target Autonomous Data Warehouse
* Assign connections to deployments

### Prerequisites

This lab assumes you completed the environment set up lab, if you're running this workshop on your own tenancy.

## Task 1: Create a deployment for MySQL Heatwave

1.  Open the Oracle Cloud console navigation menu, click **Oracle Database**, and then click **GoldenGate**.

    ![GoldenGate in Oracle Cloud navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/./images/database-goldengate.png " ")

2.  On the GoldenGate **Overview** page, click **Deployments**.

    ![GoldenGate Overview page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-02-ggs-overview.png " ")

3.  You may need to select a compartment.

    > **Note:** If you're running this workshop in a LiveLabs sandbox, then under List Scope, from the Compartment dropdown, expand the root compartment, and select the compartment associated with your username. For example, if your LiveLab username is LL1234-user, expand root, and then select the compartment **LL1234-COMPARTMENT**.

4.  On the Deployments page, click **Create Deployment**.

    ![Deployments page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-04-create-deployment.png "")

5.  In the Create Deployment panel, enter `MySQLDeployment` for **Name**.

6.  From the Compartment dropdown, select **&lt;USER&gt;-COMPARTMENT**.

7.  Select **Development or testing**. OCPU Count updates based on your selection.

8.  For **Subnet**, select a subnet.If you're using the workshop environment, select **&lt;USER&gt;-SUBNET-PRIVATE**.

    ![Completed Create GoldenGate Deployment fields](./images/01-08-create-deployment.png " ")

9.  For License type, select **Bring Your Own License (BYOL)**.

10.  Click **Show advanced options**, and then select **Enable GoldenGate console public access**.

11. For Load balancer subnet, select a subnet. If you're using the workshop environment, select **&lt;USER&gt;-SUBNET-PUBLIC**.

12. Click **Next**.

  ![Example create deployment options](./images/01-12-create-deployment.png " ")

13. For Choose a deployment type, select **Data replication**.

14. For Select a technology dropdown, select **Oracle Database**.

15. For GoldenGate Instance Name, enter **ggsinstance**.

16. In an IAM-enabled tenancy, select a Credential Store. 

    * If you select **OCI Identity and Access Management (OCI IAM)**, click **Create**, and then proceed to Task 2.
    * If you select GoldenGate, complete the following steps.

17. For Administrator Username, enter **oggadmin**.

18. For Password secret in &lt;USER&gt;-COMPARTMENT, click **Create password secret**.

  ![Example create deployment options](./images/01-18-mysql-deployment.png " ")

19. In the Create secret panel, enter `LLsecret`. 

20. For User password, enter a password 8 to 30 alphanumeric characters in length, containing at least 1 uppercase, 1 lowercase, 1 numeric, and 1 special character.

    > **NOTE**: The special characters must not be $, ^, or ?

  ![Example create deployment options](./images/01-18-passwordsecret.png " ") 

21. Confirm the password, and then click **Create**.

22. Back in the Create deployment panel, for Password secret, ensure **LLsecret** is selected, and then click **Create**.

You're brought to the Deployment Details page. It takes a few minutes for the deployment to be created. Its status changes from CREATING to ACTIVE when it's ready for you to use. You can continue with Tasks 2, 3, and 4 while you wait for the deployment creation to complete.

## Task 2: Create a deployment for Autonomous Data Warehouse

1.  On the Deployments page, click **Create Deployment**.

2.  In the Create Deployment panel, enter `ADWDeployment` for **Name**.

3.  From the Compartment dropdown, select **&lt;USER&gt;-COMPARTMENT**.

4.  Select **Development or testing**. The OCPU count is autopopulated based on your selection.

5.  For Subnet, select a subnet. If you're using the workshop environment, select **&lt;USER&gt;-SUBNET-PRIVATE**.

  ![Example create ADW deployment options](./images/02-05-adw-deployment.png " ")

6.  For License type, select **Bring Your Own License (BYOL)**.

7.  Click **Show advanced options**, and then select **Enable GoldenGate console public access**.

8. For Load balancer subnet, select a subnet. If you're using the workshop environment, select **&lt;USER&gt;-SUBNET-PUBLIC**.

9. Click **Next**.

  ![Example create ADW deployment options](./images/02-09-adw-deployment.png " ")

10.  For Select a deployment type, select **Data replication**.

11. From the Select a technology dropdown, select **Oracle Database**.

12. For GoldenGate Instance Name, enter `ADWinstance`.

13. For Administrator Username, enter `oggadmin`.

14. For Password secret, select **LLsecret**.

15. Click **Create**.

  ![ADW deployment details](./images/02-14-adw-deployment.png " ")

You're brought to the deployment details page. It takes a few minutes for the deployment to be created. Its status will change from CREATING to ACTIVE when it is ready for you to use.

## Task 3: Create a connection to the source MySQL database

1.  Use the Oracle Cloud Console breadcrumb to navigate back to the Deployments page.

    ![GoldenGate highlighted in Oracle Cloud Console breadcrumb](./images/03-01-breadcrumb.png " ")

2.  In the GoldenGate menu, click **Connections**.

    ![Connections in GoldenGate menu](./images/03-02-connections.png " ")

3.  Click **Create Connection**.

    ![Connections page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-03-create-connection.png " ")

4.  In the Create Connection panel, for Name, enter `SourceMySQL`.

5.  From the Type dropdown, select **OCI MySQL Heatwave**.

6.  Click **Next**.

    ![Create a MySQL connection - General Information](./images/03-05-mysql-conn.png " ")

7.  Select the source MySQL Database system (SourceMySQL) from the Database system dropdown.

8.  For Database name, enter `SRC_OCIGGLL`.

    >**Note:** If running this lab on your own tenancy using the sample scripts provided, this is the name of the database table created in the environment setup lab.

9.  For Database username, enter `ggadmin`.

10. For Database user password, enter the password for the `ggadmin` user in the Password field.

11. Under **Traffic routing method**, choose **Shared endpoint**.

12. From the Security protocol dropdown, select **Plain**.

13. Click **Create**.

    ![MySQL connection details](./images/03-13-create-mysql-conn.png " ")

The connection becomes Active after a few minutes. Return to the Connections page.

## Task 4: Create a connection to the target Autonomous Data Warehouse

1.  On the Connections page, click **Create Connection**

2.  In the Create Connection panel, for **Name**, enter `TargetADW`.

3.  From the **Type** dropdown, select **Oracle Autonomous Database**.

    ![Create ADW connection - General information](./images/04-03-adw-conn.png " ")

4.  Click **Next**.

5.  Under **Database details**, choose **Select database**.

6.  From the **Database** dropdown, select the Autonomous Database (TargetADW).

7.  For **Password**, enter the password for the `ggadmin` user. 

    >**Note:** Enter the same password you used to unlock the `ggadmin` user in Lab 1, Task 6, Step 6.

8. Under **Traffic routing method**, choose **Shared endpoint**.

9. Under **Session mode**, choose **Direct**.

10. Click **Create**.

    ![ADW connection details](./images/04-10-create-adw-conn.png " ")

The connection becomes Active after a few minutes.

## Task 5: Assign connections to deployments

After your deployments and connections are active, you can assign the connections to the appropriate deployments.

1.  In the GoldenGate menu, click **Deployments**.

2.  Select **MySQLDeployment** to view its details.

3.  On the MySQLDeployment details page, under Resources, click **Assigned connections**.

    ![Deployment details page](./images/05-03-assigned-connections.png " ")

4.  Under Assigned connections, click **Assign connection**.

    ![Assigned connections](./images/05-04-assignconnection.png " ")

5.  In the Assign connection dialog, from the **Connection** dropdown, select **SourceMySQL**, and then click **Assign connection**.

    ![Assign connection dialog](./images/05-05-assign-connection.png " ")

    The connection appears in the Assigned Connections list.

6.  Use the breadcrumb to return to the Deployments page.

    ![Deployment details breadcrumb](./images/05-06-breadcrumb.png " ")

7.  Repeat steps 2 to 6 to assign the **TargetADW** connection to the **ADWDeployment**.

## Task 6: (Optional) Create a GoldenGate connection

Create a GoldenGate connection if your ADW deployment doesn't have a public endpoint, then assign it to the source MySQL deployment.

1.  On the Connections page, click **Create Connection**.

2.  In the Create connection panel, enter a **Name** and **Description**.

3.  For **Compartment**, select the compartment in which to create this connection.

4.  For **Type**, select **GoldenGate**.

5.  Click **Next**.

6.  For Deployment, select **ADWDeployment**.

7.  For Database username, enter `ggadmin`.

8.  Enter the database's password in the Password field. Take note of the password.

9. Click **Create**.

11. After the connection is active, on its details page, under **Resources**, click **Assigned deployments**.

12. Click **Assign deployment**.

13. In the Assign deployment dialog, select the source **MySQLDeployment**, and then click **Assign deployment**.

**Proceed to the next lab**.

## Learn more

* [Create a deployments](https://docs.oracle.com/en/cloud/paas/goldengate-service/llyhq/index.html)
* [Create a connection to Autonomous Database](https://docs.oracle.com/en/cloud/paas/goldengate-service/tqrlh/index.html)
* [Create a connection to OCI Object Storage](https://docs.oracle.com/en/cloud/paas/goldengate-service/sjsrj/index.html)
* [Assign connections to a deployment](https://docs.oracle.com/en/cloud/paas/goldengate-service/qsqts/index.html)

## Acknowledgements
* **Author** - Jenny Chan, Consulting User Assistance Developer, Database User Assistance
* **Contributors** -  Julien Testut, Database Product Management
* **Last Updated By/Date** - Jenny Chan, September 2023
* **PAR Expiration** - February 2024
