<!--
    {
        "name":"Create a purge task",
        "description":"Create a purge task"
    }
-->
1.  In the OCI GoldenGate deployment console service menu bar, select **Administration Service**, and then in the left navigation, select **Tasks**, and then **Purge Trail**.

    ![Admin service and Tasks](https://oracle-livelabs.github.io/goldengate/ggs-common/purge/images/01-01-admin-tasks.png " ")

2.  On the **Purge Trails Tasks** page, click **Add Purge Trail Task** (plus icon). The **Create a new Purge Trails task** panel appears.

    ![Create a new Purge Trails task on Tasks page](https://oracle-livelabs.github.io/goldengate/ggs-common/purge/images/01-02-add-purge-trails-23ai.png " ")

3.  In the Create a new Purge Trails task panel, enter a **Name**.

4.  For **Trail**, enter the name of a Trail file. For example, in this workshop, our Extract Trail file is called `E1`.

5.  For **Keep Rule**, select **Number of Files**, and then enter `1`. This indicates that one Trail file will be kept, while all others are purged.

6.  For **Purge Frequency**, select **Hours**, and then enter `1`. This indicates that this Purge task will run every hour.

    ![Keep Rule and Purge Frequency fields highlighted](https://oracle-livelabs.github.io/goldengate/ggs-common/purge/images/01-06-purge-trails-task-23ai.png " ")

7.  Click **Submit**. The Purge Trails Tasks page updates with your newly created task.