<!--
    {
        "name":"Create a purge task",
        "description":"Create a purge task"
    }
-->
1.  In the OCI GoldenGate Deployment Console, open the navigation menu (hamburger icon), and then click **Configuration**.

    ![OCI GoldenGate Deployment Console navigation menu](../../../create/images/01-01-configuration.png " ")

2.  On the **Configuration** screen, click **Tasks**, and then click **Add Purge Trail Task** (plus icon). The **Create a new Purge Trails task** form appears.

    ![Create a new Purge Trails task on Tasks page](../../../create/images/01-02-add-purge-trails.png " ")

3.  For **Operation Name**, enter a name.

4.  For **Trail**, enter the name of a Trail file, and then click **Add** (plus icon). For example, in this workshop, our Extract Trail file is called `E1`.

    ![Trail field highlighted](../../../create/images/01-04-add-trail.png " ")

5.  For **Keep Rule**, select **Number of Files**, and then enter `1`. This indicates that one Trail file will be kept, while all others are purged.

6.  For **Purge Frequency**, select **Hours**, and then enter `1`. This indicates that this Purge task will run every hour.

    ![Keep Rule and Purge Frequency fields highlighted](../../../create/images/01-06-purge-trails-task.png " ")

7.  Click **Submit**.