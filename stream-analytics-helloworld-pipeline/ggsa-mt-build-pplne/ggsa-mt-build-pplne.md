
# Build Your Stream Analytics Pipeline

This lab walks you through steps to create supporting artifacts for your Stream Analytics pipeline to monitor the public transportation in the Atlanta area.

 This is the first lab in the Monitoring Public Transportation Using Stream Analytics workshop. Follow the labs sequentially.

*Estimated Time*: 20 minutes

### Objectives
In this Lab you will:
- Create a Pipeline
- Create a Stage to Identify Vehicles Only in Atlanta
- Create a Query Stage to Ignore Stationary Vehicles

### Prerequisites
This Lab assumes you have:
-

## **Task 1:** Create a Pipeline

1. On the Catalog page, **Create New Item**, and select **Pipeline**.

2. Select **Pipeline** from the submenu, to display the **Create Pipeline** screen

3. On the Create Pipeline screen:

  - In the **Name** field, enter **Tutorial**.
  - In the **Description** field, enter **Tutorial: Vehicle Monitoring Pipeline**.
  - In the **Tags** field, enter **transportation, tutorial**.
  - From the **Stream** drop-down, select the **Tutorial** File stream that you created in [Lab 4: Create Artifacts for Your Stream Analytics Pipeline.] (#prev)

  

4. Click **Save**.
The Tutorial pipeline is created and displayed. Listening for events begins, and then streaming events start to flow.

## **Task 2:** Create a Stage to Identify Vehicles Only in Atlanta


## **Task 3:** Create a Query Stage to Ignore Stationary Vehicles

## Learn More

* [Transform and Analyze Data Streams](https://docs.oracle.com/en/middleware/fusion-middleware/osa/19.1/using/creating-pipeline-transform-and-analyze-data-streams.html#GUID-9DB9B57A-1095-4557-ACB9-816A696EB121)

* [Installing GoldenGate Stream Analytics](https://docs.oracle.com/en/middleware/fusion-middleware/osa/19.1/install/how-install-goldengate-stream-analytics.html#GUID-13BC895D-6AD1-4398-98E2-B5BE5B14D26B).

* [GoldenGate Stream Analytics on Oracle Cloud Marketplace](https://docs.oracle.com/en/middleware/fusion-middleware/osa/19.1/osamp/getting-started-goldengate-stream-analytics-oci.html#GUID-B488861E-1C43-4177-A1F8-40F8E44754AD).

* [Mandatory RTE Configurations](https://docs.oracle.com/en/middleware/fusion-middleware/osa/19.1/using/configuring-runtime-environment.html#GUID-EB33DDFD-7444-434D-8944-059564A453FD).

## Acknowledgements
* **Author** - Pratibha Manjunath, Senior User Assistance Developer, GoldenGate Stream Analytics
* **Contributors** - Prabhu Thukaram, Rene Fontcha
* **Last Updated By/Date** - Rene Fontcha, LiveLabs Platform Lead, NA Technology, January 2022
