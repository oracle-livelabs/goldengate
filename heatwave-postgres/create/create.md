# Create the Oracle Cloud Infrastructure GoldenGate resources

## Introduction

This lab walks you through the steps to create Oracle Cloud Infrastructure (OCI) GoldenGate resources that you'll need to complete this workshop.

Estimated time: 30 minutes

### About Oracle Cloud Infrastructure GoldenGate deployments and connections

An Oracle Cloud Infrastructure GoldenGate deployment manages the resources it requires to function. You can create different deployment types such as, Oracle Database, MySQL, SQL Server, PostgreSQL, or Big Data. The GoldenGate deployment also lets you access the GoldenGate deployment console, where you can access the OCI GoldenGate deployment console to create and manage processes such as Extracts and Replicats.

Connections capture source and target credential information. A connection also enables networking between the Oracle Cloud Infrastructure (OCI) GoldenGate service tenancy virtual cloud network (VCN) and your tenancy VCN using a private endpoint.

### Objectives

In this lab, you will:
* Locate Oracle Cloud Infrastructure GoldenGate in the Console
* Create an OCI GoldenGate deployment for HeatWave MySQL
* Create an OCI GoldenGate deployment for OCI PostgreSQL
* Create connections for the source HeatWave MySQL, target OCI PostgreSQL and GoldenGate connection 
* Assign connections to deployments

### Prerequisites

This lab assumes you completed the environment set up lab, if you're running this workshop on your own tenancy.

To successfully complete this lab in your own tenancy:
* For IAM-enabled tenancies, ensure that you [configure Identity domains for OCI GoldenGate](https://docs.oracle.com/en/cloud/paas/goldengate-service/mkmbs/#GUID-DD9C1BF8-69FE-4C9A-A2D1-74C73550ED65).
* For non-IAM enabled tenancies, ensure that you ensure that you first [set up your Vault](https://docs.oracle.com/en-us/iaas/Content/KeyManagement/Tasks/managingvaults_topic-To_create_a_new_vault.htm#createnewvault). [Learn more about Vault service](https://docs.oracle.com/en-us/iaas/Content/KeyManagement/Concepts/keyoverview.htm).
* Add an API key in your profile settings to be used in Task 3:

1.  Oracle Cloud console global navigation bar, click **Profile** (user icon), and then select **User settings**.

    ![Oracle Cloud console User menu](images/00-01-profile.png " ")

2.  On the user details page, click **Tokens and keys**.

3.  Click **Add API Key**.

    ![Resources on User details page](images/00-03-apikey.png " ")

4.  In the Add API Key dialog, select **Generate API key pair**, click **Download Private Key** to download the key, and then click **Add**.

    ![Download Private key](images/00-04-privatekey.png " ")

5.  In the Configuration File Preview dialog, copy the fingerprint to a text editor, and then click **Close**.

> **Note:** Compartment names in the screenshots may differ from values that appear in your environment.

## Task 1: Create a deployment for HeatWave MySQL

1. In the Oracle Cloud console, open the **navigation menu**, navigate to **Oracle Database**, and then select **GoldenGate**.

    ![GoldenGate in Oracle Cloud navigation menu](./images/database-goldengate.png " ")

2.  On the GoldenGate **Overview** page, click **Deployments**.

    ![GoldenGate Overview page](./images/01-02-ggs-overview.png " ")

3.  You may need to select a compartment.

    > **Note:** If you're running this workshop in a LiveLabs sandbox, then under List Scope, from the Compartment dropdown, expand the root compartment, and select the compartment associated with your username. For example, if your LiveLab username is LL1234-user, expand root, and then select the compartment **LL1234-COMPARTMENT**.

4.  On the Deployments page, click **Create Deployment**.

    ![Deployments page](./images/01-04-create-deployment.png "")

5.  In the Create Deployment panel, enter `MySQLDeployment` for **Name**.

6.  From the Compartment dropdown, select **&lt;USER&gt;-COMPARTMENT**.

7. For Choose a deployment type, select **Data replication**.

8. For Select a technology dropdown, select **MySQL**.

    ![Completed Create GoldenGate Deployment fields](./images/01-08-create-deployment.png " ")

9.  Select **Development or testing**. OCPU Count updates based on your selection.

    ![Completed Create GoldenGate Deployment fields](./images/01-09-create-deployment.png " ")

10. Select a **Compartment** from the dropdown. For **Subnet**, select a subnet. If you're using the workshop environment, select **&lt;USER&gt;-SUBNET-PRIVATE**.

11.  For License type, select **Bring Your Own License (BYOL)**.

12. For GoldenGate Instance Name, enter **ggsinstance**

13. In an IAM-enabled tenancy, select a Credential Store:
    * If you select **OCI Identity and Access Management (OCI IAM)**, click **Create**, and then proceed to Task 2.
    * If you select **GoldenGate**, complete the following steps.

14. For Administrator Username, enter **oggadmin**.

15. Select **Create password secret**

  ![Example create deployment options](./images/01-15-create-deployment-gg-details.png " ")

16. In the Create Secret dialog, for **Name**, enter **LLsecret**.

17. From the Compartment dropdown, select **&lt;USER&gt;-COMPARTMENT**.

18. Select a Compartment from the dropdown, and select a **Vault**.

19. Select a Compartment from the dropdown, and select an **Encryption key**.

20. For User password, enter a password 8 to 30 alphanumeric characters in length, containing at least 1 uppercase, 1 lowercase, 1 numeric, and 1 special character.
    
    > **Note:** The special characters must not be $, ^, or ?.

21. Confirm the password, and then click **Create**.

  ![Create MySQLDeployment deployment](./images/01-21-passwordsecret.png " ")

22. Back in the Create deployment panel, for Password secret, ensure **LLsecret** is selected.

23. Click **Show advanced options**, and then select **Enable GoldenGate console public access**.

24. For Load balancer subnet, select a subnet. If you're using the workshop environment, select **&lt;USER&gt;-SUBNET-PUBLIC**.

25. Click **Create**.

  ![Create MySQLDeployment deployment](./images/01-25-create-deployment.png " ")

You're brought to the Deployment Details page. It takes a few minutes for the deployment to be created. Its status changes from CREATING to ACTIVE when it's ready for you to use. You can continue with Tasks 2, 3, and 4 while you wait for the deployment creation to complete.

## Task 2: Create a deployment for OCI PostgreSQL

1.  On the Deployments page, click **Create Deployment**.

2.  In the Create Deployment panel, enter `OCIPGDeployment` for **Name**.

3.  From the Compartment dropdown, select **&lt;USER&gt;-COMPARTMENT**.

4. For Choose a deployment type, select **Data replication**.

5. For Select a technology dropdown, select **PostgreSQL**.
    
    > **Note:** Select the latest available 23ai version available.

  ![Example create ADW deployment options](./images/02-05-postgresql-deployment.png " ")

6.  Select **Development or testing**. OCPU Count updates based on your selection.

    ![Completed Create GoldenGate Deployment fields](./images/01-09-create-deployment.png " ")

7. For **Subnet**, select a subnet. If you're using the workshop environment, select **&lt;USER&gt;-SUBNET-PRIVATE**.

8.  For License type, select **Bring Your Own License (BYOL)**.

9. For GoldenGate Instance Name, enter **ggsinstance**

10. In an IAM-enabled tenancy, select a Credential Store:
    * If you select **OCI Identity and Access Management (OCI IAM)**, click **Create**, and then proceed to Task 2.
    * If you select **GoldenGate**, complete the following steps.

11. For Administrator Username, enter **oggadmin**.

12. Select a **Compartment** from the dropdown. For Password secret select **LLSecret** from the dropdown.

  ![Example create deployment options](./images/02-12-create-deployment-gg-details.png " ")

13. Click **Show advanced options**, and then select **Enable GoldenGate console public access**.

14. For Load balancer subnet, select a subnet. If you're using the workshop environment, select **&lt;USER&gt;-SUBNET-PUBLIC**.

15. Click **Create**.

  ![Create MySQLDeployment deployment](./images/01-25-create-deployment.png " ")

You're brought to the deployment details page. It takes a few minutes for the deployment to be created. Its status will change from CREATING to ACTIVE when it is ready for you to use.

## Task 3: Create a connection to the source MySQL database

1.  Use the Oracle Cloud Console breadcrumb to navigate back to the Deployments page.

2.  In the GoldenGate menu, click **Connections**.

3.  Click **Create Connection**.

    ![Connections page](./images/03-03-create-connection.png " ")

4.  In the Create Connection panel, for Name, enter `SourceMySQL`.

5. From the Compartment dropdown, select **&lt;USER&gt;-COMPARTMENT**.

6. From the Type dropdown, select **Heatwave on OCI**.

    ![Create a MySQL connection - General Information](./images/03-06-mysql-conn.png " ")

7. Under **Database details**, choose **Select MySQL database system**.

8. Select a **Compartment** from the dropdown. Select the source MySQL Database system (SourceMySQL) from the Database system dropdown.

9.  For Database name, enter `SRC_OCIGGLL`.

    >**Note:** If running this lab on your own tenancy using the sample scripts provided, this is the name of the database table created in the environment setup lab.

10.  For Database username, enter `oggadmin`.

11. Select a **Compartment** from the dropdown. For Database user password secret select **LLSecret** from the dropdown.

12. For **Security protocol**, select **Plain** from the dropdown.

13. Click **Create**.

    ![MySQL connection details](./images/03-13-create-mysql-conn.png " ")

The connection becomes Active after a few minutes. Return to the Connections page.

## Task 4: Create a connection to the target OCI PostgreSQL

1.  On the Connections page, Click **Create Connection**.

    ![Connections page](./images/04-01-create-connection.png " ")

2.  In the Create Connection panel, for Name, enter `OCIPGSQL`.

3. From the Compartment dropdown, select **&lt;USER&gt;-COMPARTMENT**.

4. From the Type dropdown, select **OCI PostgreSQL**.

5. Under **Database details**, choose **Select PostgreSQL database system**.

    ![Create a PostgreSQL connection - General Information](./images/04-05-postgresql-conn.png " ")

6. Select a **Compartment** from the dropdown. Select **TargetPG** from the Database system dropdown.

7. For **Database name**, enter `postgresql`.

8.  For **Database username**, enter `oggadmin`.

9. Select a **Compartment** from the dropdown. For Database user password secret select **LLSecret** from the dropdown.

10. For **Security protocol**, select **Plain** from the dropdown.

11. Click **Create**.

    ![PostgreSQL connection details](./images/04-11-create-postgresql-conn.png " ")

## Task 5: Assign connections to the deployment

1.	In the GoldenGate menu, click **Deployments**.

2.	Select **MySQLDeployment** to view its details.

3.	On the MySQLDeployment details page, under Resources, click **Assigned connections**.

4. Under Assigned connections, click **Assign connection**.

    ![Assign connection](./images/05-04-assign-conn.png " ")

5. In the Assign connection dialog, from the **Connection** dropdown, select **SourceMySQL**, and then click **Assign connection**.

    ![Assign connection](./images/05-05-assign-conn-sourcemysql.png " ")

6. The connection appears in the Assigned Connections list.

7. Use the breadcrumb to return to the Deployments page.

8. Repeat steps 2 to 6 to assign the **TargetPG** connection to the **OCIPGDeployment**.

    ![Assign connection](./images/05-08-assigned-conn-targetpg.png " ")

## Task 6: Create a GoldenGate connection

The Oracle GoldenGate connection type allows you to establish connections to other Oracle GoldenGate deployments. In this case, create a connection to the Oracle GoldenGate deployment that initiates the replication i.e. the source MySQL deployment. The connection is essential to enable connectivity between deployments.

1.	In the GoldenGate menu, click **Deployments**.

2.  In the Create connection panel, enter a **Name**, and optionally, a **Description**.

3.	For **Compartment**, select the compartment in which to create this connection.

4.	For Type, select **GoldenGate**.

5.  Under **GoldenGate deployment**, choose **Select GoldenGate deployment**.

6.	For Deployment, select **OCIPGDeployment**.

7.	For Database username, enter **oggadmin**.

8.	For Database user password secret, select the same password secret used earlier.

9.	Click **Create**.

    ![Create GoldenGate connection](./images/06-09-create-gg-conn.png " ")

10.	After the connection is active, on its details page, click **Assigned deployments**.

11.	Click **Assign deployment**.

12.	In the Assign deployment dialog, select the source **MySQLDeployment**, and then click **Assign deployment**.

You may now **proceed to the next lab.**

## Learn more

* [Create a data replication deployment](https://docs.oracle.com/en/cloud/paas/goldengate-service/llyhq/#GUID-899C1348-58CA-43EE-B775-EAD3B365A7A9)
* [Connect to Oracle Autonomous Database](https://docs.oracle.com/en/cloud/paas/goldengate-service/tqrlh/)
* [Assign a connection to a deployment](https://docs.oracle.com/en/cloud/paas/goldengate-service/llyhq/#GUID-69F7C944-DD31-40FA-8589-4CB5113E74D0)

## Acknowledgements

- **Author** - Katherine Wardhana, User Assistance Developer
- **Contributors** -  Shrinidhi Kulkarni, GoldenGate Product Manager
- **Last Updated by** - Katherine Wardhana, June 2025