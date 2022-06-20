# Add Extract

## Introduction
Use `ADD EXTRACT` to create an Extract group/process.

This lab describes how to add an Extract group (`exte`), which then captures data from the source database and writes to a trail file (`ea`).

Estimated Time: 10 minutes

### Objectives
In this lab, you will:
* Create an Extract process.
* Edit the parameter file.
* Register the Extract process.
* Add the Extract trail.
* Start the Extract process.

### Prerequisites
This lab assumes that you have:
- The appropriate database privileges to be able to execute the commands in the Admin Client.
- Completed the tasks in **Lab - Enable Trandata, Add Heartbeat and Checkpoint Tables**.

## Task 1: Add an Extract Process

To add an extract process and Exttrail:

1. Test the database connection by running the following command:
    ```
    <copy>
    DBLOGIN USERIDALIAS ggeast
    </copy>
    ```

2. Add an Extract:
    ```
    <copy>
    ADD EXTRACT exte, TRANLOG, BEGIN NOW
    </copy>
    ```

    **exte** is the name of the Extract that is being created. However, the Extract is yet to start.
3. Configure the Extract parameters in the Extract parameter file (`exte.prm`):
    ```
    <copy>
    EDIT PARAMS exte
    </copy>
    ```
    The Extract parameter file is as follows:
    ```
    <copy>
    EXTRACT exte
    USERIDALIAS cggnorth DOMAIN OracleGoldenGate
    EXTTRAIL east/ea
    SOURCECATALOG pdbeast
    DDL INCLUDE MAPPED
    TABLE hr.*;
    </copy>
    ```

4. Register the Extract:
    ```
    <copy>
    REGISTER EXTRACT exte
    </copy>
    ```

5.  Add the Extract trail file:
    ```
    <copy>
    ADD EXTTRAIL east/ea
    </copy>
    ```

6. Start the Extract:
    ```
    <copy>
    START EXTRACT exte
    </copy>
    ```
  The Extract group **exte** starts.

7. To confirm the Extract has started, run the following command:

    ```
    <copy>
    INFO EXTRACT exte
    </copy>
    ```

The following is a sample Extract output:

  ![Sample Extract](./images/extract-output.png " ")  


You may now **proceed to the next lab**.

## Learn More
* [Using the Admin Client](https://docs.oracle.com/en/middleware/goldengate/core/21.1/admin/getting-started-oracle-goldengate-process-interfaces.html#GUID-84B33389-0594-4449-BF1A-A496FB1EDB29)
* [ADD EXTRACT](https://docs.oracle.com/en/middleware/goldengate/core/21.3/gclir/add-extract.html#GUID-D9611110-A8D6-4118-837E-BF1900262666)
* [SOURCEISCATALOG](https://docs.oracle.com/en/middleware/goldengate/core/21.3/reference/sourcecatalog.html#GUID-C2D88643-6839-432D-A7E4-63B874859566)

## Acknowledgements
* **Author** - Anuradha Chepuri, Principal UA Developer, Oracle GoldenGate User Assistance
* **Contributors** -  Preeti Shukla, Volker Kuhr, Madhusudhan Rao
* **Last Updated By/Date** - Anuradha Chepuri, June 2022
