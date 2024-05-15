# Create a trusted connection between Oracle GoldenGate and OCI GoldenGate

## Introduction

This lab walks you through the steps to download the root certificate from Oracle Cloud Infrastructure (OCI) and add it to the Oracle GoldenGate Service Manager. Adding the Oracle Cloud Infrastructure root certificate to Oracle GoldenGate creates a trusted TLS connection between OCI GoldenGate and Oracle GoldenGate.

Estimated time: 10 minutes

### Objectives

In this lab, you will:

* Download the root certificate for Oracle Cloud Infrastructure from your web browser to your local machine
* Add the certificate to Oracle GoldenGate's Administration Server
* Create a credential on Oracle GoldenGate to connect to OCI GoldenGate

### Prerequisites

To successfully complete this lab, you must have:

* An on premises or Marketplace Oracle GoldenGate instance running
* The URL and log in credentials for the Oracle GoldenGate Service Manager
* The log in credentials for the OCI GoldenGate Deployment Console

## Task 1A: Use Chrome to download the root certificate

> **Note:** Mac users should follow Task 1B and use FireFox to download the root certificate.

1.  Launch the OCI GoldenGate Deployment Console if you don't already have it open, and log in.

2.  In your Chrome browser address bar, click the padlock icon, and then click **Connection is secure**.

    ![Select Connection is secure from View site information menu in Chrome browser](./images/01a-02-certificate.png " ")

3.  Click **Certificate is valid**.

    ![Select Certificate is valid from Connection is secure submenu in Chrome browser](./images/01a-03-certificate.png " ")

4.  In the Certificate window, click **Certification Path**, select **DigiCert Global Root G2**, and then click **View Certificate**.

    ![Select DigiCert Global Root G2, then click View Certificate in Certification Path tab of Certificate dialog window](./images/01a-04a-certificate-window.png " ")

    Another Certificate window opens, displaying the details for the root DigiCert certificate.

    ![Root DigiCert certificate details pop-up](./images/01a-04b-digicert.png " ")

5.  Click **Details**, and then click **Copy to File**.

    ![Click Copy to File](./images/01a-05-copy-file.png " ")

6.  In the Certificate Export Wizard, click **Next**.

7.  Select **Base-64 encoded X.509 (.CER)**, and then click **Next**.

    ![Certificate Export Wizard pop-up](./images/01a-07-cert-export.png " ")

8.  Click **Browse** to select a location on your local machine to save the root certificate, and then enter a file name, such as **DigiCert-Root.cer**, and click **Save**.

9.  Click **Next**, and then click **Finish**.

A Certificate Export Wizard dialog displays **The export was successful**. You can close the Certificate windows.

## Task 1B: Using FireFox to Download the Root Certificate

The following instructions show you how to download the Root Certificate using a FireFox web browser.

1.  Launch the OCI GoldenGate Deployment Console if you don't already have it open, and log in.

2.  In your FireFox browser address bar, click the padlock icon, and then next to Connection Secure, click **Show connection details** (right arrow icon).

    ![Click Show connection details in Site information menu](./images/01b-02-certificate.png " ")

3.  In the **Connection Security** dialog, click **More information**.

    ![Click More information in Connection Security menu](./images/01b-03-security-more-info.png " ")

4.  In the **Page info** window, click **View Certificate**.

    ![Click View Certificate in Page Info dialog window](./images/01b-04-security-certificate.png " ")

5.  On the **Certificate** page, click **DigiCert Global Root CA**.

    ![Click DigiCert Global Root G2](./images/01b-05-certificate.png " ")

6.  Under the **Miscellaneous** section, for Download, click **PEM (cert)**, and save the PEM file to your local drive.

    ![Click PEM (cert) next to Download under the Miscellaneous section of the DigiCert Global Root G2 page](./images/01b-06-certificate.png " ")

## Task 2: Upload the certificate to the Oracle GoldenGate Marketplace Service Manager

1.  In the Oracle GoldenGate Marketplace Service Manager, open the navigation menu (hamburger icon), and then click **Certificate Management**.

    ![Select Certificate Management from Oracle GoldenGate Service Manager navigation menu](./images/02-01-certmgmt.png " ")

2.  On the Certificate Management page, click **Add CA Certificates** (plus icon).

    ![Click Add CA Certificates on Certificate Management page](./images/02-02-addcert.png " ")

3.  In the Add CA Certificate dialog, enter a **Unique Name**.

    ![Enter a unique name in the Add CA Certificate dialog window](./images/02-03-addcertdialog.png " ")

4.  For **Certificate PEM**, if you downloaded the root certificate from Chrome, open it in a text editor, and then copy and paste the key into the **Enter** text area.

    ![Example of entering a certificate into the Add CA Certificate dialog window](./images/02-04-entercert.png " ")

5.  If you downloaded the root certificate from FireFox, click **Upload**, and then click **Browse**. Locate and select the PEM file on your local machine, and then click **Upload**.

    ![Example of uploading a certificate into the Add CA Certificate dialog window](./images/02-05-uploadcert.png " ")

6.  Click **Add**.  The certificate now appears in the Shared list.

    ![New shared certificate added under CA Certificates](./images/02-06-certlist.png " ")

## Task 3: Add a Credential for Oracle GoldenGate to Connect to OCI GoldenGate

1.  Launch the OCI GoldenGate Deployment Console, and then use the Navigation menu (hamburger icon) to open the Administration Server's **Administrator** page.

    ![Click Administrator in the OCI Goldengate deployment console navigation menu](./images/03-01-administrator.png " ")

2.  Click **Add User** and create a user account that Oracle GoldenGate will use to connect to OCI GoldenGate. Enter the following values:

    * For Name, enter **ggsnet**.
    * For Role, select **Operator**.
    * For Password and Verify Password, enter a password.

    ![Click Add User](./images/03-02a-users.png " ")

    ![Add a ggsnet user with the Operator role](./images/03-02b-users-submit.png " ")

3.  Back in the Oracle GoldenGate Marketplace Administration Server, use the Navigation menu to open the **Configuration** screen.

4.  Under the Database tab, click **Add Credential**, and then complete the following fields:

    * For **Credential Domain**, enter a name to distinguish this connection, such as **GGSNetwork**.
    * For **Credential Alias**,  enter a name, such as **ggs2ogg**.
    * For **User ID**, enter the user name of the user you created in step 2 (ggsnet).
    * For **Password**, enter the password from step 2.
    * For **Verify Password**, re-enter the password for verification purposes.

    ![Add a Credential for ggsnet](./images/03-04-add-credentials.png " ")

5.  Click **Submit**. You should now have two credentials in the Marketplace Oracle GoldenGate instance, one to connect to OCI GoldenGate, and one for the target database.

    ![The Credentials page displays the new credential](./images/03-05-credentials.png " ")

In this lab, you created a trusted connection between Oracle GoldenGate and OCI GoldenGate using a self-signed certificate. You may now **proceed to the next lab**.

## Acknowledgements
* **Author** - Jenny Chan, Consulting User Assistance Developer, Database User Assistance
* **Contributors** -  Werner He and Julien Testut, Database Product Management; Katherine Wardhana, User Assistance Developer
* **Last Updated By/Date** - Katherine Wardhana, May 2024
