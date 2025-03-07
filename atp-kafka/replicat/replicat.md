# Create and run the Replicat

## Introduction

In this lab, you learn to Add a checkpoint table and then add and run a Replicat process in the OCI GoldenGate for Big Data deployment console.

Estimated time: 10 minutes


### About Replicat

The Replicat process runs on the target system, reads the trail on that system, and then reconstructs the DML or DDL operations and applies them to the target Apache Kafka. Replicat uses dynamic SQL to compile a SQL statement once, and then execute it many times with different bind variable.

### Objectives

In this lab, you will add and run a Replicat process.

### Prerequisites

This lab assumes that you completed all preceding labs.

## Task 1: Add and run the Replicat

1. In the OCI GoldenGate for Big Data (OCIGGBigData) deployment console, click **Administration Service**. If you don't see Extracts and Replicats, open the navigation menu and click **Overview**.

2. In the Replicats section, click **Add Replicat** (plus icon).

    ![Select Add Replicat](images/01-02-add-replicat.png " ")

3. On the Add Replicat page, for **Replicat Type**, select **Classic Replicat**, and then click **Next**.

    ![Select Classic Replicat](images/01-03-classic-replicat.png " ")

4. On the Replicat Options page, for **Process Name** enter `kafkaRep`.

5. For **Source**, select **Trail**.

6. For **Trail Name**, enter `RT`.

7. For **Target**, select **Kafka**

8. For **Available aliases**, select the **kafka** connection created in **Lab 3 Task 2**.

9. Click **Next**.

    ![Basic Information](images/01-09-basic-info.png " ")

10.	On the Parameter File page, review the mappings, and then click **Next**.

    ![Basic Mapping](images/01-10-replicat-table-mapping.png " ")

11. On the Properties Files page, locate gg.handler.kafkahandler.topicMappingTemplate, and set it to “**${FullyQualifiedTableName}**”.

    ```
    <copy>${FullyQualifiedTableName}</copy> 
    ``` 

12. Click **Create and Run**.   

    ![Replication creation completes](images/01-12a-click-and-run.png " ")

    You return to the Administration Service Overview page, where you can review the Replicat process.

    ![Replication creation completes](images/01-12b-replicat-green-status.png" ")

In this lab, you created a replicat for OCI GoldenGate for Big Data Deployment.

You may now **proceed to the next lab**.

## Learn More
* [Add a Replicat for Kafka](https://docs.oracle.com/en/cloud/paas/goldengate-service/nbxnd/#articletitle)

## Acknowledgements
* **Author** - Madhu Kumar S, Senior Solution Engineer, AppDev and Integration
* **Contributors** -  Denis Sendil, Database Product Management; Jenny Chan, Consulting User Assistance Developer, Database User Assistance; Katherine Wardhana, User Assistance Developer
* **Last Updated By/Date** - Katherine Wardhana, User Assistance Developer, December 2023
