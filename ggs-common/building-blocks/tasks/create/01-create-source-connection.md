<!--
    {
        "name":"Create the source connection",
        "description":"Create the source connection"
    }
-->
1. From the GoldenGate menu, select **Connections**.

    ![GoldenGate in Oracle Cloud navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-02-breadcrumb-deployment.png " ")

2.  On the Connections page, click **Create Connection**.

    ![Connections page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-03-create-connection.png " ")

3.  The Create connection panel appears. For Name, enter **SourceATP** and optionally, a description.

4.  From the **Compartment** dropdown, select a compartment.

5.  From the a Type dropdown, select **Oracle Autonomous AI Database**.

    ![Source Database details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-06-create-connection-general-info.png)

6.  For Database details, choose **Select database**.

7.  For **Database in Compartment** confirm the compartment selection, and then select **SourceATP-&lt;numbers&gt;** from the dropdown. 

8.  For Database username, enter `ggadmin`.

9.  For **Database user password in compartment**, select the compartment in which the user password resides, and then select the **LiveLab_Secret** from the dropdown.

    > **NOTE:** You use this password secret to unlock `GGADMIN` in a later task.

    ![Source Database details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-09-create-connection-gg-details.png)

10. Click **Advanced options**, and then click **Network connectivity**. Under Traffic routing method, select **Shared endpoint**.

11. Click **Create**.

    ![Source Database details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-11-network-connect.png)

    The connection becomes Active after a few minutes. You can proceed with the next task while service creates the connection.