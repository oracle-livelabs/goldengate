# Replicate data from West to East

## Introduction

In this lab, you learn to...

Estimated time: 20 minutes

### About Extracts, Distribution Paths, and Replicats 

An Extract is a process that extracts, or captures, data from a source database. 

### Objectives

In this lab, you will:
* Add and run an Extract
* Add and run a Distribution Path
* Add and run a Target Initiated Path

## Task 1:  Add and run an Extract

1. In the navigation menu, click **Extracts**.

    ![Click Extracts](./images/01-01-extracts.png " ")

2. Click **Add Extract**.

    ![Add Extracts](./images/01-02-add-extract.png " ")

3. The Add Extract panel consists of five pages. On the Extract information page, for Extract Type, select **Integrated Extract**.

4. For Process Name, enter **EWEST** and optionally, a description.

5. Click **Next**.

    ![Extract Information page](./images/01-05-extract-info.png " ")

6. On the Extract Options page, under Source Credentials, for Domain, select **OracleGoldenGate** from the dropdown.

7. For Alias, select **WEST** from the dropdown.

8. Under Extract Trail, for Name, enter **ew**.

9. Click **Next**.

    ![Extract Options page](./images/01-09-extract-options.png " ")

10. On the Managed Options page, for Profile Name, select **east-profile** from the dropdown.

11. Click **Next**.

    ![Managed Options page](./images/01-11-managed-options.png " ")

12. On the Parameter File page, in the text area, add a new line to the existing text and add the following:

    ```
    <copy>TRANLOGOPTIONS EXCLUDETAG 00
    DDL INCLUDE MAPPED
    table HR.*;</copy>
    ```

13. Click **Create**. 

    ![Parameter File page](./images/01-13-param-file.png " ")

    You return to the GoldenGate 23ai Microservices WebUI Home page.

14. In the EWEST **Action** menu, select **Start**. In the Confirm Action dialog, click **OK**. 

    ![Start Extract](./images/01-14-start-extract.png " ")

## Task 2: Create a Distribution Path to West Deployment

1. On the top navigation menu, click **Receiver Service**. 

    ![Distribution Service](./images/02-01-dist-service.png " ")

2. Click **Add Distribution Path**. 

    ![Click Add Distribution Path](./images/02-02-add-dist-path.png " ")

3. The Add Path panel consists of seven pages. On the Path Information page, for Name, enter **DPWEST**. 

4. Click **Next**.

    ![Path Information page](./images/02-04-path-info.png " ")

5. On the Source Options page, for Source Extract, select **EWEST** from the dropdown.

6. For Trail Name, select **ew** from the dropdown.

7. Click **Next**.

    ![Source Options page](./images/02-07-source-opts.png " ")

8. On the Target Options page, for Target Host, enter the **ogg-west-public\_ip** value from the Reservation Information. 

6. For Port Number, enter **9014**.**

7. For Trail Name, enter **dw**.

8. For Alias, enter **oggnet\_alias**.

9. Click **Next**.

    ![Source Options page](./images/02-09-target-options.png " ")

10. On the Advanced Options page, leave the fields as is, and click **Next**.

    ![Advanced Options page](./images/02-10-adv-options.png " ")

11. On the Filtering Options page, leave the fields as is, and click **Next**.

    ![Filtering Options page](./images/02-11-filtering-options.png " ")

12. On the Managed Options page, leave the fields as is, and click **Create Path**.

    ![Managed Options page](./images/02-12-managed-options.png " ")

13. On the left hand navigation menu, click **Distribution Paths**.

14. In the DPWEST **Action** menu, select **Start**. In the Confirm Action dialog, click **OK**.

    ![Start Distribution Path](./images/02-14-start-dp.png " ")

## Task 3: Create a Replicat to apply to the East target database

1. Open the navigation menu and then click **Replicats**.

    ![Administration Service navigation menu](./images/03-01-nav-config.png " ")

2. Click **Add Replicat**.

    ![Administration Service navigation menu](./images/03-02-add-rep.png " ")

3. The Add Replicat panel consists of four pages. On the Replicat information page, for Replicat Type, select **Parallel Replicat**.

4. For Parallel Replicat Type, select **Nonintegrated**.

5. For Process Name, enter **RWEST**.

6. Click **Next**.

    ![Replication Information page](./images/03-06-rep-info.png " ")

7. On the Replicat Options page, for Replicat Trail, enter **de**.

8. For Domain, select **OracleGoldenGate** from the dropdown.

9. For Alias, select **WEST** from the dropdown.

10. For Checkpoint Table, select **"OGGADMIN"."CHECKPOINTTABLE** from the dropdown.

11. Click **Next**.

    ![Replication Options page](./images/03-11-rep-options.png " ")

12. On the Managed Options page, for Profile Name, select **west-profile** from the dropdown.

13. Click **Next**.

    ![Managed Options page](./images/03-13-managed-options.png " ")

14. On the Parameter File page, in the text area, replace **MAP *.*, TARGET *.*;** with the following script:

    ```
    <copy>DDL INCLUDE MAPPED
    MAP HR.*, TARGET HR.*;</copy>
    ```
15. Click **Create**.

    ![Parameter File page](./images/03-15-param-file.png " ")

16. In the RWEST **Action** menu, select **Start**. In the Confirm Action dialog, click **OK**. 

    ![Start Replicat](./images/03-16-start-replicat.png " ")

You may now **proceed to the next lab.**

## Learn more

* [Add an Extract for Oracle Database](https://docs.oracle.com/en/cloud/paas/goldengate-service/eeske/index.html)

## Acknowledgements
* **Author** - Katherine Wardhana, User Assistance Developer
* **Contributors** -  Alex Lima Gray, Database Product Management
* **Last Updated By/Date** - Katherine Wardhana, July 2024
