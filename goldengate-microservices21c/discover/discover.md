# Discover the Environment

## Introduction

In this lab we will walk through the different components that have already been installed and configured in this lab:

- An Oracle database 21c
- An Apache Kafka setup
- Oracle GoldenGate comprising a number of elements:

    - GG for Oracle 23ai
    - GG for Distributed Applications and Analytics 23ai

We'll take a look at the current situation of these components and how to interact with them.

The default way to interact with the environment is using a single browser window running a Linux desktop through noVNC.  No extra tools on the side of your desktop are necessary in this case.  At the end of this lab page we'll also offer an alternative access, using a remote secure shell on your laptop and direct access to the GoldenGate consoles from a local browser.  Some extra setup is required for this configuration.

*Estimated Lab Time*:  10 minutes

### Lab Architecture

![Lab Architecture diagram, showing source, GG setup and Target kafka](./images/gg21c-lab-archi.png " ")

### Objectives

Understanding the different components that were pre-installed, how to access these through the various available interfaces, and how to reset the lab in case of issues.

### Prerequisites

This lab assumes you have:

- A Free Tier, Paid or LiveLabs Oracle Cloud account
- You have completed:
  - Lab: Prepare Setup (*Free-tier* and *Paid Tenants* only)
  - Lab: Environment Setup

## Task 1: Using the noVNC interface

1. In the previous step you should have received the URL that opens the noVNC desktop in your browser.  At the initial start of the environment, you should see two browser windows:

    - On the left side this tutorial,
    - On the right side the login screen for the GoldenGate Service Manager

    Besides these 2 windows you will also need 2 terminal windows to interact through the command line with some utilities.

2. Click on the **Activities** button in the upper left corner, and select the 3rd "Terminal" icon.

    ![Opening a Terminal](./images/open-terminal.png " ")

    You will be logged in as user **Oracle**, with access to a set of scripts to interact with the various components. You can see the relevant environment variables in the header.

    ![Initial terminal window](./images/one-terminal.png " ")

    In the course of the lab we'll ask you run multiple commands in parallel, so you should open up a second Terminal window.

3. Click on the **Terminal** icon on the top right, and select **New Window**

    ![Second terminal window](./images/2nd-terminal.png " ")

    This will open a second Terminal window.  Arrange the 4 window in a convenient way to easily navigate between them.

4. Discovering the scripts at  your disposal: we'll take a look at the various scripts we'll use in the rest of this lab

5. Change directory into the scripts directory

    ```bash
    <copy>cd scripts</copy>
    ```

6. List the content of this directory

    ```bash
    <copy>ll</copy>
    ```

    ![List of scripts](./images/ll-scripts.png " ")

    Some of the scripts we'll use in this tutorial:

    - **load.sh**: a script to generate a continuous flow of inserts into the EMPLOYEES table of the SOURCE_APP schema of the Oracle database
    - **monitor_oracle.sh**: a script to track the inserts into the the table EMPLOYEES
    - **monitor_kafka.sh**: read the kafka topic EMPLOYEES where we'll be inserting the changes coming from the Oracle Database.
    - **demo_reset.sh**: completely reset the lab environment to restart the lab execution.  You can use this script to restart the lab execution with a fresh setup.

7. Access the Oracle database directly using **sqlplus** from the command line:
  ```
  <copy>sqlplus system/Welcome#123 as sysdba </copy>
  ```

8. Make sure the listener is set up correctly, by issuing the following command:
  ```
  <copy>alter system set LOCAL_LISTENER='' scope=both;</copy>
  ```

    Now use the ```exit``` command to quit your sqlplus session.

9. Make sure the listener is started properly, by issuing the following command:

    ```bash
    <copy>lsnrctl start</copy>
    ```

    You can use the command ```lsnrctl status``` to check the result

10. List the available **kafka topics** with the below command:

    ```
    <copy>/opt/kafka/bin/kafka-topics.sh --list --bootstrap-server localhost:9092</copy>
    ```

    Running this command at this point in the tutorial will not return any values, as we have not created a topic yet.

## Task 2: Accessing the GoldenGate Management consoles

Return to the browser window that was open on the right, showing the **GoldenGate Service Manager** login screen.

- You will use **localhost** as the GoldenGate instance is running on this local environment.
- Port 10000 is the port configured for the **Service Manager**.

1. Click on the *Username* field and provide the credentials below to login.

    ```
    Username: <copy>oggadmin</copy>
    ```

    ```
    Password: <copy>oggadmin</copy>
    ```

    ![Login page](./images/gg-login23.png " ")

2. Confirm successful login:

    ![Initial Landing page](./images/gg-landing23.png " ")

    If successful, the page above is displayed and as a result your environment is now ready, and you can see the various **deployment types** that were already configured on this environment for GoldenGate.

    - For each deployment type you can access the different services associated with the Deployment:

        - Administration Service
        - Distribution Service
        - Performance Metrics Service
        - Receiver Service

        ![Oracle Deployment details](./images/gg-oracle-services23.png " ")

    In the interest of time and for ease of execution, all prerequisite tasks to prepare the database for GoldenGate replication have already been performed on your VM instance. This includes:

    - Enabling Archive Log Mode
    - Enabling Supplemental Logging
    - Setting DB parameter `enable_goldengate_replication` to  true
    - Creating GoldenGate users in the database


You may now **proceed to the next lab**, or alternatively investigate other ways to access the environment below:

## OPTIONAL Task 3: Accessing the environment without noVNC

In some cases you might want to access the GoldenGate consoles and the terminal windows directly from your laptop.  This allows for easier cut and paste of commands, and a better graphical experience.  In this Task we'll explain you the steps required for this setup

1. Start a remote shell to access the machine

    In order to enable this, you need to have the private key corresponding to the public key used when creating the OCI Compute instance.

    With this key available, you can run a remote shell of you choice - for example putty on windows or ssh on Mac.  Below an example to access the console via a mac shell:

    ```
    <copy>ssh -i yourprivatekey opc@123.123.123.123</copy>
    ```

- replace *yourprivatekey* with a valid path to the private key corresponding to the public key specified during the instance creation
- replace the IP address 123.123.123.123 with the public IP address of your compute instance.  This is the same IP used to access the noVNC console.

2. Once you are logged in as user **opc** you need to sudo to user **oracle** to be able to run the lab commands:

    ```
    <copy>sudo su - oracle</copy>
    ```

3. Access the GoldenGate Service Manager through your local browser on your desktop, using the IP address and the port 10000 :

    ```
    <copy>http://123.123.123.123:10000</copy>
    ```

    As before, replace the IP address with -real public IP address of your Compute instance.

You may now **proceed to the next lab**.

## Learn More

- [GoldenGate Microservices](https://docs.oracle.com/en/middleware/goldengate/core/23/coredoc/overview-oracle-goldengate.html#GUID-3B1EF969-4A36-4338-820E-16F82B5C646D)

## Acknowledgements

- **Author** - Jan Leemans, December 2023
- **Contributors** - Carmelo Millan
- **Last Updated** - Jan Leemans, Sep 2024
