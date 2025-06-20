<!--
    {
        "name":"Create the ADW instance",
        "description":"Create the ADW instance"
    }
-->
1.  Open the **Navigation Menu**, navigate to **Oracle Database**, and select **Autonomous Database**.

	![Autonomous Data Warehouse in Oracle Cloud navigation menu](https://oracle-livelabs.github.io/common/images/console/database-adw.png " ")

2.  Click **Create Autonomous Database**.

    ![Autonomous Database page](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/04-02-create-adw.png " ")

3. The Create Autonomous Database Serverless panel appears. Enter **TargetADW** for **Display Name** and **Database Name**, and for **Compartment**, select a compartment from the dropdown. (Note that yours will be different - do not select **ManagedCompartmentforPaaS**)

4. Under **Workload type**, select **Data Warehouse**.

    ![Create Autonomous Database page](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/04-03-compartment.png " ")

5.  Under Administrator credentials creation, enter a password. Confirm your password. Take note of the password, you will need it later in this lab.

6. Under **Access type**, select **Secure access from everywhere**.

7. Select **Require mutual TLS (mTLS) authentication**.

8. Click **Create**.

    ![Password field](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/02-07-pw.png " ")