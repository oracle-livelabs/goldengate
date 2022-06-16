# Initialize environment

## Introduction
In this lab we will setup the required database and Oracle GoldenGate replication users.

*Estimated Time*:  10 minutes

### Lab Architecture
![](./images/ggmicroservicesarchitecture.png " ")

### Objectives
Understanding how to prepare and set up an Oracle Database for replication and define users for replication. Users are created using scripts that populate the multitenant environment with required Oracle Users while applying aliases to be used by GoldenGate. The Databases used in this lab are identified using the SOE schema in source and targets.

### Prerequisites
This lab assumes you have:
- You have completed:
    - Lab: Prepare setup
    - Lab: Environment setup

## Task 1: Validate That Required Processes are Up and Running.
1. Now with access to your remote desktop session, proceed as indicated below to validate your environment before you start executing the subsequent labs. The following Processes should be up and running:

    - Database Listener
        - LISTENER
    - Database Server instance
        - ORCL
    - Oracle GoldenGate ServiceManager

    Open the terminal on the remote desktop and run the following for a clean start.

    ```
    <copy>
    sudo systemctl restart oracle-database OracleGoldenGate
    sudo systemctl status oracle-database OracleGoldenGate
    </copy>
    ```

2. On the web browser window on the right preloaded with *Oracle GoldenGate ServiceManager*, click on the *Username* field and provide the credentials below to login.

    ```
    Username: <copy>oggadmin</copy>
    ```

    ```
    Password: <copy>Welcome1</copy>
    ```

  3. Confirm successful login. Please note that it may take up to 5 minutes after instance provisioning for all processes to fully start.

    ![](./images/goldengate-login.png" ")

    If successful, the page above is displayed and as a result your environment is now ready.  

    In the interest of time and for ease of execution, all prerequisite tasks to prepare the database for GoldenGate replication have already been performed on your VM instance. This includes:
      - Enabling Archive Log Mode
      - Enabling Supplemental Logging
      - Setting DB parameter `enable_goldengate_replication` to  true
      - Creating GoldenGate users in the database



## Appendix 1: Managing Startup Services

1. Database Service (Database and Listener).

    - Start

    ```
    <copy>sudo systemctl start oracle-database</copy>
    ```

    - Stop

    ```
    <copy>sudo systemctl stop oracle-database</copy>
    ```

    - Status

    ```
    <copy>sudo systemctl status oracle-database</copy>
    ```

    - Restart

    ```
    <copy>sudo systemctl restart oracle-database</copy>
    ```

2. Oracle GoldenGate ServiceManager

    - Start

    ```
    <copy>sudo systemctl start OracleGoldenGate</copy>
    ```

    - Stop

    ```
    <copy>sudo systemctl stop OracleGoldenGate</copy>
    ```

    - Status

    ```
    <copy>sudo systemctl status OracleGoldenGate</copy>
    ```

    - Restart

    ```
    <copy>sudo systemctl restart OracleGoldenGate</copy>
    ```
You may now **proceed to the next lab**.

## Learn More

* [GoldenGate Microservices](https://docs.oracle.com/en/middleware/goldengate/core/19.1/understanding/getting-started-oracle-goldengate.html#GUID-F317FD3B-5078-47BA-A4EC-8A138C36BD59)

## Acknowledgements
* **Author** - Brian Elliott, Data Integration, November 2020
* **Contributors** - Preeti Shukla, Volker Kuhr
- **Last Updated By/Date** - Anuradha Chepuri, July 2022
