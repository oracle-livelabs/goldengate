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

3.  The Create connection panel consists of two pages. On the General information page, for Name, enter **SourceATP** and optionally, a description.

4.  From the Compartment dropdown, select **&lt;USER&gt;-COMPARTMENT**.

5.  From the a Type dropdown, select **Oracle Autonomous Database**.

6.  Click **Next**.

    ![Source Database details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-06-create-connection-general-info.png)

7. On the Connection details page, under Database details, select **Select database**.

8.  For **Database in &lt;compartment-name&gt;**, select **SourceATP-&lt;numbers&gt;** from the dropdown. 

9.  For Database username, enter `ggadmin`.

10.  Enter the database's password in the Password field. Take note of the password.

    > **NOTE:** This password will be used to unlock `GGADMIN` in a later task.

11. For Traffic routing method, select **Shared endpoint**.

12. Click **Create**.

    ![Source Database details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-13-create-connection-gg-details.png)

    The connection becomes Active after a few minutes. You can proceed with the next task while service creates the connection.