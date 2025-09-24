# Lab 2: Review OCI GoldenGate Resources

**Duration:** 10 minutes  

## Introduction
In this lab, you will review the key resources provisioned for this workshop. You will validate access to the source and target databases, confirm the GoldenGate deployment is running, and test the GoldenGate connections. This step ensures your environment is ready before configuring replication pipelines.

### Objectives 

In this lab, you:

* Log in to the Oracle Cloud console and locate your ATP source and ADW target databases.  
* Verify that the YAS_POS Orders dataset is available in the ATP source.  
* Locate the GoldenGate deployment and confirm its status.  
* Verify GoldenGate connections to both source and target databases are configured and working.  

### Prerequisites

Ensure that you've successfully completed all tasks in the preceding lab. 

## Task 1: Review POS source and target databases

1.  Return to the Oracle Cloud console. Use the Launch OCI button in your Reservation Information panel if you closed the window or were logged out. 

2.  In the Oracle Cloud navigation menu, select **Oracle Database**, then **Autonomous Transaction Processing**.  

3.  On the Autonomous Transaction Processing page, select **Source POS**.

4.  On the Source POS details page, verify that the **YAN_POS Orders dataset** schema exists (tables `POS_ORDER` and `ORDERITEM`).

    Optionally, open the **Database Actions → SQL Worksheet** and run:  
     
     ``` 
     <copy> SELECT COUNT(*) FROM YAN_POS.POS_ORDER;
     SELECT COUNT(*) FROM YAN_POS.ORDERITEM;</copy>
     ```
     
     This confirms sample data is loaded.  

5.  In the Oracle Cloud console navigation menu, select **Oracle Database**, then **Autonomous Data Warehouse**.

6.  On the Autonomous Data Warehouse page, select **Target AI Hub**.

    ![Image alt text](images/01-03-adw.png)  

7. Verify connectivity and note the database service name for later steps.  

## Task 2: Test assigned connections
   
1.  In the Oracle Cloud console navigation menu, select **Oracle Database**, then **GoldenGate**.

2.  In the GoldenGate menu, select **Deployments**.

3.  On the Deployments page, select **GG-AI-Demo**.

4.  On the deployment details page, verify that the deployment status is **Active**. 

    ![Image alt text](images/01-04-ggs.png)  

5.  Take note of the **Deployment console URL** for later use.

    ![Image alt text](images/01-05-console-url.png)  

6.  Click **Assigned connections**.
    
    ![Image alt text](images/01-05-test-connection.png)    
    
7.  On the Assigned connections page, from the Actions menu for **ATP (source)**, select **Test connection**. 

8.  Repeat step 7 for **ADW (target**).

    ![Image alt text](images/01-05-test-success.png) 

    > **Note:** If an error message appears, then return to the connection details and check your settings.

9.  Click **Launch Console**.

10. On the GoldenGate sign in page, enter `oggadmin` for **Username**, then copy and paste the **GoldenGate password** from the Reservation Information panel for Password.

11. In the GoldenGate deployment console from the  **Administration Service** navigation menu, select **DB Connections**.
    
    You should see two connections already provisioned:  
    * **Source (ATP)** – ATP\_POS\_Source\_Connection.  
    * **Target (ADW)** – ADW\_AI\_Mirror\_Target\_Connection.  

    You can also test connectivity for these connections. In the Actions column for each connection, click Connect. If the connection is successful, the page displays Checkpoint tables.

    ![Image alt text](images/01-06-login-db.png) 

You may now **proceed to the next lab**.

## Acknowledgements
* **Author** - Shrinidhi Kulkarni, GoldenGate Product Manager
* **Reviewed By**  - Denis Gray,  Vice President, GoldenGate Product Management
* **Last Updated By/Date** - Jenny Chan, September 2025