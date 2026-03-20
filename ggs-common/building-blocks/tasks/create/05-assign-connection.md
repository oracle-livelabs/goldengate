<!--
    {
        "name":"Assign connections to the deployment",
        "description":"Assign connections to the deployment"
    }
-->
1. From the GoldenGate menu, select **Deployments**.

2. On the Deployments page, select the **OCI GoldenGate Deployment**.

3. On the deployment details page, from the navigation menu, click **Assigned connections**.

4. On the Assigned connections page, click **Assign connection**.

    ![Click Assign connection](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/06-04-assign-connection.png " ")

5. In the Assign connection panel, for Connection in compartment, select a compartment, and then select **SourceATP** from the dropdown. 

6. Click **Add connection**, select a compartment, and then select **TargetALK** from the dropdown. Click **Assign connection**.

    ![Assigned connection dialog](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/06-04-assign-connections.png " ")

7. Click **Close**.

    ![Close Assign connection dialog](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/06-06a-close-assign-connections.png " ")

    The two connections should now appear in the Assigned connections list. 

    ![Assigned connections list](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/06-06b-assigned-connections-list.png " ")

8. Open the SourceATP connection's **Actions** menu, and then select **Test connection**.

    ![Test assigned connection](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/06-08-test-connection.png " ")

9. The Test connection dialog should return "Connectivity test passed successfully." If it doesn't, try again. If it continues to fail, check that the connection's credentials were entered correctly, and try again.

    ![Test connection success](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/06-09-test-success.png " ")