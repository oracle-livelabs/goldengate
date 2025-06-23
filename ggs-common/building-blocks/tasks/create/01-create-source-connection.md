<!--
    {
        "name":"Create the source connection",
        "description":"Create the source connection"
    }
-->
1. Use the Oracle Cloud Console breadcrumb to navigate back to the Deployments page.

    ![GoldenGate in Oracle Cloud navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-02-breadcrumb-deployment.png " ")

2.  Click **Connections** and then click **Create Connection**.

    ![Connections page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-03-create-connection.png " ")

3.  The Create connection panel appears. For Name, enter **SourceATP** and optionally, a description.

4.  From the **Compartment** dropdown, select a compartment.

5.  From the a Type dropdown, select **Oracle Autonomous Database**.

6. For Database details, select **Select database**.

    ![Source Database details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-06-create-connection-general-info.png)

7.  Select a **Compartment** from the dropdown, and then select **SourceATP-&lt;numbers&gt;** from the dropdown. 

8.  For Database username, enter `ggadmin`.

9.  Select a **Compartment** from the dropdown, and then select a Database user password secret from the dropdown.

    > **NOTE:** This password will be used to unlock `GGADMIN` in a later task.

    ![Source Database details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-09-create-connection-gg-details.png)

10. Click **Advanced options**, and then click **Network connectivity**. Under Traffice routing method, select **Shared endpoint**.

11. Click **Create**.

    ![Source Database details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-11-network-connect.png)

    The connection becomes Active after a few minutes. You can proceed with the next task while service creates the connection.