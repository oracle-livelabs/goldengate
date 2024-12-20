<!--
    {
        "name":"Upload the certificate to the Oracle GoldenGate Marketplace Service Manager",
        "description":"Upload the certificate to the Oracle GoldenGate Marketplace Service Manager"
    }
-->

1.  In the Oracle GoldenGate Marketplace Service Manager, open the navigation menu (hamburger icon), and then click **Certificate Management**.

    ![Select Certificate Management from Oracle GoldenGate Service Manager navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/connection/images/02-01-certmgmt.png " ")

2.  On the Certificate Management page, click **Add CA Certificates** (plus icon).

    ![Click Add CA Certificates on Certificate Management page](https://oracle-livelabs.github.io/goldengate/ggs-common/connection/images/02-02-addcert.png " ")

3.  In the Add CA Certificate dialog, enter a **Unique Name**.

4.  For **Certificate PEM**, if you downloaded the root certificate from Chrome, open it in a text editor, and then copy and paste the key into the **Enter** text area.

> **Note:** If you downloaded the root certificate from FireFox, click **Upload**, and then click **Browse**. Locate and select the PEM file on your local machine.

5.  For **Certification Location**, select **Shared**, and then click **Submit**.

    ![Example of uploading a certificate into the Add CA Certificate dialog window](https://oracle-livelabs.github.io/goldengate/ggs-common/connection/images/02-05-entercert.png " ")

    The certificate now appears in the Shared list.

    ![New shared certificate added under CA Certificates](https://oracle-livelabs.github.io/goldengate/ggs-common/connection/images/02-06-uploadcert.png " ")