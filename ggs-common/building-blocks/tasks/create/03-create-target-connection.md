<!--
    {
        "name":"Create the target connection and unlock the GGADMIN user",
        "description":"Create the target connection and unlock the GGADMIN user"
    }
-->
Follow the steps below to connect the target Autonomous Data Warehouse \(ADW\) instance.

1.  Use the Oracle Cloud Console navigation menu to navigate back to **GoldenGate**.

2.  Click **Connections** and then **Create Connection**.

    ![Create Connection in GoldenGate menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/04-02-connections.png " ")

3.  The Create connection panel consists of two pages. On the General information page, for Name, enter **TargetADW** and optionally, a description.

4.  From the **Compartment** dropdown, select a compartment.

5.  From the a Type dropdown, select **Oracle Autonomous Database**.

6.  Click **Next**.

    ![Source Database details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/04-06-create-connec-general-info.png " ")

7. On the Connection details page, under Database details, select **Select database**.

8. For **Database in &lt;compartment-name&gt;**, select **TargetADW-&lt;numbers&gt;** from the dropdown. 

9. For Database username, enter `ggadmin`.

10. Enter the database's password in the Password field. Ensure that you record this password for later use.

11. For Traffic routing method, select **Shared endpoint**.

12. Click **Create**.

    ![Target Database details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/04-13-create-connec-details.png)

    The source and target databases appear in the list of Connections. The connection becomes Active after a few minutes.

13. Repeat the previous Task, Steps 1-6, to unlock the GGADMIN user for the TargetADW database.
