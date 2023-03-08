
# Add Business Rules to Your Stream Analytics Pipeline

## Introduction

A pipeline includes a sequence of data processing stages such as, Query, Pattern, Rule, Query Group, Custom, and Scoring. You can apply business logic to an input data stream, within a pipeline.

*Estimated Time*: 15 minutes

### About this Lab

This lab provides steps to create a basic pipeline, add a query stage and a filter to it, and publish the pipeline; all this in less than 15 minutes!

### Objectives
In this Lab you will:
- Create a Rule Stage
- Add a Rule for Highways to Have a Name Value
- Add a Rule to Identify Bus Drivers Driving Recklessly
- Add a Rule to Identify Drivers Driving with Major Violations
- Add a Rule to Identify Drivers Driving with Minor Violations


### Prerequisites
This Lab assumes you have:
- A Free Tier, Paid, or LiveLabs Oracle Cloud account
- SSH Private Key to access the host via SSH

## **Task 1:** Create a Rule Stage

In the Pipeline Editor, right-click the Query Stage, click **Add a Stage**, and then select **Rule**.
  - On the **Create Rule Stage** screen:
  - In the name field, enter **SpeedViolation**.
  - In the **Description** field, enter **Determine violation speeds for the vehicles**.
  - In the **Tags** field, enter **transportation, tutorial**.
  - Click **Save**.
The SpeedViolation Business Rules page is displayed. The values you provide on this page are used for visual analytics.

## **Task 2:** Add a Rule for Highways to Have a Name Value
 - On the **Rules** tab of the **SpeedViolation** Business Rules page:
 - In the Rule Name field, enter **Dlt-Hwy**
 - In the **Description** field, enter **Ensure all highways have a name value**.
 - Click **Done**.

## **Task 3:** Add a Rule to Identify Bus Drivers Driving Recklessly
- On the **Rules** tab of the **SpeedViolation** Business Rules page:
 - In the Rule Name field, enter **Reckless**
 - In the **Description** field, enter **Bus drivers who are driving recklessly**.
 - Click **Done**.

## **Task 4:** Add a Rule to Identify Drivers Driving with Major Violations
## **Task 5:** Add a Rule to Identify Drivers Driving with Minor Violations

## Learn More

* [Transform and Analyze Data Streams](https://docs.oracle.com/en/middleware/fusion-middleware/osa/19.1/using/creating-pipeline-transform-and-analyze-data-streams.html#GUID-9DB9B57A-1095-4557-ACB9-816A696EB121)

* [Installing GoldenGate Stream Analytics](https://docs.oracle.com/en/middleware/fusion-middleware/osa/19.1/install/how-install-goldengate-stream-analytics.html#GUID-13BC895D-6AD1-4398-98E2-B5BE5B14D26B).

* [GoldenGate Stream Analytics on Oracle Cloud Marketplace](https://docs.oracle.com/en/middleware/fusion-middleware/osa/19.1/osamp/getting-started-goldengate-stream-analytics-oci.html#GUID-B488861E-1C43-4177-A1F8-40F8E44754AD).

* [Mandatory RTE Configurations](https://docs.oracle.com/en/middleware/fusion-middleware/osa/19.1/using/configuring-runtime-environment.html#GUID-EB33DDFD-7444-434D-8944-059564A453FD).

## Acknowledgements
* **Author** - Pratibha Manjunath, Senior User Assistance Developer, GoldenGate Stream Analytics
* **Contributors** - Prabhu Thukaram, Rene Fontcha
* **Last Updated By/Date** - Rene Fontcha, LiveLabs Platform Lead, NA Technology, January 2022
