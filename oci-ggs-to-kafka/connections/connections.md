# Create the ATP and Kafka Connection

## Introduction

This lab walks you through the steps to create a connection to ***ATP*** and ***Kafka*** from an Oracle Cloud Infrastructure (OCI) GoldenGate deployment.

Estimated time: 5 minutes

### About Create the ATP and Kafka Connection

You can create and save the database login credentials ,Kafka connectivity ., and assigning the global credentails to appropiate deployments.

### Objectives

In this lab, you will:
* Locate Oracle Cloud Infrastructure GoldenGate in the Console
* Create connection to ATP and Kafka from OCI GOldenGate deployement


### Prerequisites

This lab assumes that you completed all preceding labs.

## Task 1: Create a connection to ATP

First, follow the steps below to create a connection to the source Oracle Autonomous Transaction Processing \(ATP\) Database and target Apache Kafka.

1.  Open the **Navigation Menu**, navigate to **Oracle Database**, and select **GoldenGate**.

    ![GoldenGate in Oracle Cloud navigation menu](images/database-goldengate.png " ")

2.  On the GoldenGate **Connections** page, click **Create connection**.

    ![GoldenGate create-connection page](images/create-connection.png " ")

3.  In the Create connection panel, enter **ATP_Source** for Name.

4.  From the Compartment dropdown, select a compartment as **GDemo**.

5.  Select Type as **OCI Autonomous Database** and click Next.
    ![GoldenGate create connection creation page](images/create-connection-general-info.png " ")

6.  On the Create connection **Connection details** page,choose the radio button **Select Database** to select the ATP Database that was created in Lab 1. Provide Database username,password and click Create.
    ![atp database connection created](images/create-atp-connection.png " ")



## Task 2: Create a connection to Apache Kafka

Follow the steps below to create a connection to the target  Apache Kafka.

1.  Open the **Navigation Menu**, navigate to **Oracle Database**, and select **GoldenGate**.

    ![GoldenGate in Oracle Cloud navigation menu](images/database-goldengate.png " ")

2.  On the GoldenGate **Connections** page, click **Create connection**.

    ![GoldenGate create-connection page](images/create-connection.png " ")

3.  In the Create connection panel, enter **Kafka** for Name.

4.  From the Compartment dropdown, select a compartment as **GDemo**.

5.  Select Type as **Apache Kafka** and click Next.
    ![Connection type selected as Apache Kafka](images/create-connection-apache-kafka.png " ")

6.  On the Create connection **Connection details** page,provide public ip of Boothstrap servers of Kafka OCI Instance that was configured in Lab 1 for **Host**. Port as **9092**. Select Security Protocol as **Plaintext** and click Create.
    ![public ip of boothstrap server](images/boothstrap-server.png " ")

## Task 3: Assign Connections to Deployments
1. Go to Connections and click on **ATP_Connection** that was created in ***Task 1***. Click ***Assign Deployment***.

    ![assign-deployment-oracle](images/assign-deployment-oracle.png " ")
2. Select OCI GoldenGate deployment as ***Oracle_Deployment***  and click **Assign Deployment**.
deployment-oracle-select
    ![deployment-oracle-select](images/deployment-oracle-select.png " ")

3.	Go back to **Connections** and click on **Kafka Connection** that was created in the ***Task 2***
kafka-connection
    ![kafka-connection](images/kafka-connection.png " ")
4.	Select OCI GoldenGate for Big Data deployment as ***OCIGG_BigData***  and click Assign Deployment.
    ![assign-kafka-connection](images/assign-kafka-connection.png " ")
In this lab, you created a connection to source ATP and target Apache Kafka.

## Learn More

* [Manage Deployment users](https://docs.oracle.com/en/cloud/paas/goldengate-service/using/manage-user-accounts.html#GUID-56E2E146-7713-4094-8BEC-7C138064EB21)

## Acknowledgements
* **Author** - Madhu Kumar S, AppDev and Integration, Bangalore Tech Teame
* **Contributors** -  Deniz Sendil, Database Product Management; Jenny Chan, Consulting User Assistance Developer
* **Last Updated By/Date** - 
