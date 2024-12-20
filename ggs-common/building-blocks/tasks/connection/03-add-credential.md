<!--
    {
        "name":"Add a Credential for Oracle GoldenGate to Connect to OCI GoldenGate",
        "description":"Add a Credential for Oracle GoldenGate to Connect to OCI GoldenGate"
    }
-->

1.  Launch the OCI GoldenGate Deployment Console, and then use the Navigation menu (hamburger icon) to open the Administration Server's **User Administration** page. 

    ![Click Administrator in the OCI Goldengate deployment console navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/connection/images/03-01.png " ")

2.  Click **Add User** and create a user account that Oracle GoldenGate will use to connect to OCI GoldenGate. Enter the following values:

    * For Autheticated By, select **Password** from the dropdown.
    * For Role, select **Operator** from the dropdown.
    * For Username, enter **ggsnet**.
    * For Password and Verify Password, enter a password.

    ![Click Add User](https://oracle-livelabs.github.io/goldengate/ggs-common/connection/images/03-02.png " ")

    ![Add a ggsnet user with the Operator role](https://oracle-livelabs.github.io/goldengate/ggs-common/connection/images/03-02b.png " ")

3.  Back in the Oracle GoldenGate Marketplace Administration Server, use the Navigation menu to open the **DB Connections** screen.

4.  Under the Database tab, click **Add DB Connection** (plus icon), and then complete the following fields:

    * For **Credential Domain**, enter a name to distinguish this connection, such as **GGSNetwork**.
    * For **Credential Alias**,  enter a name, such as **ggs2ogg**.
    * For **User ID**, enter the user name of the user you created in step 2 (ggsnet).
    * For **Password**, enter the password from step 2.
    * For **Verify Password**, re-enter the password for verification purposes.

    ![Add a Credential for ggsnet](https://oracle-livelabs.github.io/goldengate/ggs-common/connection/images/03-04.png " ")

5.  Click **Submit**. You should now have two credentials in the Marketplace Oracle GoldenGate instance, one to connect to OCI GoldenGate, and one for the target database.

    ![The Credentials page displays the new credential](https://oracle-livelabs.github.io/goldengate/ggs-common/connection/images/03-05.png " ")