
# Create Artifacts for Your Stream Analytics Pipeline

## Introduction

This lab walks you through steps to create supporting artifacts for your Stream Analytics pipeline to monitor the public transportation in the Atlanta area.

 This is the first lab in the Monitoring Public Transportation Using Stream Analytics workshop. Follow the labs sequentially.

*Estimated Time*: 20 minutes

### Objectives
In this Lab you will:
- Download a json file which contains the sample data to be used in this tutorial
- Create a Kafka Connection
- Create a File Stream using the json file
- Create a Geo Fence

### Prerequisite
- A json file with the sample data to be used in this tutorial:
  [Click here to download file.](./files/BusStream.json?download=1)


## **Task 1:** Log in to GoldenGate Stream Analytics

You should be already logged in after completing the lab *Initialize Environment*. If that's not the case, perform the following:

1. Double click on the *Get Started with Your Workshop* icon on the upper left corner in your remote desktop to launch a fresh browser session.

    ![Get Started with your Workshop](../initialize-environment/images/get-started-icon.png "")

2. On the web browser window on the right preloaded with *GoldenGate Stream Analytics* login page, provide the credentials below to login:

    - Username

    ```
    <copy>osaadmin</copy>
    ```

    - Password

    ```
    <copy>xY3q3svdHt8=</copy>
    ```

## **Task 2:** Create a Kafka Connection

1. On the **Catalog** page, click **Create New Item**, and select **Connection**.
2. Select **Kafka** from the list, to display the **Create Connection** screen.
3. On the **Type Properties** screen, enter the following details:
   - In the **Name** field, enter **Tutorial**.
   - In the **Display Name**, enter a display name for the connection. If left blank, the **Name** field value is     copied.
   - In the **Tags** field, enter **tutorial, transport**.
   - In the **Connection Type** drop-down, the selected connection is displayed. **Kafka** in this example.
   Connection details page - enter localhost in the zookeeper url if on MP

4.

## **Task 3:** Create a Stream



## **Task 4:** Create a GeoFence

**Note:**


## Learn More

* [Transform and Analyze Data Streams](https://docs.oracle.com/en/middleware/fusion-middleware/osa/19.1/using/creating-pipeline-transform-and-analyze-data-streams.html#GUID-9DB9B57A-1095-4557-ACB9-816A696EB121)

* [Installing GoldenGate Stream Analytics](https://docs.oracle.com/en/middleware/fusion-middleware/osa/19.1/install/how-install-goldengate-stream-analytics.html#GUID-13BC895D-6AD1-4398-98E2-B5BE5B14D26B).

* [GoldenGate Stream Analytics on Oracle Cloud Marketplace](https://docs.oracle.com/en/middleware/fusion-middleware/osa/19.1/osamp/getting-started-goldengate-stream-analytics-oci.html#GUID-B488861E-1C43-4177-A1F8-40F8E44754AD).

* [Mandatory RTE Configurations](https://docs.oracle.com/en/middleware/fusion-middleware/osa/19.1/using/configuring-runtime-environment.html#GUID-EB33DDFD-7444-434D-8944-059564A453FD).

## Acknowledgements
* **Author** - Pratibha Manjunath, Senior User Assistance Developer, GoldenGate Stream Analytics
* **Contributors** -
* **Last Updated By/Date** - Pratibha Manjunath, August 2022
