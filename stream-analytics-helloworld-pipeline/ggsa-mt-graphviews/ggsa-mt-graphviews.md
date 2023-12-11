
# Configure graphical views in the Stream Analytics pipeline

## Introduction

This lab walks you through steps to configure graphical views in a Stream Analytics pipeline, to visualize traffic conditions in a marked geograhical location.


*Estimated Time*: 15 minutes

### Objectives
In this Lab you will:
- Configure a Geo Spatial Visualization
- Configure a Bar Chart Visualization

### Prerequisites
You should have successfully completed all the previous labs.

## **Task 1:** Configure a Geo Spatial Visualization for Spatial Analytics of Vehicles in a marked geographical area
1. Click **Visualizations** tab of the **SpeedViolation** Business Rules page:
2. From the **Add a Visualization** drop-down list, select **Geo Spatial**.

![Geo Spatial Visualization Parameters](./images/add-vis.png "")

3. On the **Create Geo Spatial Visualization** page, on the **Properties** tab:
       1. In the **Name** field, enter **Driver Monitor**.
       2. In the **Description** field, enter **Spatial Analytics for Vehicles in the marked region in Atlanta**.
       3. From the **Lat** drop-down list, select **BUSlat**.
       4. From the **Long** drop-down list, select **BUSlong**.
       5. From the **Key** drop-down list, select **BUStripId**.

 ![Geo Spatial Visualization Parameters](./images/geospat.png "") 

4. On the **Customizations** tab, click **+** and specify the following values:
       1. Select **Violation**, from the **Field** drop-down list.
       2. Leave the **Operator** field blank.
       3. Enter **Reckless**, **Major**, or **Minor** in the **Value** field, for different violation types.
       4. Assign a marker color from the **Style** tab, to represent each violation type.
       5. Click **Create**.

    ![Geo Spatial Visualization Speed Violation Type](./images/geospatcust.png "")

The map is updated instantly as the new data arrives, displaying different driving behaviors.
    
![Geo Spatial Visualization](./images/custmap.png "")

## **Task 2:** Configure a Bar Chart Visualization to view Highway Activity 

1. Click **Visualizations** tab of the **SpeedViolation** Business Rules page:
2. From the **Add a Visualization** drop-down list, select **Bar**.
3. On the **Create Bar Visualization** page, on the **Properties** tab:

       1. In the **Name** field, enter **CongestionPoints**.
       2. In the **Description** field, enter **Provide a HWY view of activity**.
       3. From the **Y Axis Field Selection** drop-down list, select **AvgSpeed**.
       4. In the **Axis Label** field, enter **Speed KMH**.
       5. From the **X Axis Field Selection** drop-down list, select **Bus_Hwy**.
       6. In the **Axis Label** field, enter **HWY**.

    ![Create Bar Visualization](./images/barvis.png "")      

4. Click **Create**.
  
 The Bar chart displays the highways with the lower-than-average speeds that are currently experiencing traffic congestion.

    ![Bar Graph displaying Traffic Congestion](./images/barvis2.png "")

       You may now **proceed to the next lab**.

## Learn More

* [Transform and Analyze Data Streams](https://docs.oracle.com/en/middleware/fusion-middleware/osa/19.1/using/creating-pipeline-transform-and-analyze-data-streams.html#GUID-9DB9B57A-1095-4557-ACB9-816A696EB121)

* [Installing GoldenGate Stream Analytics](https://docs.oracle.com/en/middleware/fusion-middleware/osa/19.1/using/install-and-upgrade.html#GUID-A687DFF0-728A-4071-947A-F3E90ABF65F6).

* [GoldenGate Stream Analytics on Oracle Cloud Marketplace](https://docs.oracle.com/en/middleware/fusion-middleware/osa/19.1/osamp/getting-started-goldengate-stream-analytics-oci.html#GUID-B488861E-1C43-4177-A1F8-40F8E44754AD).

* [Mandatory RTE Configurations](https://docs.oracle.com/en/middleware/fusion-middleware/osa/19.1/using/configuring-runtime-environment.html#GUID-EB33DDFD-7444-434D-8944-059564A453FD).

## Acknowledgements
* **Author** - Pratibha Manjunath, Senior User Assistance Developer, GoldenGate Stream Analytics
* **Contributors** - Sumathi Nelapati
* **Last Updated By/Date** - Pratibha Manjunath, December 2023