# Create the Oracle Cloud Infrastructure GoldenGate pipeline

## Introduction

In this lab, you learn to create an Oracle Cloud Infrastructure (OCI) GoldenGate pipeline.

Estimated time: 20 minutes

### About Oracle Cloud Infrastructure GoldenGate pipelines

A Oracle Cloud Infrastructure GoldenGate pipeline lets you configure real time data replication flows that support mission critical use cases such as analytics, operational reporting, and hybrid cloud integrations. You can create a pipeline to stream data directly from operational databases to analytical environments without traditional extract, transform, load (ETL) processes. For example, you can set up a pipeline to directly replicate data from Autonomous Transaction Processing to Autonomous Data Warehouse with minimal configuration.

### Objectives

In this lab, you will:
* Create the pipeline
* Enable logging
* Start the pipeline

## Task 1: Create the pipeline

1. Click **Pipelines** and then click **Create pipeline**.

    ![Pipelines page](./images/01-01-create-pipeline.png)

2.  The Create ZeroETL Mirror pipeline panel appears. For Name, enter **test-pipeline** and optionally, a description.

3.  For Choose a license tyoe, select **Bring Your Own License (BYOL)**.

4.  For Source connection, select **SourceATP** from the dropdown.

5.  For Target connection, select **TargetADW** from the dropdown.

6. Click **Create pipeline**.

    ![Source Database details](./images/01-06-create-pipeline.png)

## Task 2: Add mapping rules

1. In the Pipelines page, select the pipeline.

2. On the Pipeline details page, click **Mapping Rules**.

2. On the pipeline details page, under the Resources menu, click **Mapping Rules**.

3. Click **Preview**.

    ![Pipeline details](./images/02-03-pipeline-details.png)

4. In the Preview mapping dialog, expand the **SRC_OCIGLL** source schema and review the list of schemas and tables that are going to be replicated. Select **Cancel** to close the dialog.

    ![Preview mapping](./images/02-04-preview-mapping.png)

## Task 3: Enable logging

1. On the pipeline details page, under the Resources menu, click **Logs**.

2. In the Logs list, click the three dots icon for your object, and then select **Enable log**.

    ![Enable log](./images/03-02-click-enable-log.png)

3. In the Enable log dialog, for Log name, enter **critical-group**.

4. From the Compartment dropdown, select **&lt;USER&gt;-COMPARTMENT**.

5. Select **Create new group**.

    ![Enable log](./images/03-05-enable-log.png)

6. In the Create log group dialog, for Name, enter **log-group**.

7. Click **Create**.

    ![Create log group](./images/03-07-creat-log-group.png)

8. For Log group, select **log-group** from the dropdown.

9. For Log retention, select the number of months from the dropdown.

10. Click **Enable log**.

    ![Enable critical event log](./images/03-10-enable-crit-ev-log-group.png)

    The critical event log appear in the list of Logs. The log becomes Active after a few minutes.

    ![Active critical event log](./images/03-11-active-crit-ev-log-group.png)

## Task 4: Start the pipeline

1. In the pipelines details page, expand the **Actions** menu, and then click **Start**.

    ![Start pipeline](./images/04-01-start-pipeline.png)

2. In the Start pipeline dialog, click **Start**.

    ![Start pipeline dialog](./images/04-02-start-pipeline-dialog.png)

3. On the pipeline's details page, select **Initialization**. The Initialization steps displays the current status of the pipeline steps. For each step, you can select **View details** from its **Actions** menu and review corresponding messages.

    ![Initialization](./images/04-03-initialization.png)


You may now **proceed to the next lab.**

## Learn more

* [About pipelines](https://docs.oracle.com/en/cloud/paas/goldengate-service/jppjs/)
* [Create pipeline resources](https://docs.oracle.com/en/cloud/paas/goldengate-service/crylk/)

## Acknowledgements
* **Author** - Katherine Wardhana, User Assistance Developer, Database User Assistance
* **Contributors** -  Julien Testut, Database Product Management
* **Last Updated By/Date** - Katherine Wardhana, June 2025