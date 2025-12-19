# Connect Oracle GoldenGate to Autonomous AI Lakehouse

## Introduction

For the purposes of this workshop, Oracle Autonomous AI Lakehouse (ALK) serves as the target database for your Oracle GoldenGate Marketplace deployment. This lab walks you through the steps to connect your Oracle GoldenGate Marketplace deployment to Autonomous AI Lakehouse.

Estimated time: 15 minutes

### Objectives

In this lab, you will:
* Download the Autonomous AI Lakehouse credentials
* Upload the Autonomous AI Lakehouse credentials to the Oracle GoldenGate Marketplace compute instance
* Add the Autonomous AI Lakehouse credentials in the Oracle GoldenGate Administration Server

### Prerequisites

* Follow the instructions for [Connecting to a Linux Instance ](https://docs.oracle.com/en-us/iaas/Content/Compute/Tasks/accessinginstance.htm#linux) to enter your private key for the Oracle GoldenGate Marketplace Compute instance.
* Open a text editor to paste values you need for later tasks.

## Task 1: Download the Target Autonomous AI Lakehouse Client Credentials

1.  On the **TargetALK** database details page, click **Database connection**.

    ![Target Autonomous AI Lakehouse Details page](./images/01-02-db-connection.png " ")

3.  In the Database connection panel, click **Download Wallet**.

    ![Database Connection page](./images/01-03-download-wallet.png " ")

4.  In the Download Wallet dialog, enter the Target Autonomous AI Lakehouse Admin password twice, and then click **Download**.

    <if type="livelabs">
    >**NOTE**: If running this lab in a LiveLab Sandbox environment, you can find the Admin password in View Login Info under OCI GoldenGate Admin Password.
    </if>

    ![Download Wallet page](./images/01-04-download-wallet.png " ")

5.  Save the wallet zip to your local machine.

6.  Click **Cancel** to close the Database connection panel.

## Task 2: Upload the Target Autonomous AI Lakehouse Credentials to Oracle GoldenGate

1.  In the Oracle Cloud Console, open the navigation menu (hamburger icon), click **Compute**, and then click **Instances**.

    ![Instances in Oracle Cloud navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/oggmp-atp/images/02-01-compute.png " ")

2.  In the Oracle Cloud Console global header, click **Developer tools**, and then **Cloud Shell**. The Cloud Shell drawer opens at the bottom of your screen.

    >**NOTE**: Cloud Shell takes a few moments to connect the first time it's opened during a session. When prompted, enter N to exit the Cloud Shell tutorial.

    ![Instances page](https://oracle-livelabs.github.io/goldengate/ggs-common/oggmp-atp/images/02-03-cloud-shell.png " ")

3.  From the Cloud Shell menu (gear icon) select **Upload**.

    ![Cloud Shell drawer menu](./images/02-04-cs-upload.png " ")

4.  In the File Upload to your Home Directory dialog, drag and drop or select the TargetALK wallet file you downloaded in Task 1, and then click **Upload**.

    ![Upload a file on Cloud Shell](./images/02-05-upload.png " ")

5.  Repeat step 5 to upload your SSH private key. Click **Hide** to close the File Transfers dialog.

    ![Files uploaded on Cloud Shell](./images/02-06-hide.png " ")

    <if type="livelabs">
    >**Note:** Ensure the private key you upload here is the match of the public key you provided when you reserved this lab.
    </if>

6.  To ensure the SSH key permissions are valid, enter the following command in Cloud Shell: (Remember to replace the `<private-SSH-key>` placeholder with the name of your private key.)

    ```
    <copy>chmod 600 <private-SSH-key></copy>
    ```

7.  On the Instances <compartment-name> page, copy the compute instance's **Public IP Address**.

    ![Public IP Address on the Instance Details](./images/02-08-public-ip.png " ")

8.  In Cloud Shell, enter the following to connect to the Marketplace Oracle GoldenGate compute instance: (Remember to replace the placeholders with their actual values.)

    ```
    <copy>sftp -i <private-SSH-key> opc@<ip-address></copy>
    ```

    <if type="livelabs">
    > **Note:** If you get a *Permission Denied* error, double check that the private SSH key matches the public SSH key.
    </if>

9.  Enter the following `put` command to upload wallet\_ALK.zip to `/home/opc`.

    ```
    <copy>put Wallet_ALK.zip</copy>
    ```

10. Enter `exit` to close the sftp connection.

    ![Cloud Shell script](./images/02-11-cloud-shell.png " ")

11. SSH to the compute instance.

    ```
    <copy>ssh -i <private-SSH-key> opc@<ip-address></copy>
    ```

12. Use the list command (`ls`) to list the contents in the current directory. You should your wallet file.

13. Make a new directory called **wallet\_ALK**, and then extract the contents of the wallet\_ALK.zip to a new directory.

    ```
    <copy>mkdir wallet_ALK
unzip Wallet_ALK.zip -d wallet_ALK</copy>
    ```

14. Change directories to wallet_ALK.

    ```
    <copy>cd wallet_ALK</copy>
    ```

15. Enter `pwd`, and then copy the full path to the wallet files to be used in a later Task.

    ![Cloud Shell script](./images/02-16-cloud-shell.png " ")

16. Change directories back to the Home directory.

    ```
    <copy>cd ..</copy>
    ```

> **Note:** Leave Cloud Shell open.

## Task 3: Add the Target Autonomous AI Lakehouse Credential in the Oracle GoldenGate Administration Server

1. On the deployment details page, click **Launch Console**.

    ![Launch Console](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/07-01-launchconsole.png " ") 

2. To log in to the GoldenGate deployment console, enter **oggadmin** for User name, enter the password, and then click **Sign In**. 

    ![GoldenGate deployment console sign in](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/02-02-oggadmin-23ai.png " ")

    > **NOTE:** If using the LiveLab Sandbox environment, copy the OCI GoldenGate Admin Password from the Terraform output section of **View Login Info**.

    ![View Login info](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/02-02a-view-login-info.png " ")

    ![Terraform values](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/02-02b-terraform-values.png " ")

After you log in successfully, you're brought to the GoldenGate deployment console home page. Here, you can access the GoldenGate Administration, Performance Metrics, Distribution, and Receiver Services, as well as add Extracts and Replicats for your data replication tasks.

3.  In the OCI GoldenGate deployment console navigation menu select **DB Connections**.

    ![Click Configuration in the OCI GoldenGate deployment console navigation menu](./images/04-02-configuration.png " ")

4.  Copy the TargetALK connection string in the User ID column, and then paste it into a text editor.

    ![Copy the target database's connection string and paste it into a text editor](./images/04-03-configuration-targetadw.png " ")

5.  Edit the TargetALK connection string, replacing the value for **MY\_WALLET\_DIRECTORY** with the location where you unzipped the wallet_ALK.zip. For example, **/home/opc/wallet\_ALK**.

    ![Replace the existing value for MY_WALLET_DIRECTORY with the path to the wallet files](./images/04-04-wallet-zip.png " ")

6.  In a new browser tab or window, use the compute instance's Public IP and port 443 (**https://&lt;public-ip&gt;:443**) to open the Service Manager.

7.  Log in to the Service Manager using the **oggadmin** credentials found in **/home/opc/ogg-credentials.json**.

8. In the Service Manager console, under Deployment, click **Marketplace**.

    ![Service Manager console](https://oracle-livelabs.github.io/goldengate/ggs-common/oggmp-atp/images/04-06-service-mngr.png " ")

9. Under Marketplace, click **Administration Server**. The Administration Server opens in a new browser tab. If you're prompted to log in again, use the same oggadmin credentials.

    ![Marketplace page on the Service Manager](https://oracle-livelabs.github.io/goldengate/ggs-common/oggmp-atp/images/04-07-marketplace.png " ")

10.  In the Administration Server, open the navigation menu (hamburger icon), and then select **DB Connections**.

    ![Click DB Connections in the Administration Server's navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/oggmp-atp/images/03-06.png " ")

11.  Click **Add DB Connection**.

    ![Click Add Path Connection](https://oracle-livelabs.github.io/goldengate/ggs-common/oggmp-atp/images/03-09.png " ")

12. Enter the following information, and then click **Submit**:

    * For **Credential Domain**, enter **OracleGoldenGate**.
    * For **Credential Alias**, enter **TargetALK**.
    * For **User ID**, paste the Autonomous AI Lakehouse connection string from step 5.
    * For **Password**, enter the ggadmin password provided when you created the TargetALK connection.

    ![Add a credential for atp_low](./images/04-11-submit-credential.png " ")

13. To test the connection, click **Connect to database**. Your connection credentials are correct if you see Checkpoint and TRANDATA options appear. If incorrect, you should check the connection string and ggadmin password.

In this lab, you created a connection from the Oracle GoldenGate Marketplace instance to the target Autonomous AI Lakehouse database. You may now **proceed to the next lab**.

## Acknowledgements

* **Author** - Jenny Chan, Manager, Data Integration & Essbase User Assistance
* **Contributors** -  Julien Testut, Database Product Management; Katherine Wardhana, User Assistance Developer
* **Last Updated By/Date** - Jenny Chan, December 2025
