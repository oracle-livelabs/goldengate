<!--
    {
        "name":"Create the target connection and unlock the GGADMIN user",
        "description":"Create the target connection and unlock the GGADMIN user"
    }
-->
Follow the steps below to connect the target Autonomous AI Lakehouse \(ALK\) instance.

1.  Use the Oracle Cloud Console navigation menu to navigate back to **GoldenGate**.

2.  Click **Connections** and then **Create Connection**.

    ![Create Connection in GoldenGate menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/04-02-connections.png " ")

3.  The Create connection panel appears. For Name, enter **TargetALK** and optionally, a description.

4.  From the **Compartment** dropdown, select a compartment.

5.  From the a Type dropdown, select **Oracle Autonomous AI Database**.

    ![Source Database details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/04-06-create-connec-general-info.png " ")

6.  For Database details, select **Select database**.

7.  For **Database in compartment**, confirm the compartment selection, and then select **Target-&lt;numbers&gt;** from the dropdown. 

8.  For Database username, enter `ggadmin`.

9.  For **Database user password secret in compartment** select the compartment in which the password secret resides, and then select a Database user password secret from the dropdown.

    > **NOTE:** You use this password secret to unlock `GGADMIN` in a later task.

    ![Target Database details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/04-09-create-connec-details.png)

10. Click **Advanced options**, and then click **Network connectivity**. Under Traffic routing method, select **Shared endpoint**.

11. Click **Create**.

    ![Target Database details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-11-network-connect.png)

    The source and target databases appear in the list of Connections. The connection becomes Active after a few minutes.


