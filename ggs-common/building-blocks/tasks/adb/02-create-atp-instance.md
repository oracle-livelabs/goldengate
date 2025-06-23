<!--
    {
        "name":"Create an ATP instance",
        "description":"Create an ATP instance"
    }
-->
1.  Open the **Navigation Menu**, navigate to **Oracle Database**, and select **Autonomous Database**.

	![Autonomous Transaction Processing in Oracle Cloud navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/database-atp.png " ")

2.  On the **Autonomous Databases &lt;compartment-name&gt;** page, click **Create Autonomous Database**.

    ![Autonomous Database page](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/02-02-create-adb.png " ")

3. The Create Autonomous Database Serverless panel appears. Enter **SourceATP** for **Display Name** and **Database Name**, and for **Compartment**, select a compartment from the dropdown. (Note that yours will be different - do not select **ManagedCompartmentforPaaS**) 

4. Under **Workload type**, select **Transaction Processing**.

    ![Create Autonomous Database page](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/02-05-deployment.png " ")

5.  Under Administrator credentials creation, enter a password. Confirm your password. Take note of the password, you will need it later in this lab.

6. Under **Access type**, select **Secure access from everywhere**.

7. Select **Require mutual TLS (mTLS) authentication**.

8. Click **Create**.

    ![Password field](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/02-07-pw.png " ")