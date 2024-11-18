# Create transactions (optional, requires client SQL Developer)

## Introduction

In this lab, you learn to connect the East and West database to an HR schema using a client SQL developer, create a table, and perform inserts, update, and delete statements on the schema.

Estimated time: 10 minutes

### Objectives

In this lab, you will:
* Learn how to connect the database to a client SQL developer.
* Perform a create table statement on the schema.
* Perform inserts, update, and delete statements on the schema.

### Prerequisites

In order to complete this lab:
* You should have completed the preceding lab.
* Have an Extract and Replicat running.
* Acess your SQL developer. Download the Oracle SQL Server [here](https://www.oracle.com/database/sqldeveloper/technologies/download/).

## Task 1: Log into to the East database with SQL developer (or another client) and SQL inserts

1. Using the Reservation Information details, paste the link to the SQL developer:

    ```
    <copy>https://hr/&lt;global_password&gt;/&lt;db-west-public_ip&gt;:1521/freepdb1</copy>
    ```

2. Run the following script to creates a table named `players` in the HR schema, and then click **Run Statement**.

    ```
    <copy>CREATE TABLE HR.PLAYERS (
    id NUMBER,
    name VARCHAR2(100),
    role VARCHAR2(100)
    );</copy>
    ```
3. Run the following script to insert five male players and one male coach into the `HR.players` table, and then click **Run Statement**.

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

4. Run the following script to select all records to verify the updates made in the statements above, and then click **Run Statement**.

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

5. Run the following script to update the player with `id=1` to a new name, and then click **Run Statement**.

    ```
    <copy> UPDATE HR.PLAYERS SET name = 'Johnathan Doe' WHERE id = 1; 

    COMMIT;

    -- Look the Extract Statistics in the WebUI West OGG. You should see 1 update on HR.PLAYERS Table.
    -- Look the Dist Path Statistics in the WEBUI West OGG. You should see 1 update on HR.PLAYERS Table.
    -- Look the Replicat Statistics in the the WEBUI EAST OGG. You should see 1 update on HR.PLAYERS Table.
    </copy>
    ```

6. Run the following script to delete players with the record `id=4` to a new name, and then click **Run Statement**.

    ```
    <copy> DELETE FROM HR.PLAYERS where id=4;

    COMMIT;

    -- Look the Extract Statistics in the WebUI West OGG. You should see 1 delete on HR.PLAYERS Table.
    -- Look the Dist Path Statistics in the WEBUI West OGG. You should see 1 delete on HR.PLAYERS Table.
    -- Look the Replicat Statistics in the the WEBUI EAST OGG. You should see 1 delete on HR.PLAYERS Table.

    </copy>
    ```
7. Run the following script to select all records to verify the updates made in the statements above, and then click **Run Statement**.

    ```
    <copy>
    SELECT * FROM HR.PLAYERS;
    </copy>
    ```

## Acknowledgements
* **Author** - Katherine Wardhana, User Assistance Developer
* **Contributors** -  Alex Lima, Database Product Management
* **Last Updated By/Date** - Katherine Wardhana, August 2024
