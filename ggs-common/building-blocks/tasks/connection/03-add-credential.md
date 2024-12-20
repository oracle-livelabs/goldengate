<!--
    {
        "name":"Add a Credential for Oracle GoldenGate to Connect to OCI GoldenGate",
        "description":"Add a Credential for Oracle GoldenGate to Connect to OCI GoldenGate"
    }
-->

1.  Launch the OCI GoldenGate Deployment Console, and then use the Navigation menu (hamburger icon) to open the Administration Server's **User Administration** page. 

    ![Click Administrator in the OCI Goldengate deployment console navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/connection/images/03-01-user-admin.png " ")

2.  Click **Add User** and create a user account that Oracle GoldenGate will use to connect to OCI GoldenGate. Enter the following values:

    * For **Autheticated By**, select **Password** from the dropdown.
    * For **Role**, select **Operator** from the dropdown.
    * For **Username**, enter **ggsnet**.
    * For **Password** and **Verify Password**, enter a password.

    ![Click Add User](https://oracle-livelabs.github.io/goldengate/ggs-common/connection/images/03-02a-add-user.png " ")

    ![Add a ggsnet user with the Operator role](https://oracle-livelabs.github.io/goldengate/ggs-common/connection/images/03-02b-create-new-user.png " ")

3.  Back in the Oracle GoldenGate Marketplace Administration Server, use the Navigation menu to open the **DB Connections** screen.

4. Click **Add DB Connection** (plus icon).

    ![DB Connection page](https://oracle-livelabs.github.io/goldengate/ggs-common/connection/images/03-04-add-db.png " ")

5.  A Credentials panel will appear, complete the following fields, and then click **Submit**:
    * For **Credential Alias**,  enter a name, such as **ggs2ogg**.
    * For **User ID**, enter the user name of the user you created in step 2 (ggsnet).
    * For **Password** and **Verify Password**, enter the password from step 2.

    ![Add a Credential for ggsnet](https://oracle-livelabs.github.io/goldengate/ggs-common/connection/images/03-05a-credentials.png " ")

    You should now have two credentials in the Marketplace Oracle GoldenGate instance, one to connect to OCI GoldenGate, and one for the target database.

    ![The Credentials page displays the new credential](https://oracle-livelabs.github.io/goldengate/ggs-common/connection/images/03-05b-credentials-list.png " ")
