# Create the Oracle Cloud Infrastructure GoldenGate resources

## Introduction

This lab walks you through the steps to create Oracle Cloud Infrastructure (OCI) GoldenGate resources that you'll need to complete this workshop.

Estimated time: 30 minutes

### About Oracle Cloud Infrastructure GoldenGate resources

An Oracle Cloud Infrastructure GoldenGate deployment manages the resources it requires to function. You can create different deployments types such as, Oracle Database, MySQL, or Big Data. The GoldenGate deployment also lets you access the GoldenGate deployment console, where you can access the OCI GoldenGate deployment console to create and manage processes such as Extracts and Replicats.

Connections capture source and target credential information. A connection also enables networking between the Oracle Cloud Infrastructure (OCI) GoldenGate service tenancy virtual cloud network (VCN) and your tenancy VCN using a private endpoint.

### Objectives

In this lab, you will:
* Locate Oracle Cloud Infrastructure GoldenGate in the Console
* Create an OCI GoldenGate deployment for the Autonomous Database
* Create an OCI GoldenGate deployment for Oracle Object Storage
* Create connections for the source Autonomous Databases and target Oracle Object Storage bucket
* Assign connections to deployments

### Prerequisites
To successfully complete this lab in your own tenancy:
* For IAM-enabled tenancies, ensure that you [configure Identity domains for OCI GoldenGate](https://docs.oracle.com/en/cloud/paas/goldengate-service/mkmbs/#GUID-DD9C1BF8-69FE-4C9A-A2D1-74C73550ED65).
* For non-IAM enabled tenancies, ensure that you ensure that you first [set up your Vault](https://docs.oracle.com/en-us/iaas/Content/KeyManagement/Tasks/managingvaults_topic-To_create_a_new_vault.htm#createnewvault). [Learn more about Vault service](https://docs.oracle.com/en-us/iaas/Content/KeyManagement/Concepts/keyoverview.htm).
* Add an API key in your profile settings to be used in Task 3:

1.  Oracle Cloud console global navigation bar, click **Profile** (user icon), and then select **User settings**.

    ![Oracle Cloud console User menu](images/00-01-profile.png " ")

2.  On the user details page, under **Resources**, click **API Keys**.

3.  Click **Add API Key**.

    ![Resources on User details page](images/00-03-apikey.png " ")

4.  In the Add API Key dialog, click **Download Private Key** to download the key, and then click **Add**.

    ![Download Private key](images/00-04-privatekey.png " ")

5.  In the Configuration File Preview dialog, copy the fingerprint to a text editor, and then click **Close**.

> **Note:** Compartment names in the screenshots may differ from values that appear in your environment.

## Task 1: Select the compartment

[](include:00-select-compartment.md)

## Task 2: Review the deployment

1. In the Oracle Cloud console, open the **navigation menu**, navigate to **Oracle Database**, and then select **GoldenGate**.

    ![GoldenGate in Oracle Cloud navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/database-goldengate.png " ")

2. You may need to select a compartment. Under List Scope, from the Compartment dropdown, expand the root compartment, and then select the compartment.

3. On the GoldenGate **Overview** page, click **Deployment** and then **OCI GoldenGate Deployment**.

    ![GoldenGate highlighted in Oracle Cloud Console breadcrumb](./images/01-03-deployment.png " ")

You can perform the following actions on the deployment details page:

* Review the deployment's status
* Launch the GoldenGate service deployment console
* Edit the deployment's name or description
* Stop and start the deployment
* Move the deployment to a different compartment
* Review the deployment resource information
* Add tags

    ![Deployment Details](./images/03-03-deployment-details.png)

## Task 3: Create an Autonomous Database connection

Follow the steps below to create a connection for the source Oracle Autonomous Transaction Processing \(ATP\) Database.

1.  Use the Oracle Cloud Console breadcrumb to navigate back to the GoldenGate page.

    ![GoldenGate highlighted in Oracle Cloud Console breadcrumb](images/03-01-breadcrumb.png " ")

2.  Click **Connections**.

    ![Connections in GoldenGate menu](images/03-02-goldengatemenu.png " ")

3.  Click **Create Connection**.

    ![Connections page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-03-create-connection.png " ")

4.  The Create connection panel appears. For Name, enter **SourceATP** and optionally, a description.

5. For **Compartment**, select the compartment in which to create this connection.

6.  From the Type dropdown, select **Oracle Autonomous Database**.

7. For Database details, select **Select database**.

    ![Create connections page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-06-create-connection-general-info.png)

8.  For **Database in &lt;compartment-name&gt;**, select **SourceATP-&lt;numbers&gt;** from the dropdown. 

9. For Database username, enter `ggadmin`.

10.  Enter the database's password in the Password field. Take note of the password.

11. For Traffic routing method, select **Shared endpoint**.

12. Click **Create**.

    ![Source Database details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-11-create-connection-gg-details.png)

    The connection becomes Active after a few minutes.

## Task 4: Unlock the GGADMIN user and check support mode for the source database

Oracle Autonomous Databases come with a GGADMIN user that is locked by default. The following steps guide you through how to unlock the GGADMIN user.

1.  From the Oracle Cloud Console **Navigation Menu** (hamburger icon), click **Oracle Database**, and then select **Autonomous Transaction Processing**.

	![Autonomous Transaction Processing in the Oracle Cloud Console navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-01-auto-db.png " ")

2.  From the list of databases, select **SourceATP**.

    ![Autonomous Databases page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-02-sourceatp.png " ")

3.  On the SourceATP Database Details page, click **Database actions**, and select **Database Users** from the dropdown.

    ![SourceATP Database Details page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-03-db-actions.png " ")

    > **Note:** If you're prompted to log in to Database Actions, use the source database admin credentials.

4.  From the list of users, locate **GGADMIN**, and then click the ellipsis (three dots) icon and select **Edit**.

    ![Database users](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-05-ggadmin.png " ")

5.  In the Edit User panel, deselect **Account is Locked**, enter the password you gave the ggadmin user in the connection Task 3, Step 8, and then click **Apply Changes**.

    ![Edit user](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-06-ggadmin-edit-user.png " ")

    Note that the user icon changes from a padlock to a checkmark.

6.  From the navigation menu (hamburger icon), click **SQL**.

    ![Open navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-07-sql.png " ")

7.  Enter the following into the Worksheet, and then click **Run Statement**.

    ```
    <copy>ALTER PLUGGABLE DATABASE ADD SUPPLEMENTAL LOG DATA;</copy>
    ```

    ![Script Output](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-08-sql-script-return.png " ")

8.  In the worksheet, enter the following, and then click **Run Statement**:

    ```
    <copy>
    select * from DBA_GOLDENGATE_SUPPORT_MODE where owner = 'SRC_OCIGGLL';
    </copy>
    ```

    The Script Output panel displays six tables whose Support_Mode is **FULL**.

    ![Script output](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-09-sql-script-return.png " ")

You can leave the source database SQL window open for use in a later lab.

## Task 5: Create a connection for Oracle Object Storage

1.  Use the Oracle Cloud Console navigation menu to navigate back to GoldenGate. Open the Oracle Cloud console navigation menu, click **Oracle Database**, and then **GoldenGate**.

    ![GoldenGate in the Oracle Cloud console navigation menu](https://oracle-livelabs.github.io/common/images/console/database-goldengate.png " ")

2.  Click **Connections** and then **Create Connection**.

3.  The Create connection panel appears. For Name, enter **TargetObjStore**.

4. For **Compartment**, select the compartment in which to create this connection.

5.  From the Type dropdown, select **OCI Object Storage**.

6.  From the Region dropdown, select your region.

    ![GoldenGate in the Oracle Cloud console navigation menu](./images/05-06-objstorageconnection.png " ")

7. For User, select **User current user**.

7.  For Private key configuration, drag-and-drop the private key (.pem) or select it from your local machine.

    >**Note**: Refer to the Prerequisites section for instructions on how to obtain a private key.

8.  Enter the corresponding public key fingerprint you copied from the prerequisite steps. You can also go back to your User settings in the Oracle Cloud console global header to copy it again.

9. For Traffic routing method, select **Shared endpoint**.

10.  Click **Create**.

  ![Target details](./images/05-10-objstorageconnection.png " ")

    The Connection becomes Active after a few minutes.

## Task 6: Assign connections to deployments

After your deployments and connections become active, you can assign the connections to the appropriate deployments.

1.  In the GoldenGate menu, click **Deployments**.

2.  Select **ATPDeployment** to view its details.

3.  On the ATPDeployment details page, under Resources, click **Assigned connections**.

    ![Deployment details page](./images/06-03-atp-assigned-connections.png " ")

4.  Under Assigned connections, click **Assign connection**.

    ![Assigned connections](./images/06-04-atp-assign-connection.png " ")

5.  In the Assign connection dialog, from the **Connection** dropdown, select **SourceATP**, and then click **Assign connection**.

    ![Assign connection dialog](./images/06-05-atp-assign-connec.png " ")

6.  Use the breadcrumb to return to the Deployments page.

    ![Deployment details breadcrumb](./images/06-06-atp-breadcrumb.png " ")

7.  Repeat steps 2 to 6 to assign the TargetObjStore connection to the OBJDeployment.

    ![OBJDeployment details](./images/06-07-obj-bdconnection.png " ")

## Task 7: Create a GoldenGate connection

Create a GoldenGate connection if your Big Data deployment doesn't have a public endpoint, and then assign it to the source ATP deployment.

1.  On the Connections page, click **Create Connection**.

    ![Create connection](./images/07-01-create-connection.png " ")

2.  The Create connection panel appears. Enter a **Name** and optionally, a description.

3.  For **Compartment**, select the compartment in which to create this connection.

4.  From the **Type** dropdown, under Generic, select **GoldenGate**.

5.  For **GoldenGate deployment**, select **Select GoldenGate deployment**.

6. For **Deployment in &lt;compartment-name&gt;**, select **OBJDeployment** from the dropdown. 

7.  For Username, enter `oggadmin`.

8.  Enter the oggadmin password in the Password field. 

    > **NOTE:** If you're using a password secret, you can view the password secret contents from the deployment details page.

9. Click **Create**.

    ![Create connection details](./images/07-09-create-connection.png " ")

10. After the connection is active, on its details page, under **Resources**, click **Assigned deployments**.

11. Click **Assign deployment**.

12. In the Assign deployment dialog, select the source **ATPDeployment**, and then click **Assign deployment**.

    ![Assign deployment](./images/07-12-assign-deployment.png " ")

**Proceed to the next lab**.

## Learn More

* [Create a deployments](https://docs.oracle.com/en/cloud/paas/goldengate-service/llyhq/index.html)
* [Create a connection to Autonomous Database](https://docs.oracle.com/en/cloud/paas/goldengate-service/tqrlh/index.html)
* [Create a connection to OCI Object Storage](https://docs.oracle.com/en/cloud/paas/goldengate-service/sjsrj/index.html)
* [Assign connections to a deployment](https://docs.oracle.com/en/cloud/paas/goldengate-service/qsqts/index.html)

## Acknowledgements
* **Author** - Jenny Chan, Consulting User Assistance Developer, Database User Assistance
* **Contributors** -  Denis Gray, Database Product Management; Katherine Wardhana, User Assistance Developer
* **Last Updated By/Date** - Katherine Wardhana, February 2025
