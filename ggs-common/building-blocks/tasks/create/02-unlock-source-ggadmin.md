<!--
    {
        "name":"Unlock the GGADMIN user and enable supplemental logging for the source database",
        "description":"Unlock the GGADMIN user and enable supplemental logging for the source database"
    }
-->
Oracle Autonomous AI Databases come with a GGADMIN user that is locked by default. The following steps guide you through how to unlock the GGADMIN user.

1.  On the SourceATP connection details page, under **Connection information**, select the **SourceATP** database name.

	![Select SourceATP database name on Connection details page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/02-01-selectATP.png " ")

2.  On the SourceATP Database Details page, click **Database actions**, and then select **Database Users** from the dropdown. If the Database actions menu takes too long to load, you can click **Database actions** directly, and then select **Database users** from the Database actions page.

    ![SourceATP Database Details page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-03-db-actions.png " ")

3.  If prompted, log in to Database actions as **admin**, using the ATP Admin Password using the ATP Admin Password.

    ![ATP Database actions log in](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-04-login.png " ")

4.  From the list of users, locate **GGADMIN**, and then click the ellipsis (three dots) icon and select **Edit**.

    ![Database users](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-05-ggadmin.png " ")

5.  In the Edit User panel, deselect **Account is Locked**, enter the password you gave the ggadmin user in the previous task and then click **Apply Changes**.

    > **Note:** If using the Sandbox lab environment, copy and paste the **ATP Admin Password** from the **Reservation Information** panel in your workshop instructions.

    ![Edit user](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-06-ggadmin-edit-user.png " ")

    Note that the user icon changes from a padlock to a checkmark.

6.  Open the Database actions navigation menu, and then under **Development**, select **SQL**.

    ![Open navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-07-sql.png " ")

    > **Note:**  (Optional) Close the SQL Help dialogs. 

7.  Enter the following into the Worksheet, and then click **Run Statement**.

    ```
    <copy>ALTER PLUGGABLE DATABASE ADD SUPPLEMENTAL LOG DATA;</copy>
    ```

    ![Script Output](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-08-sql-script-return.png " ")

8.  Replace the supplemental logging script with the following to check support mode, and then click **Run Statement**:

    ```
    <copy>
    select * from DBA_GOLDENGATE_SUPPORT_MODE where owner = 'SRC_OCIGGLL';
    </copy>
    ```

    The Script Output panel displays six tables whose Support_Mode is **FULL**.

    ![Script Output](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-09-sql-script-return.png " ")

    You can leave the SQL window open and continue with the next Task.