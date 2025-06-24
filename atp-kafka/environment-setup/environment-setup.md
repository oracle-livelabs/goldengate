# Set up the environment

## Introduction

In this lab, you learn to set up your environment in Oracle Cloud Infrastructure using Cloud Shell. Cloud Shell is a web based terminal built into the Oracle Cloud console.

Estimated time: 20 minutes

### Objectives

In this lab, you:

-   Create SSH keys in a Cloud Shell environment.
-	Modify a terraform variables file to interact with the script.
-   Prepare our work environment and create our lab resources using a Terraform script.

### Prerequisites

To successfully complete this lab in your own tenancy, you must have access to OCI Vault and have a Vault created. [Learn more](https://docs.oracle.com/en-us/iaas/Content/KeyManagement/Tasks/managingvaults_topic-To_create_a_new_vault.htm#createnewvault).


## Task 1: Use Cloud Shell to clone the lab repository

1. In the Oracle Cloud Console global header, click **Developer tools**, and then **Cloud Shell**. The Cloud Shell drawer opens at the bottom of your screen.

    > **Note:** It takes a few minutes for Cloud Shell to connect and load your session.

	![prepare our work directory](images/01-01-cloud-shell.png)

2. After Cloud Shell connects, enter the following command to clone the repository:

	```
	<copy>
	git clone https://github.com/smadhukumar/atp-to-kafka.git
	</copy>
	```

3. Enter the following command to change directories:

    ```
	<copy>
	cd atp-to-kafka
	</copy>
    ```
    ![Cloned directory in Cloud Shell Terminal.](images/01-03-git.png)

## Task 2: Generate SSH keys

1. In Cloud Shell, enter the following commands to add the execute permission to generate_pemkey.sh, and then run the file.

	```
	<copy>
	chmod +x generate_pemkey.sh

	./generate_pemkey.sh

	</copy>
	```

2. Enter the following command to copy your public pem file content:

	```
	<copy>
	cat ~/.ssh/oci_api_key_public.pem
	</copy>
	```

	![Image showing steps to copy pem file from Cloud Shell](images/02-02-cloud-shell.png)

## Task 3: Add Public API keys and Modify Terraform variables

1. In the Oracle Cloud console, click **Profile**, and then select your username.

	![Select profile](images/03-01-profile.png)

2. On the **User Details** page, on the navigation menu, click **Tokens and keys**, and then click **Add API Key**.

	![Adding the API to OCI web console](images/03-02-user-details.png)

3. In the Add API Key dialog, select **Paste Public Key**, paste the public pem key copied from Cloud Shell into the Public Key text area, and then click **Add**.

	![Adding the API to OCI web console](images/03-03-add-api.png)

4.  In the Configuration File Preview dialog, copy the values into a text editor so you can refer to them in the next steps.

	![Configuration file preview](images/03-04-configuration-file.png)

5. In Cloud Shell, enter the following command to modify **terraform.tfvars**:

	```
	<copy>
	vi terraform.tfvars
	</copy>
	```

    > **NOTE:** This creates a new file. Press `i` on your keyboard to enable editing, and then press `Shift + Insert` to paste a copied parameter.

6. Replace the following placeholders in double quotes with the configuration file values copied to your text editor.

	```
	<copy>
	tenancy_ocid = "<tenancy-ocid>"
	region = "<region-value>"
	compartment_ocid = "<tenancy-ocid>"
	fingerprint = "<fingerprint-vallue>"
	user_ocid = "<user-ocid>"
	</copy>
	```

7. To save your changes, press **ESC** on your keyboard, and then press `:wq`. 

## Task 4: Terraforming

1. Run the following command to download the necessary terraform values from Oracle Cloud Infrastructure.

	```
	<copy>
		terraform init
	</copy>
	```

2. Enter the following terraform commands:

	```
	<copy>
	terraform plan

	terraform apply --auto-approve
	</copy>
	```
	
    > **NOTE:** Plan and apply shouldn't prompt user input. If it does, then refer to the API key configuration values copied to your text editor from Task 4.
	
3. Take note of the output for later use.

	![Copy and save output results.](images/04-03-zoom-terraform-output.png)

## Task 5: Create a source ATP schema

1.  From the Oracle Cloud Console navigation menu (hamburger icon), click **Oracle Database**, and then select **Autonomous Database**.

    ![Autonomous Database in the Oracle Cloud Console navigation menu](./images/05-01-auto-db.png " ")

2. From the list of databases, select your ATP instance to view its details and access tools.

    ![Autonomous Database page](./images/05-02-adw-home.png " ")

3.  On the ATP_Source Database details page, click **Database actions**, and select **SQL** from the dropdown.

    ![DB Actions log in page](./images/05-03-atp-db-options.png " ")

    > **Note:**  (Optional) Close the SQL Help dialog. 

4.  Copy the SQL query and paste it into the SQL Worksheet. Click **Run Script**. The Script Output tab displays confirmation messages.

    ```
    <copy>
    CREATE USER "SRC_OCIGGLL" IDENTIFIED BY "#OCIGGSr0ck5*";
    GRANT CREATE SESSION TO "SRC_OCIGGLL";
    ALTER USER "SRC_OCIGGLL" ACCOUNT UNLOCK;
    GRANT CONNECT, RESOURCE, DWROLE  TO "SRC_OCIGGLL";
    GRANT UNLIMITED TABLESPACE TO "SRC_OCIGGLL";
    BEGIN
        ORDS.ENABLE_SCHEMA(p_enabled => TRUE,
                        p_schema => 'SRC_OCIGGLL',
                        p_url_mapping_type => 'BASE_PATH',
                        p_url_mapping_pattern => 'SRC_OCIGGLL',
                        p_auto_rest_auth => FALSE);
        commit;
    END;
    /
   </copy>
    ```

    ![ Pasted script in SQL Worksheet](./images/05-04-atp-sql.png " ")


5. Copy the SQL query and paste it into the SQL Worksheet. Click **Run Script**. The Script Output tab displays confirmation messages.
   
    ```
    <copy>
    --------------------------------------------------------
    --  DDL for Table SRC_CITY
    --------------------------------------------------------
    CREATE TABLE "SRC_OCIGGLL"."SRC_CITY" 
    (   "CITY_ID" NUMBER(10,0), 
        "CITY" VARCHAR2(50 BYTE), 
        "REGION_ID" NUMBER(10,0), 
        "POPULATION" NUMBER(10,0)
    ) ;
    --------------------------------------------------------
    --  DDL for Table SRC_CUSTOMER
    --------------------------------------------------------
    CREATE TABLE "SRC_OCIGGLL"."SRC_CUSTOMER" 
    (	"CUSTID" NUMBER(10,0), 
        "DEAR" NUMBER(1,0), 
        "LAST_NAME" VARCHAR2(50 BYTE), 
        "FIRST_NAME" VARCHAR2(50 BYTE), 
        "ADDRESS" VARCHAR2(100 BYTE), 
        "CITY_ID" NUMBER(10,0), 
        "PHONE" VARCHAR2(50 BYTE), 
        "AGE" NUMBER(3,0), 
        "SALES_PERS_ID" NUMBER(10,0)
    ) ;
    --------------------------------------------------------
    --  DDL for Table SRC_ORDERS
    --------------------------------------------------------

    CREATE TABLE "SRC_OCIGGLL"."SRC_ORDERS" 
    (   "ORDER_ID" NUMBER(10,0), 
        "STATUS" VARCHAR2(3 BYTE), 
        "CUST_ID" NUMBER(10,0), 
        "ORDER_DATE" DATE, 
        "CUSTOMER" VARCHAR2(35 BYTE)
    ) ;
    --------------------------------------------------------
    --  DDL for Table SRC_ORDER_LINES
    --------------------------------------------------------

    CREATE TABLE "SRC_OCIGGLL"."SRC_ORDER_LINES" 
    (   "ORDER_ID" NUMBER(10,0), 
        "LORDER_ID" NUMBER(10,0), 
        "PRODUCT_ID" NUMBER(10,0), 
        "QTY" NUMBER(10,0), 
        "AMOUNT" NUMBER(10,2)
    ) ;
    --------------------------------------------------------
    --  DDL for Table SRC_PRODUCT
    --------------------------------------------------------

    CREATE TABLE "SRC_OCIGGLL"."SRC_PRODUCT" 
    (   "PRODUCT_ID" NUMBER(10,0), 
        "PRODUCT" VARCHAR2(50 BYTE), 
        "PRICE" NUMBER(10,2), 
        "FAMILY_NAME" VARCHAR2(50 BYTE)
    );
    -------------------------------------------------------
     --  DDL for Table SRC_REGION
    --------------------------------------------------------

    CREATE TABLE "SRC_OCIGGLL"."SRC_REGION" 
    (   "REGION_ID" NUMBER(10,0), 
        "REGION" VARCHAR2(50 BYTE), 
        "COUNTRY_ID" NUMBER(10,0), 
        "COUNTRY" VARCHAR2(50 BYTE)
    ) ;
    </copy>
    ```
    ![ Pasted schema script in SQL Worksheet](./images/05-05-table-creation-completed.png " ")

    > **Note:** If you find that running the entire script does not create the tables, then try running each table creation statement one at a time until all the tables are created.

6. In the Navigator tab, look for the **SRC\_OCIGGLL** schema and then select tables from their respective dropdowns to verify the schema and tables were created. You may need to log out and log back in if you can't locate **SRC\_OCIGGLL**.

    ![Displays the SRC\_OCIGGLL tables](./images/05-06-table-details.PNG " ")

7. To **enable supplemental logging**, run the following command:

    ```
    <copy>ALTER PLUGGABLE DATABASE ADD SUPPLEMENTAL LOG DATA;</copy>
    ```

8. Run the **alter user** command to unlock the **ggadmin** user and set the password for it. Take note of the password. 

    ```
    <copy>alter user ggadmin identified by <password> account unlock;</copy>
    ```

You may now **proceed to the next lab**.


## Acknowledgements
* **Author** - Madhu Kumar S, Senior Solution Engineer, AppDev and Integration
* **Contributors** -  Denis Sendil, Database Product Management; Jenny Chan, Consulting User Assistance Developer, Database User Assistance; Katherine Wardhana, User Assistance Developer
* **Last Updated By/Date** - Katherine Wardhana, User Assistance Developer, May 2025
