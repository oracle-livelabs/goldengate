# Use Oracle GoldenGate REST API commands

## Introduction

Oracle GoldenGate 23ai is built on the Microservices Architecture and supports management and monitoring via three interfaces: the WebUI, the command-line interface (Admin Client), and the REST API. The REST API provides an excellent method for Engineering and DevOps teams to use scriptable REST calls to connect to the GoldenGate services and its processes.

The examples in this lab are only a small set of available REST calls.  [View the complete list of documented calls are available](https://docs.oracle.com/en/middleware/goldengate/core/23/oggra/).

   ![Rest API management](./images/rest-api-manage.png " ")

Estimated time: 10 minutes

### Objectives

In this lab, you use sample REST calls to monitor and create processes within your GoldenGate deployment.

## Task 1: Make REST Calls to View Status Information

At this stage in the workshop, you used the Oracle GoldenGate WebUI to create processes and review their status and related information. In this lab, you learn how to use the REST API to issue `curl` commands that interact directly with GoldenGate services. You'll query the status of existing processes and create a new database connection, then verify your changes visually in the WebUI.

1. Select **Activities** from the upper left of the console and then select **Terminal** from the Applications bar.

2. In the Terminal, enter `menu` to view the menu options. 

    ![Menu options on Terminal](./images/01-02-menu-terminal.png " ")

3. When prompted, enter option `2` for the the Oracle GoldenGate 23.7 environment.

4. The following `curl` commands provide status information, process lag, table statistics, and other relevant data. Enter each command into the terminal one by one:

    * Service Status: The “status” field of the output shows the current status of the services.
    ```
    <copy>curl --location 'http://localhost:9011/services/v2/deployments/HUB_23ai/services' --netrc-file ~/.ogg_netrc.sh | jq '.response.items |= map(del(.links))'</copy>
    ```
    ![Service Status](./images/01-03a-service-status.png " ")
    
    * Deployment Information: Shows the status and path information of the deployment.
    ```
    <copy>curl --location 'http://localhost:9011/services/v2/deployments/HUB_23ai' --netrc-file ~/.ogg_netrc.sh | jq .response</copy>
    ```

    * Extract Information: Shows the Extract's configuration information.
    ```
    <copy>curl --location --request GET 'http://localhost:9012/services/v2/extracts/EWEST' --netrc-file ~/.ogg_netrc.sh | jq .response</copy>
    ```
    *  Extract Status: Shows the status and lag information of the Extract.
    ```
    <copy>curl --location 'http://localhost:9012/services/v2/extracts/EWEST/info/status' --netrc-file ~/.ogg_netrc.sh | jq .response</copy>
    ```
    *  Extract Checkpoint: Shows the current checkpoint details of the Extract.
    ```
    <copy>curl --location 'http://localhost:9012/services/v2/extracts/EWEST/info/checkpoints' --netrc-file ~/.ogg_netrc.sh | jq .response</copy>
    ```
    * GGSERR Log File View: To view the contents of the GGSERR log file.
    ```
    <copy>curl --location 'http://localhost:9012/services/v2/messages' --netrc-file ~/.ogg_netrc.sh | jq .response | tail -300</copy>
    ```
    * Replicat Status: Shows the status and lag information of the given Replicat. 
    ```
    <copy>curl --location 'http://localhost:9012/services/v2/replicats/REAST/info/status' --netrc-file ~/.ogg_netrc.sh | jq .response</copy>
    ```
    * Table Statistics: View the row statistics of the process since it last started.
    ```
    <copy>curl -s --location --request POST 'http://localhost:9012/services/v2/extracts/EWEST/command' --netrc-file ~/.ogg_netrc.sh --data '{"command": STATS" "arguments": "HOURLY"}' | jq ' .response.replyData.stats[] | select(.sourceTable? != null and (.operations | type == "array")) | { sourceTable: .sourceTable, targetTable: .targetTable, since: .since, insert: ([.operations[] | select(.operation == "insert") | .count] | add // 0), update: ([.operations[] | select(.operation == "update") | .count] | add // 0), delete: ([.operations[] | select(.operation == "delete") | .count] | add // 0), upsert: ([.operations[] | select(.operation == "upsert") | .count] | add // 0), discard: ([.operations[] | select(.operation == "discard") | .count] | add // 0), operations: ([.operations[] | select(.operation == "operations") | .count] | add // 0), metadata: ([.operations[] | select(.operation == "metadataRecords") | .count] | add // 0) }'</copy>
    ```

## Task 2: Make REST Calls to Create New Objects

In this task, you use the REST API to issue `curl` commands to create objects that can then be viewed from the WebUI.

1. Enter the following `curl` command to create a new database connection using the REST API, then open the Administration Service browser tab to view the new connection. You may have to refresh the DB Connections to see the new entry:

    ```
    <copy>curl --location --request POST 'http://localhost:9012/services/v2/credentials/OracleGoldenGate/WestDB' --netrc-file ~/.ogg_netrc.sh --data-raw '{ "userid": "ggadmin@localhost:1521/west", "password": "Welcome##123" }' | jq</copy>
    ```

    ![Create a new DB Connection using the REST API](./images/02-01a-create-db-connec-rest-api.png " ")

    ![New WestDB DB Connection](./images/02-01b-new-db-connec.png " ")

2. Enter the following command to delete the database connection you just created:

    ```
    <copy>curl --location --request DELETE 'http://localhost:9012/services/v2/credentials/OracleGoldenGate/WestDB' --netrc-file ~/.ogg_netrc.sh | jq 'del(.links)'</copy>
    ```

    ![Delete DB Connection using the REST API](./images/02-02-delete-db-connec.png " ")

3. Enter the following command to view the connection that has been deleted and view the remaining DB Connections:

    ```
    <copy>curl -s --location 'http://localhost:9012/services/v2/credentials/OracleGoldenGate' --netrc-file ~/.ogg_netrc.sh | jq 'del(.links) | .response.items |= map(del(.links))' </copy>
    ```

    ![View DB Connection using the REST API](./images/02-03-view-db-connecs.png " ")

You may now **proceed to the next lab**.

## Acknowledgements
* **Author** - Katherine Wardhana, User Assistance Developer
* **Contributors** - Mack Bell, Senior Principal Product Manager & Alex Lima, Database Product Management
* **Last Updated By/Date** - Jenny Chan, September 2025