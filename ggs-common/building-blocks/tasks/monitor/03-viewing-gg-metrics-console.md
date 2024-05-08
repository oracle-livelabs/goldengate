<!--
    {
        "name":"Viewing GoldenGate metrics in the Oracle Cloud console",
        "description":"Viewing GoldenGate metrics in the Oracle Cloud console"
    }
-->
1.  In the Oracle Cloud console navigation menu, select **Observability & Management**, then under **Monitoring**, select **Metrics Explorer**.

2.  On the Metrics Explorer page, in the **Query** section, set the following parameters, and then click **Update Chart**.

    * Compartment: Select your compartment
    * Metric namespace: Select **oci_goldengate**
    * Metric name: Select **ExtractLag**
    * Dimension name: Select **deploymentName**
    * Dimension value: Select **OCI GoldenGate Deployment**

    ![Metrics query for MySQLDeployment](https://oracle-livelabs.github.io/goldengate/ggs-common/monitor/images/03-02-query1.png " ")

3.  Click **Add Query**, set the following parameters, and then click **Update Chart**.

    * Compartment: Select your compartment
    * Metric namespace: Select **oci_goldengate**
    * Metric name: Select **ReplicatLag**
    * Dimension name: Select **deploymentName**
    * Dimension value: Select **OCI GoldenGate Deployment**

    ![Metrics query for ADWDeployment](https://oracle-livelabs.github.io/goldengate/ggs-common/monitor/images/03-04-query2.png " ")

4.  Refresh your view after 5 minutes to see updated metrics.