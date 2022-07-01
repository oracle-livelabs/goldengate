# Migrate to ATP

## Introduction

The final lab of this workshop will guide you on how to set up a simple migration to ATP using GoldenGate Microservices. By using Oracle GoldenGate Microservices on Oracle Cloud Marketplace, replication from on-premises to cloud and cloud-to-cloud platforms can easily be established and managed. 
This will allow you to deploy Oracle GoldenGate in an off-box architecture, which means you can run and manage your Oracle GoldenGate deployment from a single location.

*Estimated lab time*: 30 minutes

### Objectives

In the final lab of the workshop, we will configure the replication process in Microservices and apply captured changes from the source database to our target Autonomous Database.

For a technical overview of this lab step, please watch the following video:

[Video showing technical overview of this lab](youtube:x7vX5r3Qzns)

### Prerequisites

* This lab assumes that you completed all preceding labs, and ready to migrate to ATP.

## Task 1: Access to GoldenGate Microservices Instance

1. After successful creating three extract processes, now it is time to explore your GG Microservices server. Let's make a console connection to Microservice. Copy the IP address of `OGG_Microservices_Public_ip` from your note and connect using:

	**`ssh opc@your_microservice_ip_address -i ~/.ssh/oci`**

## Task 2: Retrieve Admin Password

1. Administrator user credentials of GoldenGate Microservices Web console is already created for you. Once you are in the instance, issue following and copy a credential value from the output.

	```
	<copy>
	cat ogg-credentials.json
	</copy>
	```

	![Output showing credential](images/oggadmin.png)

2. Good practice is to keep it in your notepad. You will use it very often in the next steps.

## Task 3: Login to Microservices Web Console

1. Open your web browser and point to `https://your_microservices_ip_address`. Provide oggadmin in username and password which you copied, then log in.

	![Microservices web console login.](images/gg-oggadmin.png)

## Task 4: Open Target Receiver Server

1. Then click on Target Receiver server's port **9023**, it will redirect you to a new tab. Provide your credentials again for username **oggadmin**.

	![Target receiver server selection.](images/gg-oggadmin-0.png)

2. You should be seeing something like the below image. This means that your extdmp is pumping captured trail files to your Microservices.

	![Server path diagram.](images/gg-oggadmin-1.png)

	This is something you will need if you want continuous replication and migration. We will use this configuration in the step 12.

## Task 5: Open Target Administration Server

1. Click on Target Receiver server port **9021**, it will redirect you to new tab. Provide your credentials again for username **oggadmin**.

	![GoldenGate service manager screen.](images/micro-oggadmin-0.png)

## Task 6: Modify GoldenGate Credentials

1. You should be seeing the empty Extracts and Replicats dashboard. Let's add Autonomous Database credentials. Open the hamburger menu on the top-left corner, choose **Configuration**

	![GoldenGate menu screen.](images/micro-ggadmin-0.png)

2. It will open OGGADMIN Security and you will see we already have a connection to **HOL Target ATP** database. However, you still need to add a password here. Click on a pencil icon to **alter credentials**.

	![GoldenGate administration credentials screen.](images/micro-ggadmin-1.png)

## Task 7: Update Password and Check Connection

1. Provide the password `GG##lab12345` and verify it. This is your ggadmin password, which we provided in lab 3.

	![GoldenGate configuration security screen.](images/micro-ggadmin-2.png)

2. After that click on **Log in** database icon.

	![GoldenGate database login.](images/micro-ggadmin-3.png)

## Task 8: Add Checkpoint Table

1. Scroll down to the **Checkpoint** and click on **+** icon, then provide `ggadmin.chkpt` and **SUBMIT**. 

	![Add the checkpoint table.](images/micro-ggadmin-4.png)

	The checkpoint table contains the data necessary for tracking the progress of the Replicat as it applies transactions to the target system. Regardless of the Replicat that is being used, it is best practice to enable the checkpoint table for the target system.

2. Now let's go back to **Overview** page from here.

	![Return to overview from menu.](images/micro-ggadmin-5.png)

3. Now we will add two replication processes in the following steps to accomplish our migration target.

## Task 9: Add The Initial Load Replication

1. The apply process for replication, also known as Replicat, is very easy and simple to configure. There are four types of Replicats supported by the Oracle GoldenGate Microservices. On the overview page, go to Replicat part and click on **+** to create our replicat process.

	![Create replicat process.](images/micro-initload-0.png)

2. We will choose **Non-Integrated Replicat** for initial load, click **Next**. In non-integrated mode, the Replicat process uses standard SQL to apply data directly to the target tables. In our case, the number of records in the source database is small and we don't need to run in parallel, therefore it will suffice.

	![Add non-integrated replicat from replicat configuration screen.](images/micro-initload-1.png)

3. Provide a name for the replicat process, for example, **initload**. The process name has to be unique and 8 characters long and it is better if you give some meaningful names to identify them later on. Let's name it **initload**, because this is currently our initial load process.

	![Name replicat process.](images/micro-initload-2-1.png)

4. Then click on the **Credentials Domain** drop-down list. There is only one credential at the moment, choose the available option for you. In the **Credential Alias**, choose **hol_tp** from the drop-down, which is the pre-created connection group to target ATP. 

	![Credentials domain screen.](images/micro-initload-2-2.png)

5. Scroll below and find "Trail Name", add _**il**_ as trail name, because we defined this in our extract parameter, so it _**cannot**_ be a random name.

	![Add previously defined trial name.](images/micro-initload-2-3.png)

6. Also provide _**/u02/trails**_ in the "Trail Subdirectory" and choose a **Checkpoint Table** from the drop-down list. It is **GGADMIN.CHKPT** in our case. Review everything then click **Next**

7. Microservices has created a draft parameter file for your convenience. Erase only below line from the existing draft parameter:

	```MAP *.*, TARGET *.*```

	![Edit parameter file.](images/micro-initload-3-1.png)

8. Then add below configuration instead:

	```
	<copy>
	MAP public."Countries", TARGET Parking.Countries;
	MAP public."Cities", TARGET Parking.Cities;
	MAP public."Parkings", TARGET Parking.Parkings;
	MAP public."ParkingData", TARGET Parking.ParkingData;
	MAP public."PaymentData", TARGET Parking.PaymentData;
	</copy>
	```

	Parameter file should be looking like the below image.

	![Parameter file showing the configuration.](images/micro-initload-3-2.png)

9. Make sure everything is correct until this stage. Click **Create and Run** to start our replicat.

	![Select create and run.](images/micro-initload-4.png)

## Task 10: Check the Initial Load Status

1. In the overview dashboard, you should now be seeing the running INITLOAD replication. Click on **Action** button, choose **Details**.

	![Overview dashboard showing running initload application.](images/micro-initload.png)
	
2. You can see the details of the running replicat process. In the statistics tab, you can see some changes right away. 

	![Running replicat process details.](images/micro-initload-5.png)

## Task 11: Make Changes at the Source Database

1. We've added a special Initial Load replicate the process and applied all the captured data from the source database to the target Autonomous Database. Now it is time to make some changes to the source database. Let's check a record in the Autonomous database. Do you remember how to find **SQL Developer Web**? Issue the below command and identify the error. 

	```
	<copy>
	SELECT * FROM PARKING.CITIES;
	</copy>
	```

	There's a city ID **TMS** with wrong city name, Ploiesti. It should have been **Timisoara**. Let's make some correction!

	![SQL query output.](images/pg-select-0.png)
	
2. Go to the **cloud-shell home** environment and issue the below command with the source database. **Make sure** you changed _**ip address**_ with your source database's IP Address!

	```
	<copy>
	ssh ubuntu@ip_address -i ~/.ssh/oci "bash -s" < ~/migrate_to_atp/update.sh
	</copy>
	```

	This command issues an update statement at the source database. Our extract processes **EXTTAR** will capture the change and **EXTDMP** will ship them to Microservices. Let's add another replicate process for our captured data in Microservices.

	![Output of update command in Cloud Shell environment.](images/pg-update.png)

## Task 12: Add The Change Capture Replication

1. Same as step 9, go to **Replicats** area in the overview page, then click on **+** to create our second replicat process.

	![Replicat process screen.](images/ch-1.png)

2. We will choose **Non-Integrated Replicat** mode, click **Next**.

	![Non-integrated replicat selection.](images/ch-2.png)

3. Provide a name for this replicat process, let's name it to **changes** as this is our replication process for changed data.

	![Provide name for the replicat process.](images/ch-3.png)

4. Then click on the **Credentials Domain** drop-down list. There is only one credential at the moment, choose the available option for you. In the **Credential Alias**, choose **hol_tp** from the drop-down, which is the pre-created connection group to target ATP. 

	![Select credential alias in the credential domain.](images/ch-4.png)

5. Scroll below and find "Trail Name", add _**pd**_ as trail name, because we defined this in **EXTDMP** extract parameter, so it _**cannot**_ be a random name.

	![Provide previously defined extract parameter.](images/ch-5.png)

6. Please provide _**/u02/trails**_ in the "Trail Subdirectory" and choose a **Checkpoint Table** from the drop-down list. It is **GGADMIN.CHKPT** in our case. Review everything then click **Next**

7. Microservices has created a draft parameter file for your convenience. Erase only below line from the existing draft parameter:

	```MAP *.*, TARGET *.*```

	![Edit the parameter file.](images/ch-6.png)

8. Then add below configuration instead:

	```
	<copy>
	MAP public."Countries", TARGET Parking.Countries;
	MAP public."Cities", TARGET Parking.Cities;
	MAP public."Parkings", TARGET Parking.Parkings;
	MAP public."ParkingData", TARGET Parking.ParkingData;
	MAP public."PaymentData", TARGET Parking.PaymentData;
	</copy>
	```

	Parameter file should be looking like the below image.

	![Output of the edited parameter file.](images/ch-7.png)

9. Make sure everything is correct until this stage. Click on **Create and Run** to start our replicat.

	![Select create and run to start the replicat.](images/micro-initload-4.png)

## Task 13: Check the Continuous Replication Status

1. In the overview dashboard, you should now be seeing the running CHANGES replication. Click on **Action** button, choose **Details**.

	![View of overview dashboard.](images/ch-8.png)

2. You can see the details of the running replicat process. In the statistics tab, you can see some changes right away. A record is updated.

	![View of running replicat process showing updated record.](images/ch-9.png)
	
3. You can also re-check this record using **SQL Developer Web** in Autonomous Database dashboard. The row value is already updated at source database and GoldenGate had replicated to our target Autonomous Database.

	![SQL query output showing updated record.](images/pg-select.png)

Congratulations! You have completed this workshop! 

You successfully migrated PostgreSQL database to Autonomous Database in Oracle Cloud Infrastructure.

## Summary

Here is a summary of resources which was created by Terraform script and used in our workshop.

1. [Virtual Cloud Network](https://docs.oracle.com/en-us/iaas/Content/Network/Tasks/managingVCNs.htm)
- Public Subnet, Internet Gateway
- Private Subnet, NAT Gateway, Service gateway

2. [Compute Virtual Machines and Shapes, OS Images](https://docs.oracle.com/en-us/iaas/Content/Compute/References/computeshapes.htm)
- Source PostgreSQL database instance, 
- GoldenGate PostgreSQL instance
- GoldenGate Microservices instance

3. [Autonomous Database offerings](https://docs.oracle.com/en-us/iaas/Content/Database/Concepts/adboverview.htm)
- Target ATP

4. [Oracle Cloud Marketplace](https://docs.oracle.com/en-us/iaas/Content/Marketplace/Concepts/marketoverview.htm)
- GoldenGate non-oracle deployment 
- GoldenGate Microservices deployment

## **Rate this Workshop**

Don't forget to rate this workshop!  We rely on this feedback to help us improve and refine our LiveLabs catalog.  Follow the steps to submit your rating.

1.  Go back to your **workshop homepage** in LiveLabs by going back to your workshop and clicking the Launch button.
2.  Click on the **Brown Button** to re-access the workshop  

    ![Workshop homepage showing brown button](images/workshop-homepage-2.png " ")

3.  Click **Rate this workshop**

    ![Please rate this workshop](images/rate-this-workshop.png " ")

## Acknowledgements

* **Author** - Bilegt Bat-Ochir - Senior Solution Engineer
* **Contributors** - John Craig - Technology Strategy Program Manager, Patrick Agreiter - Senior Cloud Engineer
* **Last Updated By/Date** - Bilegt Bat-Ochir 24/06/2022
