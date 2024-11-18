
# Add a Database Reference to the Stream Analytics pipeline

## Introduction

This lab walks you through steps to add a reference in the Stream Analytics pipeline to fetch the driver details from the local database table.

*Estimated Time*: 10 minutes

### Objectives
In this Lab you will:
- Add the Driver Details Reference in the Pipeline

### Prerequisites
You should have successfully completed all the previous labs.

## **Task 1:** Add a Database Reference to fetch Driver Details

1. On the **IgnoreStationaryVehicles** page, click **Sources**.
2. Select **Driver Details** from the drop-down list.
3. Add a correlation condition:
  - Select **driver _ id** from the first drop-down, **equals** from the operator drop-down, and **Bus_DriveNo** from the drop-down.

![Adding a Database Reference](./images/adref.png "")

You may now **proceed to the next lab**.

## Learn More

* [Transform and Analyze Data Streams](https://docs.oracle.com/en/middleware/fusion-middleware/osa/19.1/using/creating-pipeline-transform-and-analyze-data-streams.html#GUID-9DB9B57A-1095-4557-ACB9-816A696EB121)

* [Installing GoldenGate Stream Analytics](https://docs.oracle.com/en/middleware/fusion-middleware/osa/19.1/using/install-and-upgrade.html#GUID-A687DFF0-728A-4071-947A-F3E90ABF65F6).

* [GoldenGate Stream Analytics on Oracle Cloud Marketplace](https://docs.oracle.com/en/middleware/fusion-middleware/osa/19.1/osamp/getting-started-goldengate-stream-analytics-oci.html#GUID-B488861E-1C43-4177-A1F8-40F8E44754AD).

* [Mandatory RTE Configurations](https://docs.oracle.com/en/middleware/fusion-middleware/osa/19.1/using/configuring-runtime-environment.html#GUID-EB33DDFD-7444-434D-8944-059564A453FD).

## Acknowledgements
* **Author** - Pratibha Manjunath, Senior User Assistance Developer, GoldenGate Stream Analytics
* **Contributors** - Sumathi Nelapati
* **Last Updated By/Date** -Pratibha Manjunath, December 2023
