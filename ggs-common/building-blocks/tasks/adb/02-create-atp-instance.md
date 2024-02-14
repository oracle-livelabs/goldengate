<!--
    {
        "name":"Create an ATP instance",
        "description":"Create an ATP instance"
    }
-->
1.  Open the **Navigation Menu**, navigate to **Oracle Database**, and select **Autonomous Transaction Processing**.

	![Autonomous Transaction Processing in Oracle Cloud navigation menu](../../../adb/images/database-atp.png " ")

2.  On the **Autonomous Database &lt;compartment-name&gt;** page, click **Create Autonomous Database**.

    ![Autonomous Database page](../../../adb/images/02-02-create-adb.png " ")

3. For **Compartment** select a compartment from the dropdown. (Note that yours will be different - do not select **ManagedCompartmentforPaaS**) and then enter **ATPSource** for **Display Name** and **Database Name**.

    ![Create Autonomous Database page](../../../adb/images/02-03-compartment.png " ")

4.  Under **Choose a workload type**, select **Transaction Processing**.

5.  Under **Choose a deployment type**, select **Serverless**.

    ![Deployment type options](../../../adb/images/02-05-deployment.png " ")

6.  Under **Configure the database**, leave **Choose database version** and **Storage (TB)** and **OCPU Count** as they are.

7.  Add a password. Take note of the password, you will need it later in this lab.

    ![Password field](../../../adb/images/02-07-pw.png " ")

8. Under **Access type**, select **Secure access from everywhere**.

9.  Select **Require mutual TLS (mTLS) authentication**.

    ![Choose network access options](../../../adb/images/02-09-choose-network-access.png " ")

10.  For **Choose license and Oracle Database edition**, use the default selection.

    ![License type options](../../../adb/images/02-08-license.png " ")

11.  Click **Create Autonomous Database**. Once it finishes provisioning, you can click on the instance name to see details of it.