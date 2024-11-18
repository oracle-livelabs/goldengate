# Set up the environment

## Introduction

In this lab, you learn to create the required resources you'll use for Oracle Cloud Infrastructure (OCI) GoldenGate. You'll learn to create a VCN and subnet, provision an autonomous database instance, and load data into the database.

Estimated time: 20 mins

### Objectives

-  Learn to provision a VCN and subnet
-  Learn how to provision, connect, and load data into an Autonomous Transaction Processing (ATP) instance

### Prerequisites

To successfully complete this lab, you must:
* Have completed the Get Started lab and sign up for Free Tier/Log in to Oracle Cloud.
* For IAM-enabled tenancies, ensure that you [configure Identity domains for OCI GoldenGate](https://docs.oracle.com/en/cloud/paas/goldengate-service/mkmbs/#GUID-DD9C1BF8-69FE-4C9A-A2D1-74C73550ED65).
* For non-IAM enabled tenancies, ensure that you ensure that you first [set up your Vault](https://docs.oracle.com/en-us/iaas/Content/KeyManagement/Tasks/managingvaults_topic-To_create_a_new_vault.htm#createnewvault). [Learn more about Vault service](https://docs.oracle.com/en-us/iaas/Content/KeyManagement/Concepts/keyoverview.htm).

> **Notes:** 
* You may see differences in account details (eg: Compartment is different in different places) as you work through the labs. This is because the workshop was developed using different accounts over time.
* This workshop was designed to use Oracle Autonomous Database as the source. If you plan to use Oracle Database, ensure that you use the CDB user to capture data from the PDBs.

## Task 1: Create a VCN and subnet

[](include:01-create-vcn-subnet.md)

## Task 2: Create an ATP instance

[](include:02-create-atp-instance.md)

## Task 3: Load the ATP schema and enable supplemental logging

[](include:03-load-atp-schema.md)

## Task 4: Create a deployment for Autonomous Transaction Processing

1.  Open the **Navigation Menu**, navigate to **Oracle Database**, and select **GoldenGate**.

    ![GoldenGate in Oracle Cloud navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/database-goldengate.png " ")

2.  On the GoldenGate **Overview** page, click **Deployments**.

    ![GoldenGate Overview page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-02-ggs-overview.png " ")

3.  You may need to select a compartment. Under List Scope, from the Compartment dropdown, expand the root compartment, and then select the compartment associated with your username. For example, if your LiveLab username is LL1234-user, expand root, and then select the compartment **LL1234-COMPARTMENT**.

4.  On the Deployments page, click **Create Deployment**.

    ![Deployments page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-04-create-deployment.png "")

5.  In the Create Deployment panel, enter **ATPDeployment** for Name.

6.  From the Compartment dropdown, select a compartment.

7.  Select **Development or testing**. The OCPU count is autopopulated based on your selection.

8.  For Subnet, select a subnet. If you're using the workshop environment, select **&lt;USER&gt;-SUBNET-PUBLIC**.

    ![Completed Create GoldenGate Deployment fields](./images/01-09-create-atp-deployment-summary.png " ")

9.  For License type, select **Bring Your Own License (BYOL)**.

10.  Click **Show advanced options**, and then select **Enable GoldenGate console public access**.

11. For Load balancer subnet, select a subnet. If you're using the workshop environment, select **&lt;USER&gt;-SUBNET-PUBLIC**.

12. Click **Next**.

    ![Completed Create GoldenGate Deployment fields](./images/01-13-create-atp-deployment-summary.png " ")

13. For Choose a deployment type, select **Data replication**.

14. For Select a technology dropdown, select **Oracle Database**.

15. For GoldenGate Instance Name, enter **ggsinstance**.

16. In an IAM-enabled tenancy, select a Credential Store. 

    * If you select **OCI Identity and Access Management (OCI IAM)**, click **Create**, and then proceed to Task 5.
    * If you select GoldenGate, complete the following steps.

17. For Administrator Username, enter **oggadmin**.

18. For Password secret in &lt;USER&gt;-COMPARTMENT, click **Create password secret**.

    ![GoldenGate details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-16-create-deployment-gg-details.png " ")

19. In the Create secret panel, for Name, enter `LLsecret`.

20. For User password, enter a password 8 to 30 alphanumeric characters in length, containing at least 1 uppercase, 1 lowercase, 1 numeric, and 1 special character.

    > **NOTE**: The special characters must not be $, ^, or ?. 

    ![Create Password secret](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-21-passwordsecret.png " ")

21. Confirm the password, and then click **Create**.

22. Back in the Create deployment panel, for Password secret, ensure **LLsecret** is selected, and then click **Create**.

You're brought to the Deployment Details page. It takes a few minutes for the deployment to be created. Its status changes from CREATING to ACTIVE when it's ready for you to use. You can continue with Tasks 2, 3, 4 and 5 while you wait for the deployment creation to complete.

## Task 5: Create a deployment for Oracle Object Storage

1.  On the Deployments page, click **Create Deployment**.

2.  In the Create Deployment panel, enter **OBJDeployment** for Name.

3.  From the Compartment dropdown, select a compartment. 

4.  Select **Development or testing**. The OCPU count is autopopulated based on your selection.

5.  For Subnet, select a subnet. If you're using the workshop environment, select **&lt;USER&gt;-SUBNET-PRIVATE**.

    ![Completed Create GoldenGate Deployment fields](images/02-06-bigdata.png " ")

6. For License type, select **Bring Your Own License (BYOL)**.

7.  Click **Show advanced options**, and then select **Enable GoldenGate console public access**.

8. For Load balancer subnet, select a subnet. If you're using the workshop environment, select **&lt;USER&gt;-SUBNET-PUBLIC**.

9. Click **Next**.

    ![Completed Create GoldenGate Deployment fields](images/02-10-bigdata.png " ")

10. For Select a deployment type, select **Data replication**.

11. From the Select a technology dropdown, select **Big Data**.

12. In an IAM-enabled tenancy, select a Credential Store. 

    * If you select **OCI Identity and Access Management (OCI IAM)**, click **Create**, and then proceed to Task 3.
    * If you select GoldenGate, complete the following steps.

13. For GoldenGate instance name, enter **BDinstance**.

14. For Administrator username, enter **oggadmin**.

15. For Password secret, select **LLsecret**.

15. Click **Create**.

    ![Completed GoldenGate details](images/02-15-bigdata.png " ")

You're brought to the Deployment Details page. It takes a few minutes for the deployment to be created. Its status will change from CREATING to ACTIVE when it is ready for you to use.

**Proceed to the next lab.**

## Acknowledgements

- **Author** - Jenny Chan, Consulting User Assistance Developer
- **Last Updated by** - Katherine Wardhana, May 2024
- **PAR Expiration date** - February 2030
