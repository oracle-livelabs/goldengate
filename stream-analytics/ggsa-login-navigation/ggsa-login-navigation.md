# Initialize Environment

## Introduction
In this lab you are going to login to GGSA and get familiar with the menu and navigation in the home and catalog pages. You will then create a new user and set credentials for that user. You are also going to import an example use case for IoT in order to get familiar with various resources
that are available for that use case.

*Estimated Lab Time*:  25 minutes

### About Product/Technology
Golden Gate Stream Analytics (GGSA) is a tool designed to consume a stream of data from any source such as a database, GoldenGate, kafka, JMS, REST or even a file system.  Once the data is in GGSA you can run analytics on live data in real-time using transformation and action functionality of Spark and send the data downstream to any target of your choice.

### Objectives
- Get familiar with GGSA
- Navigate the tool and get familiar with menu items
- Learn about the multiple resources that are available in GGSA

### Prerequisites
This lab assumes you have:
- A Free Tier, Paid or LiveLabs Oracle Cloud account
- You have completed:
    - Lab: Prepare Setup (*Free-tier* and *Paid Tenants* only)
    - Lab: Environment Setup
    - Lab: Initialize Environment

## Task 1: GGSA Version
1. Click on the drop-down menu in the upper right-hand corner of the screen.

    ![](./images/about.png " ")

2. Click on the About menu item and make sure the current version of the product is showing as

    - GoldenGate Stream Analytics Version19.1.0.0.6
    - Java Version1.8.0_281
    - Superset Version0.17.0

    ![](./images/version.png " ")

3. Click Done.

## Task 2: Review System Settings
1. Again, click on the drop-down menu in the upper right-hand corner of the screen but this time click on System Settings

    ![](./images/systemsetdropdown.png " ")

2. Verify all the connections to Kafka and Spark are set as below.

    ![](./images/systemsettings.png " ")

## Task 3: Perform User Management
1. Click on the User Management in the navigation bar to the left and **Add User**:

    `osauser/osauser`

2. Confirm the password and then click on Create, verify that the new user got created and Save.  Click on `(X)` to get out of System Settings.

    ![](./images/adduser.png " ")

## Task 4: Review Catalog

1. Click on the Catalog menu on the top right-hand corner of the home page:

    ![](./images/catalog.png " ")

    Notice there are no resources currently available.

    ![](./images/emptycatalog.png " ")

2. Navigate back to the Home page again.

## Task 5: Check out Import

1. Click on Import in Distributed Intelligence for IOT region and see the message that it was imported Successfully.

    ![](./images/homeimport.png " ")

2. Go to the Catalog page. At the bottom right corner of the page click on the drop down to Show 25 resource.

    ![](./images/show25.png " ")

3. Verify that 14 of 14 Resources have been imported into the catalog. All the resource imported should be tagged with IOT Sample, IOT. The tags help identify the category of each resource.

    ![](./images/resourcesimported.png " ")

## Task 6: View "Show Me (Nav Bar)"

1. Click on the box next to the Catalog and then click on *View All* on the left Show Me nav bar to hide all the resources. All the resources in the Show Me nav bar should now be unchecked and you should see 0 of 0 Resources in the main page

    ![](./images/hideallresources.png " ")


We can now check individual resource types and only see them listed in
the main page.

## Task 7: View Connections

1. Click on the Connections on the left nav bar and verify that only two types of connections are visible.

    ![](./images/twoconnections.png " ")

2. Click on the LocalMySQLDB connection. This is a connection to the local MySQL database. We are going to use this connection later in the lab. Verify that it is the Connection Type of Generic Database then click Next.

    ![](./images/localmysqldb.png " ")

3. Verify the following:

    Database: "MySql"

    Jdbc url: *`jdbc:mysql://OSA_DEMO:Welcome123!@localhost:3306/OSA_DEMO`*

4. Then click on Test connection and make sure the connection is successful. Click on the Cancel button. Do not save this connection here.

    ![](./images/testdbconnection.png " ")

5. Now click on the LocalKafka connection. This is a different type of a connection to the local Kafka environment. We are going to use this connection and the topics later in the lab. Verify that it is the Connection Type of Kafka then click Next.

    ![](./images/localkafka.png " ")

6. You should see the Edit Connection screen for Type:Kafka. Verify that Zookeepers is running in the local server localhost. Zookeepers are the servers that are going to manage our local Kafka environments; in this case just one node in the local environment. Leave all the other settings as default and click on Test connection and make sure the connection is Successful. Click on Cancel button. Do not save this kafka connection.

    ![](./images/editkafkaconnection.png " ")

## Task 8: Review Streams

1. In the left nav bar uncheck the Connections resource and check Streams instead and verify that only VendingMachineStream is visible.

    ![](./images/streamsvisible.png " ")

2. Click on the VendingMachineStream and verify the Source Details, Parameter File and Type and the Shape for this stream.

3. For this lab we are going to read a stream of data from file `VendingMachine.csv` with Loop set to true simulating a constant stream of data. Do NOT make any changes to any sections here at this time.

4. Click on the Edit to the right of Source Type Parameters: File. Verify the file format as CSV and that the Loop flag is turned on. Click Next.

    ![](./images/vmstreamdetails.png " ")

    ![](./images/vmeditstream1.png " ")

5. Verify the settings in the Data Format screen then click Next

    ![](./images/vmeditstream2.png " ")

6. In the Shape page Infer Shape should be selected which means that the fields and types are inferred from the source csv file. Verify the field name and types then click Cancel then close `(X)` out the following screen.

    ![](./images/vmeditstream3.png " ")

## Task 9: Review References

References are typically database tables that might be used to enrich a stream of data.

1. On the left nav bar make sure References are checked only. On the main screen only MachineDetails should be visible.

    ![](./images/referencesvisible.png " ")

2. Click on the MachineDetails. Verify that all the param settings then click on Edit to the right of Source Type Parameters: Database Table. Do NOT edit any sections at this time.

    [](./images/editmachinedetails1.png " ")

3. In the Source Details note that Connection is set to LocalMySQLDB as we saw earlier in the lab. Click Next.

    ![](./images/editmachinedetails2.png " ")

4. In the Shape page notice that all the table columns and their types,(i.e. shape) are all set correctly. Do not save, click Cancel.

    ![](./images/editmachinedetails3.png " ")

5. In the next page click on `(X)` and exit.

## Task 10: Review Targets

A `Target` is a destination environment downstream that is usually used when we are finished with analysis. In this version the following targets are supported: AWS S3, Coherence, Database Table, Elastic Search, HBase, HDFS, Hive, Ignite Cache, JMS, Kafka, MongoDB, NFS, Notification, Object Storage and REST.


1. On the left nav bar make sure Targets are checked only. On the main screen only NotifyMaintenance and ReplenishAlert targets should be visible. Click on the NotifyMaintenance. Do NOT edit any sections at this time.

    ![](./images/targetsvisible.png " ")

2. In the Type Properties page make sure the target name and type are set correctly as NotifyMaintenance and Kafka and click Next.

    ![](./images/edittarget1.png " ")

3. In the Target Details page notice the Connection is set to LocalKafka as we saw earlier with the Topic name as HighTempMachines. Make sure the Data Format for this topic is set JSON. Notice there are other data formats like csv and avro.  Click Next.

    ![](./images/edittarget2.png " ")

4. In the next page make sure the Create nested json object is checked and click Next.

5. In the Shape page notice that all the table columns and their types, i.e., shape are all set correctly (about 19 fields). Do not save, click Cancel.

    ![](./images/edittarget3.png " ")


6. Click on the ReplenishAlert target and repeat all the steps the same as NotifyMaintenance target. Do not make any changes to these targets. This target should have (about 12 fields).

You may now [proceed to the next lab](#next).

## Learn More
* [GoldenGate Stream Analytics](https://www.oracle.com/middleware/technologies)

## Rate this Workshop
When you are finished don't forget to rate this workshop!  We rely on this feedback to help us improve and refine our LiveLabs catalog.  Follow the steps to submit your rating.

1.  Go back to your **workshop homepage** in LiveLabs by searching for your workshop and clicking the Launch button.
2.  Click on any of the **Brown Buttons** to re-access the workshop  

    ![](https://oracle-livelabs.github.io/common/labs/cloud-login/images/workshop-homepage-2.png " ")

3.  Click **Rate this workshop**

    ![](https://oracle-livelabs.github.io/common/labs/cloud-login/images/rate-this-workshop.png " ")

If you selected the **Green Button** for this workshop and still have an active reservation, you can also rate by going to My Reservations -> Launch Workshop.

## Acknowledgements

* **Author** - Hadi Javaherian, Solution Engineer
* **Contributors** - Shrinidhi Kulkarni, Meghana Banka, Rene Fontcha
* **Last Updated By/Date** - Ashish Kumar, LiveLabs Platform, NA Technology, July 2021
