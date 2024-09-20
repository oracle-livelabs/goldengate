# Run a simulation and observe the results

## Introduction

This lab will demonstrate how to monitor an active replication through the various consoles of the GoldenGate environment and using a number of shell scripts to simulate activity on the source database.

*Estimated Lab Time*:  15 minutes

### Lab Architecture

  ![Overall Lab Architecture](./../discover/images/gg21c-lab-archi.png " ")

### Objectives

- Run a script to simulate activity on the Source database
- Observe the target Kafka stream and see the database transactions being replicated
- Observe the various dashboards of GoldenGate that allow to monitor the activity

### Prerequisites

This lab assumes you have:

- A Free Tier, Paid or LiveLabs Oracle Cloud account
- You have completed:

  - Lab: Prepare Setup (*Free-tier* and *Paid Tenants* only)
  - Lab: Environment Setup
  - Lab: Discovery of the environment
  - Lab: Setup of the replication between Oracle and Kafka

## Task 1:Generate Transactions on the Oracle database

To simulate an active application interacting with a database, we'll be using a shell script that will inject records into the database during 5 minutes.

1. Return to the 2 **Terminal** windows we've opened in the beginning of this lab

    - If necessary reorganize the 2 windows to be side by side

    ![Two terminal windows side by side](./images/two-shells.png " ")

    - Ensure you are logged in as user **oracle**
    - Change directory in both terminal windows to the **scripts** subdirectory

      ```bash
      <copy>cd scripts</copy>
      ```

2. Clean the Kafka stream "Employees"

    To ensure you have no old data in the Kafka stream, you can run a shell script to clean the queue:

    ```bash
    <copy>sh delete_kafka.sh</copy>
    ```

    **Troubleshooting:** You might get an error "*Connection to host .. could not be established*".  This probably means the Kafka server did not start up correctly at system boot.  You can force the startup, and check the result with the below commands:

    ```bash
    <copy>sudo systemctl start kafka
    sudo systemctl status kafka<copy>
    ```

    Now retry the delete_kafka.sh command

3. Run the **load.sh** script to start injecting data into the Oracle database:

    ```bash
    sh load.sh
    ```

    You should see an output as in the below image:

   ![output load script](./images/load-res.png " ")

   **Trouble-shooting:** You might see the error  "ORA-28002 The Password Will Expire ..." or "ORA-28001 The Password has expired".

   Simply connect to the database as user sys@PDB and reset the password:

    ```bash
    <copy>
    sqlplus sys/Welcome#123@PDB as sysdba
    </copy>
    ```

    and

    ```sql
    <copy>
    ALTER USER SOURCE_APP identified by Welcome#123
    </copy>
    ```

4. Observe the transactions being inserted into the database: in the **second Terminal** window, run the monitor command to observe the database insertions:

      ```bash
      <copy>
      sh monitor_oracle.sh
      </copy>
      ```

    - You can see the counter increasing
    - Interrupt the monitor script with the key combination **Ctrl-C**

    ![output monitor script oracle](./images/monitor-o.png " ")

5. List the available Kafka topics:

    ```bash
    <copy>
    sh list_topics.sh
    </copy>
    ```

    ![List kafka topics](./images/list-topics.png " ")

6. List the events on the Kafka topic **EMPLOYEES**

    ```bash
    <copy>
    sh monitor_kafka.sh
    </copy>
    ```

    ![output monitor script kafka](./images/list-emp.png " ")

    You can see the database records represented in JSON being made available in the Kaka stream.

## Task 2: Observe the various GoldenGate dashboards

We'll return to the browser window with the GoldenGate Administration Service

1. Navigate the **oracledb** deployment console
2. Click on the name of the Extract: **E_ORACLE**

    ![Admin tab oracledb deployment](./images/extract23.png " ")

3. Now select the menu item **Statistics** in the left-hand menu

    ![Stats tab](./images/db-stats23.png " ")

    You should see some records already inserted, you can use the **Refresh** icon to see the counter increase.

4. Click on the tab **Performance Metrics Service** on the very top of the window to see much more detailed information

    You get a visual representation of the various services associated with the deployment **oracledb**.  In this case we are interested in the **Extract** process

    ![DB performance tab](./images/db-perf23.png " ")

5. Click on the **Extracts**

    ![Process performance](./images/extract-stat23.png " ")

6. Click on the **E_ORACLE** extract process

    ![Process performance](./images/stat-db23.png " ")

    You can see various dashboards associated with the different entities you might be interested in: Process Performance, Trail Files, Database Statistics, etc.

7. Click on the various tabs to see the statistics

    ![Trail statistics](./images/stat-db2-23.png " ")

8. We can also look at the statistics on the receiving end.

    - Open the browser window with the  **oggdaa** deployment console
    - Select the deployment R_KAFKA
    - Select the **Statistics** in the left menu

        ![oggdaa deployment](./images/oggdaa-stat1.png " ")

    - You can see the nb of inserts performed.

9. Let's now look at live statistics of the processes running:
    - Select the **Performance Metrics** tab in the top menu
    - Select the **Replicats** in the center screen
    - Select the **R_KAFKA** process

    ![oggdaa performance](./images/oggdaa-stat2.png " ")

10. Observe the various dashboards you have available: Process Performance, Trail Files, and more.

**Congratulations, you have reached the end of this Lab !**

## Learn More

- [GoldenGate Microservices](https://docs.oracle.com/en/middleware/goldengate/core/19.1/understanding/getting-started-oracle-goldengate.html#GUID-F317FD3B-5078-47BA-A4EC-8A138C36BD59)

## Acknowledgements

- **Author** - Jan Leemans, December 2023
- **Contributors** - Carmelo Millan
- **Last Updated** - Jan Leemans, August 2024
