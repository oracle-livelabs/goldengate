# Replicate data from East to West

## Introduction

This lab walks you through the steps create and run an Extract, add a User Administrator, create a Path Connection, create and run a Distribution Path, and create and run a Replicat.

Estimated time: 20 minutes

   ![Replication from East to West with Distribution Path](./images/rep-east-west-dp.png " ")

### About Extracts, Distribution Paths, and Replicats

An Extract is a process that extracts or captures data from a source database. A Distribution Path is a source-to-destination configuration that uses the Distribution Service to send data in a distributed environment. A Replicat is a process that delivers data to a target database.

### About User Administrators

Authorization in Oracle GoldenGate relies on user roles. As a User Administrator, you can choose and assign various user roles when creating Oracle GoldenGate users. These roles include a User, an Operator, an Administrator, and a Security.

### About a Path Connection

A Path Connection creates Credentials for the DistPath to connect to a GoldenGate Deployment. You will need to provide the login information for the GoldenGate alias. 

### Objectives

In this lab, you will:
* Add and run an Extract process to capture data
* Create a new User Administrator
* Create a Path Connections
* Add and run a Distribution Path to send data
* Add and run a Replicat process to consume the trail file received from the West database

## Task 1:  Add and run an Extract

1. Make sure that you're on the **East** Microservices WebUI. In the navigation menu, click **Extracts**.

2. Click **Add Extract** (plus icon).

    ![Add Extracts](./images/01-02-add-extract.png " ")

3. The Add Extract panel consists of five pages. On the Extract information page, complete the following fields, and then click **Next**:  
    * For Extract Type, select **Integrated Extract**.
    * For Process Name, enter **EEAST**.

    ![Extract Information page](./images/01-03-extract-info.png " ")

4. On the Extract Options page, complete the following fields, and then click **Next**: 
    * For Domain, select **OracleGoldenGate** from the dropdown.
    * For Alias, select **EAST** from the dropdown.
    * For Name, enter **ee**.

    ![Extract Options page](./images/01-04-extract-options.png " ")

5. On the Managed Options page, for Profile Name, select **east-profile** from the dropdown, and then click **Next**.

    ![Managed Options page](./images/01-05-managed-options.png " ")

6. On the Parameter File page, in the text area, add a new line to the existing text and add the following:

    ```
    <copy>TRANLOGOPTIONS EXCLUDETAG 00
    DDL INCLUDE MAPPED
    table HR.*;</copy>
    ```

7. Click **Create**. 

    ![Parameter File page](./images/01-07-param-file.png " ")

    You return to the GoldenGate 23ai Microservices WebUI Home page.

8. In the EEAST **Action** menu, select **Start**. In the Confirm Action dialog, click **OK**. 

    ![Start Extract](./images/01-08-start-extract.png " ")

## Task 2: Add a West Oracle GoldenGate user
This user will be used by the West Deployment to connect to the East Receiver Service. 

1. Switch to the **West** Microservices WebUI.

2. Open the navigation menu and then click **User Administration**.

3. Click **Add New User** (plus icon). 

    ![Add New User](./images/02-03-new-user-list.png " ")

4. A Create new User pop up will appear, complete the following fields, and then click **Submit**:  
    * For the Authenticated By dropdown, select **Password**.
    * For the Role dropdown, select **Operator**.
    * For Info, enter **Path User**.
    * For Username, enter **oggnet-west**.
    * For Password, paste the Global Password from the Reservation Information. Verify the password. 

    ![Create New User](./images/02-04-create-new-user.png " ")

5. The user you created appears in the Users list.

    ![User list](./images/02-05-user-list.png " ")

## Task 3: Add a Path Connection
A Path Connection creates Credentials for the East Distribution Service to connect to the West Receiver Service. 

1. Switch to the **East** Microservices WebUI.

2. In the navigation menu, click **Path Connections**, and then click **Add Path Connection** (plus icon).

    ![Click Add Path Connection](./images/03-02-add-path-connect.png " ")

3. A Path Connection panel appears, complete the following fields, and then click **Submit**:  
    * For Credential Alias, enter **east\_to\_west**.
    * For User ID, enter **oggnet-west**.
    * For Password, paste the Global Password from the Reservation Information. Verify the password. 

    ![Path Connection panel](./images/03-03-path-connect.png " ")

4. The path connection you created appears in the Path Connections list.

    ![Path Connection list](./images/03-04-pc-list.png " ")

## Task 4: Add a Distribution Path to West deployment

1. On the top navigation menu, click **Distribution Service**, and then click **Add Distribution Path** (plus icon). 

    ![Click Add Distribution Path](./images/04-01-add-dist-path.png " ")

2. The Add Path panel consists of seven pages. On the Path Information page, for Name, enter **DPEAST**, and then click **Next**.

    ![Path Information page](./images/04-02-path-info.png " ")

3. On the Source Options page, complete the following fields, and then click **Next**:  
    * For Source Extract, select **EEAST** from the dropdown.
    * For Trail Name, **ee** should automatically populate the field.

    ![Source Options page](./images/04-03-source-options.png " ")

4. On the Target Options page, complete the following fields, and then click **Next**:  
    * For Target Host, paste the **OGG West Private IP** value from the Reservation Information. 
    * For Port Number, enter **9014**.
    * For Trail Name, enter **de**.
    * For Alias, enter **east\_to\_west**.

    ![Target Options page](./images/04-04-target-options.png " ")
    
5. On the Advanced Options page, leave the fields as is, and click **Next**.

    ![Advanced Options page](./images/04-05-adv-options.png " ")

6. On the Filtering Options page, leave the fields as is, and click **Next**.

    ![Filtering Options page](./images/04-06-filtering-options.png " ")

7. On the Managed Options page, leave the fields as is, and click **Create Path**.

    ![Managed Options page](./images/04-07-managed-options.png " ")

    You return to the Distribution Service page.

8. On the left hand navigation menu, click **Distribution Paths**.

9. In the DPEAST **Action** menu, select **Start**. In the Confirm Action dialog, click **OK**.

    ![Start Distribution Path](./images/04-09-start-dist-path.png " ")

## Task 5: Add a Replicat on West deployment 

1. Switch to the **West** Microservices WebUI.

2. Open the top navigation menu, click **Administration Service**, and then click **Add Replicat** (plus icon).

    ![Administration Service navigation menu](./images/05-02-nav-config.png " ")

3. The Add Replicat panel consists of four pages. Complete the following fields, and then click **Next**:  
    * On the Replicat information page, for Replicat Type, select **Parallel Replicat**.
    * For Parallel Replicat Type, select **Nonintegrated**.
    * For Process Name, enter **RWEST**.

    ![Replication Information page](./images/05-03-rep-info.png " ")

4. The Replicat Options panel consists of four pages. Complete the following fields, and then click **Next**:  
    * On the Replicat Options page, for Name, enter **de**.
    * For Domain, select **OracleGoldenGate** from the dropdown.
    * For Alias, select **WEST** from the dropdown.
    * For Checkpoint Table, select **"OGGADMIN"."CHECKPOINTTABLE"** from the dropdown.

    ![Replication Options page](./images/05-04-rep-options.png " ")

5. On the Managed Options page, for Profile Name, select **west-profile** from the dropdown, and then click **Next**.

    ![Managed Options page](./images/05-05-managed-options.png " ")

6. On the Parameter File page, in the text area, replace **MAP *\.\*, TARGET \*.\*;** with the following script:

    ```
    <copy>DDL INCLUDE MAPPED
    MAP HR.*, TARGET HR.*;</copy>
    ```
7. Click **Create**.

    ![Parameter File page](./images/05-07-param-file.png " ")

8. In the RWEST **Action** menu, select **Start**. In the Confirm Action dialog, click **OK**. 

    ![Start Replicat](./images/05-08-start-replicat.png " ")

You may now **proceed to the next lab.**

## Learn more

* [Before Adding Extract and Replicat Processes](https://docs.oracle.com/en/middleware/goldengate/core/23/coredoc/configure-ogg-adding-extract-and-replicat.html#GUID-C1044A4D-945E-4080-B79C-74FA9D004143)
* [Registering Extract for Oracle](https://docs.oracle.com/en/middleware/goldengate/core/23/coredoc/extract-oracle-registering-extract.html)
* [Access Extract Details](https://docs.oracle.com/en/middleware/goldengate/core/23/coredoc/extract-access-extract-details.html)
* [About Distribution Service](https://docs.oracle.com/en/middleware/goldengate/core/23/coredoc/distribute-distribution-service.html)
* [About Replicat](https://docs.oracle.com/en/middleware/goldengate/core/23/coredoc/replicat-replicat.html)

## Acknowledgements
* **Author** - Katherine Wardhana, User Assistance Developer
* **Contributors** -  Alex Lima, Database Product Management
* **Last Updated By/Date** - Katherine Wardhana, August 2024