# Replicate data from East to West

## Introduction

Now that replication is established and verified from the source database to the target database, you can set up bidirectional replication from the target to the source. This lab walks you through the steps create and run an Extract on the target, and create and run a Replicat on the source in the Oracle Cloud Infrastructure (OCI) GoldenGate Deployment Console.

Estimated time: 20 minutes

### About Extracts, Distribution Paths, and Target Initiated Paths 

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

4. For Process Name, enter **EEAST** and optionally, a description.

5. Click **Next**.

    ![Extract Information page](./images/01-05-extract-info.png " ")

6. On the Extract Options page, under Source Credentials, for Domain, select **OracleGoldenGate** from the dropdown.

7. For Alias, select **EAST** from the dropdown.

8. Under Extract Trail, for Name, enter **ee**.

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

14. In the EEAST **Action** menu, select **Start**. In the Confirm Action dialog, click **OK**. 

    ![Start Extract](./images/01-14-start-extract.png " ")

## Task 2: Create a Distribution Path to West Deployment

1. On the top navigation menu, click **Distribution Service**. 

    ![Distribution Service](./images/02-01-dist-service.png " ")

2. Click **Add Distribution Path**. 

    ![Click Add Distribution Path](./images/02-02-add-dist-path.png " ")

3. The Add Path panel consists of seven pages. On the Path Information page, for Name, enter **DPEAST**. 

4. Click **Next**.

    ![Path Information page](./images/02-04-path-info.png " ")

5. On the Source Options page, for Source Extract, select **EEAST** from the dropdown.

6. For Trail Name, **ee** should automatically populate the field.

7. For Generated Source URI, keep as is.

8. Click **Next**.

    ![Source Options page](./images/02-08-source-options.png " ")

9. On the Target Options page, for Target Host, paste the **ogg-west-public\_ip** value from the Reservation Information. 

10. For Port Number, enter **9014**.

11. For Trail Name, enter **de**.

12. For Alias, enter **oggnet\_alias**.

13. Click **Next**.

    ![Target Options page](./images/02-13-target-options.png " ")
    
14. On the Advanced Options page, leave the fields as is, and click **Next**.

    ![Advanced Options page](./images/02-14-adv-options.png " ")

15. On the Filtering Options page, leave the fields as is, and click **Next**.

    ![Filtering Options page](./images/02-15-filtering-options.png " ")

16. On the Managed Options page, leave the fields as is, and click **Create Path**.

    ![Managed Options page](./images/02-16-managed-options.png " ")

    You return to the Distribution Service page.

17. On the left hand navigation menu, click **Distribution Paths**.

18. In the DPEAST **Action** menu, select **Start**. In the Confirm Action dialog, click **OK**.

    ![Start Distribution Path](./images/02-18-start-dist-path.png " ")

## Task 3: Create Target Initiated Path from East Deployment 

1. On the top navigation menu, click **Receiver Service**. 

    ![Receiver Service](./images/03-01-rec-service.png " ")

2. Click **Add Target-Initiated Path**. 

    ![Click Add Target-Initiated Path](./images/03-02-add-target-path.png " ")

3. The Add Path panel consists of seven pages. On the Path Information page, for Name, enter **TPEAST**.

    ![Path Information page](./images/03-03-path-info.png " ")

4. On the Source Options page, for Source Host, paste the **ogg-east-public_ip** value from the Reservation Information. 

5. For Port Number, enter **9014**.

6. For Trail Name, enter **de**.

7. For For Alias, enter **oggnet_alias**.

8. Click **Next**.

    ![Source Options page](./images/03-08-source-opts.png " ")

9. On the Target Options page, for Target Options, for Trail Name, enter **ee**.

10. Click **Next**.

    ![Target Options page](./images/03-10-target-opts.png " ")

11. On the Advanced Options page, leave the fields as is, and click **Next**.

    ![Advanced Options page](./images/03-11-adv-opts.png " ")

12. On the Filtering Options page, leave the fields as is, and click **Next**.

    ![Filtering Options page](./images/03-12-filt-opts.png " ")

13. On the Managed Options page, leave the fields as is, and click **Create Path**.

    ![Managed Options page](./images/03-13-managed-opts.png " ")

14. On the left hand navigation menu, click **Target-Initiated Paths**.

15. In the TPEAST **Action** menu, select **Start**. In the Confirm Action dialog, click **OK**. 

    ![Start Target-Initiated Path](./images/03-15-start-ti-path.png " ")

You may now **proceed to the next lab.**

## Learn more

* [Managing deployments](https://docs.oracle.com/en/cloud/paas/goldengate-service/ebbpf/index.html)
* [Managing connections](https://docs.oracle.com/en/cloud/paas/goldengate-service/mcjzr/index.html)

## Acknowledgements
* **Author** - Katherine Wardhana, User Assistance Developer
* **Contributors** -  Alex Lima Gray, Database Product Management
* **Last Updated By/Date** - Katherine Wardhana, July 2024