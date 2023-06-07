
# Create a GoldenGate Stream Analytics Deployment

This lab focuses on establishing connections between your GoldenGate Stream Analytics deployment, Kafka instance, and autonomous database.

## **Lab Prerequisites**

* Completion of Lab 1: Review GoldenGate Replication

## Task 1: Create a connection between Kafka and GoldenGate

1. Create a connection to Kafka instance using that instance's public IP.

   ![Kafka connection - step 1](./images/kafka-connect-1.png "")

   ![Kafka connection - step 2](./images/kafka-connect-2.png "")

2. Now, create a connection to GoldenGate.

   ![GoldenGate connection - step 1](./images/gg-connect-1.png "")

   ![GoldenGate connection - step 2](./images/gg-connect-2.png "")

## Task 2: Create GoldenGate Stream Analytics deployment

1. Create the deployment "Stream Analytics" with **4 OCPUs**, license type **BYOL**, **Public VCN**, and **Public endpoint** in advanced options.

   ![Create Stream Analytics - step 1](./images/create-deployment-1.png "")

2. On the second page, select **Stream Analytics**, image name **StreamAnalytics**, administrator **oggadmin**, and the password.

   ![Create Stream Analytics - step 2](./images/create-deployment-2.png "")

3. The GoldenGate deployment is now being created and should take 7-8 minutes to complete.

## Task 3: Assign Connections

1. Open the GoldenGate Stream Analytics deployment.

   ![GoldenGate deployment](./images/open-deployment.png "")

2. Assign the Kafka Connection.

   ![Assign Kafka](./images/assign-kafka.png "")

3. Assign the GoldenGate connection.

4. Assign the AutonomousDatabase connection.

## Task 3: Login to admin

1. Open the GoldenGate Stream Analytics user interface.

   ![GoldenGate Stream Analytics](./images/ggsa-ui.png "")

2. Login with oggadmin and your password.

   ![Enter login](./images/ggsa-login.png "")

   ![Login landing page](./images/ggsa-login-2.png "")

## Learn More

* [GoldenGate Stream Analytics](https://docs.oracle.com/en/middleware/fusion-middleware/osa/19.1/using/introduction-goldengate-stream-analytics.html)

## Acknowledgements

* **Author** - Alex Kotopoulis, Director of Product Management, Data Integration Development
* **Contributors** - Hope Fisher and Kaylien Phan, Database Product Management
* **Last Updated By/Date** - Hope Fisher, June 2023


