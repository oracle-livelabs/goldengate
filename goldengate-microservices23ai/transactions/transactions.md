# Create transactions (optional, requires client SQL Developer)

## Introduction

In this lab, you learn to connect the East and West database to an HR schema using a client SQL developer, create a table, and perform inserts, update, and delete statements on the schema.

Estimated time: 10 minutes

### Objectives

In this lab, you will:
* Learn how to connect the database to a client SQL developer
* Perform a create table statement on the schema 
* Perform inserts, update, and delete statements on the schema

### Prerequisites

In order to complete this lab:
* You should have completed the preceding lab
* Have an Extract and Replicat running

## Task 1: Log into to East database with SQL developer (or another client) 

## Task 2: SQL inserts

1. Enter the following into the Worksheet, and then click **Run Statement**. This statement creates a table named `players` in the HR schema.

    ```
    <copy>CREATE TABLE HR.PLAYERS (
    id NUMBER,
    name VARCHAR2(100),
    role VARCHAR2(100)
    );</copy>
    ```
2. Enter the following into the Worksheet, and then click **Run Statement**. This statement inserts five male players and one male coach into the `HR.players` table.

    ```
    <copy>INSERT INTO HR.PLAYERS (id, name, role) VALUES (1, 'John Doe', 'player');
    INSERT INTO HR.PLAYERS (id, name, role) VALUES (2, 'Michael Brown', 'player');
    INSERT INTO HR.PLAYERS (id, name, role) VALUES (3, 'Bob Smith', 'player');
    INSERT INTO HR.PLAYERS (id, name, role) VALUES (4, 'Charlie Brown', 'player');
    INSERT INTO HR.PLAYERS (id, name, role) VALUES (5, 'David Green', 'player');
    INSERT INTO HR.PLAYERS (id, name, role) VALUES (6, 'James White', 'coach');
    
    COMMIT;

    -- Look the Extract Statistics in the WebUI West OGG. You should see 1 DDL and 6 inserts on HR.PLAYERS Table.
    -- Look the Dist Path Statistics in the WEBUI West OGG. You should see 1 DDL Sent and 6 inserts on HR.PLAYERS Table.
    -- Look the Replicat Statistics in the the WEBUI EAST OGG. You should see 1 DDL and 6 inserts on HR.PLAYERS Table. </copy></copy>
    ```

3. Enter the following into the Worksheet, and then click **Run Statement**. This statement selects all records to verify the updates made in the statements above.
    ```
    <copy> SELECT * FROM HR.PLAYERS;
   -- You should see the following in both:

       ID NAME                 ROLE                
    ---------- -------------------- --------------------
         1 John Doe             player              
         2 Michael Brown        player              
         3 Bob Smith            player              
         4 Charlie Brown        player              
         5 David Green          player              
         6 James White          coach      
    </copy>
    ```

4. Enter the following into the Worksheet, and then click **Run Statement**. This statement updates the player with `id=1` to a new name.
    ```
    <copy> UPDATE HR.PLAYERS SET name = 'Johnathan Doe' WHERE id = 1; 

    COMMIT;

    -- Look the Extract Statistics in the WebUI West OGG. You should see 1 update on HR.PLAYERS Table.
    -- Look the Dist Path Statistics in the WEBUI West OGG. You should see 1 update on HR.PLAYERS Table.
    -- Look the Replicat Statistics in the the WEBUI EAST OGG. You should see 1 update on HR.PLAYERS Table.
    </copy>
    ```

5. Enter the following into the Worksheet, and then click **Run Statement**. This statement deletes players with the record `id=4`.
    ```
    <copy> DELETE FROM HR.PLAYERS where id=4;

    COMMIT;

    -- Look the Extract Statistics in the WebUI West OGG. You should see 1 delete on HR.PLAYERS Table.
    -- Look the Dist Path Statistics in the WEBUI West OGG. You should see 1 delete on HR.PLAYERS Table.
    -- Look the Replicat Statistics in the the WEBUI EAST OGG. You should see 1 delete on HR.PLAYERS Table.

    </copy>
    ```
6. Enter the following into the Worksheet, and then click **Run Statement**. This statement selects all records to verify the updates made in the statements above.

    ```
    <copy>
    SELECT * FROM HR.PLAYERS;
    </copy>
    ```

## Learn more

* [Using Oracle GoldenGate with SQL Server](https://docs.oracle.com/goldengate/c1230/gg-winux/GGHDB/18.1using-oracle-goldengate-sql-server.htm)

## Acknowledgements
* **Author** - Katherine Wardhana, User Assistance Developer
* **Contributors** -  Alex Lima, Database Product Management
* **Last Updated By/Date** - Katherine Wardhana, July 2024
