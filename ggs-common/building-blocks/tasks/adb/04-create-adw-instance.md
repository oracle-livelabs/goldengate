<!--
    {
        "name":"Create the ADW instance",
        "description":"Create the ADW instance"
    }
-->
1.  Open the **Navigation Menu**, navigate to **Oracle Database**, and select **Autonomous Data Warehouse**.

	![Autonomous Data Warehouse in Oracle Cloud navigation menu](https://oracle-livelabs.github.io/common/images/console/database-adw.png " ")

2.  Click **Create Autonomous Database**.

    ![Autonomous Database page](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/04-02-create-adw.png " ")

3. Select **Compartment** by clicking on the drop-down list. (Note that yours will be different - do not select **ManagedCompartmentforPaaS**) and then enter **TargetADW** for **Display Name** and **Database Name**.

    ![Create Autonomous Database page](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/04-03-compartment.png " ")

4.  Under **Choose a workload type**, select **Data Warehouse**.

5.  Under **Choose a deployment type**, select **Serverless**.

    ![Deployment type options](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/04-05-deployment-dw.png " ")

6.  Under **Configure the database**, leave **Choose database version** and **Storage (TB)** and **OCPU Count** as they are.

7.  Add a password. Note the password down in a notepad, you will need it later.

    ![Password field](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/02-07-pw.png " ")

8. Under **Access type**, select **Secure access from everywhere**.

9.  Select **Require mutual TLS (mTLS) authentication**.

    ![Choose network access options](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/02-09-choose-network-access.png " ")

10.  For **Choose license and Oracle Database edition**, use the default selection.

    ![License type options](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/02-08-license.png " ")

11.  Click **Create Autonomous Database**. Once it finishes provisioning, you can click on the instance name to see details of it.