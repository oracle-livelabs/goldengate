# Lab 2: Review OCI GoldenGate Resources

**Duration:** 10 minutes  

## Introduction
In this lab, you will review the key resources provisioned for this workshop. You will validate access to the source and target databases, confirm the GoldenGate deployment is running, and test the GoldenGate connections. This step ensures your environment is ready before configuring replication pipelines.

## Objectives
In this lab, you will:
* Log in to the OCI Console.  
* Review the POS Source Data in the Autonomous Transaction Processing (ATP) database.  
* Review the POS AI Hub Target in Autonomous Data Warehouse (ADW).  
* Review the OCI GoldenGate Deployment.  
* Review the OCI GoldenGate Connections.  
* Test the OCI GoldenGate Connections to confirm they are valid.  

## Steps

1. **Login to OCI Console**  
   - Open a browser and navigate to the [OCI Console](https://cloud.oracle.com).  
   - Log in using your OCI workshop credentials provided by the instructor.  
   - Verify that you are in the correct compartment for the lab resources.  

2. **Review POS Source Data – ATP**  
   - In the OCI Console, go to **Oracle Database → Autonomous Transaction Processing**.  
   - Open the ATP instance provisioned as your POS **source database**.  
   - Verify that the **YAS_POS Orders dataset** schema exists (tables `ORDERS` and `ORDER_ITEMS`).  
   - Optionally, open the **Database Actions → SQL Worksheet** and run:  
     ```sql
     SELECT COUNT(*) FROM orders;
     SELECT COUNT(*) FROM order_items;
     ```
     This confirms sample data is loaded.  

3. **Review POS AI Hub – ADW**  
   - In the OCI Console, go to **Oracle Database → Autonomous Data Warehouse**.  
   - Open the ADW instance provisioned as the **target AI Hub database**.  
   - Verify connectivity and note the database service name for later steps.  

4. **Review OCI GoldenGate Deployment**  
   - In the OCI Console, navigate to **Oracle Database → GoldenGate**.  
   - Select the GoldenGate deployment created for this workshop.  
   - Confirm the deployment status is **Active**.  
   - Note the **deployment URL** for later use.  

5. **Review OCI GoldenGate Connections**  
   - Inside the GoldenGate deployment console, click on **Administration Service → Configuration → Connections**.  
   - You should see two connections already provisioned:  
     - **Source (ATP)** – POS Orders transactional database.  
     - **Target (ADW)** – AI Hub warehouse.  

6. **Test OCI GoldenGate Connections**  
   - From the **Connections** tab, select each connection.  
   - Use the **Test Connection** button to validate connectivity.  
   - Confirm both **ATP (source)** and **ADW (target)** connections return a **successful status**.  
   - If any test fails, recheck the connection details (hostname, service name, credentials) and retry.  

## Outcomes
By the end of this lab, you will be able to:
* Navigate the OCI Console to locate your ATP source and ADW target databases.  
* Confirm that the YAS_POS Orders dataset is available in the ATP source.  
* Identify the GoldenGate deployment and confirm its status.  
* Verify GoldenGate connections to both source and target databases are configured and working.  
