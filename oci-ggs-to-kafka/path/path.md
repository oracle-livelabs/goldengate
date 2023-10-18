# Create and run the Distribution Path

## Introduction

This lab walks you through the steps to create a distribution path from source OCI GoldenGate Deployment to OCI GoldenGate for Big Data Deployment. 

Estimated time: 10 minutes

### About Distribution Paths

A Distribution Path is a source-to-destination configuration that uses the Distribution Service to send data in a distributed environment.

### Objectives

In this lab, you will:
* Add a deployment user that the distribution path uses to connect to the OCI GoldenGate for Big Data deployment
* Add and run the Distribution Path

### Prerequisites

This lab assumes that you completed all preceding labs.

## Task 1: Add a deployment user on the target deployment
1. Launch the Big Data deployment and log in.
2. In the target OCI GoldenGate for Big Data deployment (OCIGGBigData), open the navigation menu, and then click Administrator.
3. On the Users page, click **Add User** (plus icon).

    ![Add a New user](images/add-new-user.png " ")

4. For **Username**, enter  ***DistUser***.
5. For **Role**, select ***Operator***.
6. For **Type**, select ***Password***.
7. For **Password** and **verify Password**, enter a password for the DistUser.
8. Click Submit. 

    ![Add a New user submit](images/add-new-user-submit.png " ")

## Task 2: Add a Credential to the source deployment

1. In the source OCI GoldenGate deployment (ggsource), open the navigation menu, and then click **Configuration**.
2. On the Credentials page, click **Add Credential** (plus icon)."
3. For **Credential Domain**, enter ***Distribution***.
3. For **Credential Alias**, enter ***ociggbd***.
4. For **User ID**, enter ***DistUser***
5. For **Password** and **Verify Password**, enter the DistUser password from Task 1, Step 7.
6. click ***submit***
    ![Add a New user submit](images/distribution-credential-add-at-source.png " ")


## Task 3: Add a Distribution Path
1. In the source OCI GoldenGate deployment (ggsource), click **Distribution Service**.
2. On the Paths page, click **Add Path** (plus icon).
    ![Add a New Path](images/add-path-home.png " ")
3. On the Add Path page, for **Name**, enter ***Dist_Path***.
4. For **Source**, select ***EXTATP***.
5. For **Trail Name**, enter ***E1***.
6. For **Target Authentication Method**, select ***UserID Alias***.
7. For **Target**, select ***WSS*** from the dropdown.
8. For **Target Host**, enter the OCI GoldenGate for Big Data hostname in the following format: **<domain>.deployment.goldengate.us-<region>-1.oci.oraclecloud.com**.

_**NOTE:**: You can also copy this from the OCI GoldenGate for Big Data deployment console url from your browser address bar. Ensure that it is the target Big Data deployment console you're copying from, and remove the https://._
9. For **Port Number**, enter ***443***.
10. For **Trail Name**, enter ***RT***.
12. For **Domain**, enter the domain created in **Task 2, Step 2**. For example, ***Distribution***
13. For **UserID**, enter the User ID created in **Task 2, Step 4**. For example, ***ociggbd*** 
    ![Provide all the info to create a path](images/distribution-path-useridalias.png " ")
14.	Click **Create & Run**.  You return to the Paths page. If successful, the Distribution Path changes from a yellow exclamation point to a green checkmark.
    ![Click on Create and Run button](images/distribution-path-submit.png " ")
    ![GoldenGate Deployment Console](images/path-status.png " ")
15.	This Distribution Path also creates a Receiver Path in the target deployment. In the OCI GoldenGate for Big Data deployment console, click **Receiver Service**. You should see Dist_Path on the Paths page. 
    ![GoldenGate Deployment Console](images/recv-status.png " ")

In this lab, you created a distribution path from source OCI GoldenGate Deployment to OCI GoldenGate for Big Data Deployment.

You may now **proceed to the next lab**.

## Learn More

* [Managing deployments](https://docs.oracle.com/en/cloud/paas/goldengate-service/using/deployments.html)

## Acknowledgements
* **Author** - Madhu Kumar S, Senior Solution Engineer, AppDev and Integration
* **Contributors** -  Denis Sendil, Database Product Management; Jenny Chan, Consulting User Assistance Developer, Database User Assistance
* **Last Updated By/Date** - Madhu Kumar S, Senior Solution Engineer, AppDev and Integration