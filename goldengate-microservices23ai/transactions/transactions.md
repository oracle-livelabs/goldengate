# Create transactions (optional, requires client SQL Developer)

## Introduction

In this lab, you learn to monitor the Extract and Replicat processes that were created and run in the previous lab.

Estimated time: 2 minutes

Watch the video below for a quick walk through of the lab.
[Watch the video](videohub:1_fpr4rutd)

### About Performance Monitoring

Monitoring the performance of your GoldenGate instance ensures that your data replication processes are running smoothly and efficiently. You can monitor performance in both the Oracle Cloud Infrastructure (OCI) GoldenGate Deployment Console as well as in the Oracle Cloud Console on the Deployment Details page.

### Objectives

In this lab, you will:
* View charts and statistics using the Performance Metrics Server in the GoldenGate deployment console
* Use Metrics on the Deployment Details page in the Oracle Cloud Console to determine overall instance health and utilization.

### Prerequisites

In order to complete this lab:
* You should have completed the preceding lab
* Have both an Extract and Replicat running

## Task 1: Log into to East database with SQL developer (or another client)

1. Login to Database WEST as HR user (Same Password)

2. Creating a dummy table named 'players' in the HR schema

    ```
    <copy>CREATE TABLE HR.PLAYERS (
    id NUMBER,
    name VARCHAR2(100),
    role VARCHAR2(100)
    );</copy>
    ```
3. Inserting five male players and one male coach into the 'HR.players' table

    ```
    <copy>INSERT INTO HR.PLAYERS (id, name, role) VALUES (1, 'John Doe', 'player');
    INSERT INTO HR.PLAYERS (id, name, role) VALUES (2, 'Michael Brown', 'player');
    INSERT INTO HR.PLAYERS (id, name, role) VALUES (3, 'Bob Smith', 'player');
    INSERT INTO HR.PLAYERS (id, name, role) VALUES (4, 'Charlie Brown', 'player');
    INSERT INTO HR.PLAYERS (id, name, role) VALUES (5, 'David Green', 'player');
    INSERT INTO HR.PLAYERS (id, name, role) VALUES (6, 'James White', 'coach');</copy>
    ```

4. Committing the insert operations

    ```
    <copy> COMMIT;

    -- Look the Extract Statistics in the WebUI West OGG. You should see 1 DDL and 6 inserts on HR.PLAYERS Table.
    -- Look the Dist Path Statistics in the WEBUI West OGG. You should see 1 DDL Sent and 6 inserts on HR.PLAYERS Table.
    -- Look the Replicat Statistics in the the WEBUI EAST OGG. You should see 1 DDL and 6 inserts on HR.PLAYERS Table. </copy>
    ```

5. Connect to West and East database with HR user
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

6. Updating the player with id=1 to a new name
    ```
    <copy> UPDATE HR.PLAYERS SET name = 'Johnathan Doe' WHERE id = 1; 
    </copy>
    ```

7. Committing the update operation
    ```
    <copy> COMMIT;

    -- Look the Extract Statistics in the WebUI West OGG. You should see 1 update on HR.PLAYERS Table.
    -- Look the Dist Path Statistics in the WEBUI West OGG. You should see 1 update on HR.PLAYERS Table.
    -- Look the Replicat Statistics in the the WEBUI EAST OGG. You should see 1 update on HR.PLAYERS Table.   
    </copy>
    ```

8. Delete record 4
    ```
    <copy> DELETE FROM HR.PLAYERS where id=4;

    COMMIT;

    -- Look the Extract Statistics in the WebUI West OGG. You should see 1 delete on HR.PLAYERS Table.
    -- Look the Dist Path Statistics in the WEBUI West OGG. You should see 1 delete on HR.PLAYERS Table.
    -- Look the Replicat Statistics in the the WEBUI EAST OGG. You should see 1 delete on HR.PLAYERS Table.

    </copy>
    ```
9. Connect to West and East database with HR user
    ```
    <copy> DELETE FROM HR.PLAYERS where id=4;
    -- Selecting all records to verify changes in both
    SELECT * FROM HR.PLAYERS;
    </copy>
    ```

## Learn more

* [Monitor performance using the Oracle Cloud console](https://docs.oracle.com/en/cloud/paas/goldengate-service/vddvk/index.html#articletitle)

## Acknowledgements
* **Author** - Katherine Wardhana, User Assistance Developer
* **Contributors** -  Alex Lima Gray, Database Product Management
* **Last Updated By/Date** - Katherine Wardhana, July 2024
