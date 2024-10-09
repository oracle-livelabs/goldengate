# Create the Extract process and use Oracle Data Pump to export data

## Introduction
This lab instructs you to use the OCI GoldenGate deployment console to add transaction information to the source database, add a checkpoint table to the target database, add and run an Extract, and instantiate the target database using Oracle Data Pump.

Estimated time: 25 minutes

Watch the video below for a quick walk through of the lab.
[Watch the video](videohub:1_j398evq1)

### About the Extract process
An Extract is a process that extracts, or captures, data from a source database.

### Objectives
In this lab, you learn to:
* Log in to the OCI GoldenGate deployment console
* Connect to the source database to add transaction information
* Connect to the target database to add a checkpoint table
* Add and run an Extract
* Export data from the source database using Oracle Data Pump

### Prerequisites

* This lab assumes that you completed all preceding labs
* Your deployment is in the Active state.

## Task 1: Launch the OCI GoldenGate deployment console

[](include:01-launch-console-23ai.md)

## Task 2: Add Transaction Data and a Checkpoint Table

> **Note:** Ensure that you enable supplemental logging before adding an Extract or you may encounter errors. If you encounter errors, delete and add the Extract before trying again.

1.  Open the navigation menu and then click **Configuration**.

    ![Administration Service navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/03-01-nav-config.png " ")

2.  Click **Connect to database SourceATP**.

    ![Credentials list with Connect to database SourceATP highlighted](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/03-02-connect-source.png " ")

3.  Next to **TRANDATA Information** click **Add TRANDATA** (plus icon).

    ![Add TRANDATA](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/03-03-trandata.png " ")

4.  For **Schema Name**, enter `SRC_OCIGGLL`, and then click **Submit**.

    ![Schema Name field populated with SRC_OCIGGLL](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/03-04-schema-name.png " ")

5.  To verify, click **Search TRANDATA**, and then enter `SRC_OCIGGLL` into the Search field and click **Search**.

    ![Search icon highlighted](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/03-05-search.png " ")

    ![SRC_OCIGGLL entered in search field and search results returned](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/03-05-trandata.png " ")

6.  Click **Connect to database TargetADW**.

    ![Credentials list with Connect to database TargetADW highlighted](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/03-06-connect-targetadw.png " ")

7.  Next to Checkpoint, click **Add Checkpoint**.

    ![Add Checkpoint highlighted](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/03-07-add-checkpoint.png " ")

8.  For **Checkpoint Table**, enter `"SRCMIRROR_OCIGGLL"."CHECKTABLE"`, and then click **Submit**.

    ![Populated Checkpoint table field and submit button highlighted](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/03-08-checktable.png " ")

To return to the GoldenGate Deployment Console Home page, click **Overview** in the left navigation.

## Task 3: Add and Run an Extract

1.  On the OCI GoldenGate Deployment Console Home page, click **Add Extract** (plus icon).

    ![Click Add Extract](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/04-01-ggs-add-extract.png " ")

2.  On the Add Extract page, select **Integrated Extract**, and then click **Next**.

    ![Add Extract page with Integrated Extract highlighted](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/04-02-int-extract.png " ")

3.  For **Process Name**, enter UAEXT.

4.  For **Trail Name**, enter E1.

    ![Add Extract - Basic Information](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/04-04-ggs-basic-info.png " ")

5.  Under **Source Database Credential**, for **Credential Domain**, select **OracleGoldenGate**.

6.  For **Credential Alias**, select the **SourceATP**.

    ![Add Extract - Source Database Credential](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/04-06-ggs-src-db-credential.png " ")

7.  Under Managed Options, enable **Critical to deployment health**.

    ![Critical to deployment health highlighted](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/04-07-dephealth.png " ")

8.  Click **Next**.

9.  On the Parameter File page, in the text area, add a new line to the existing text and add the following:

    ```
    <copy>-- Capture DDL operations for listed schema tables
    ddl include mapped

    -- Add step-by-step history of ddl operations captured
    -- to the report file. Very useful when troubleshooting.
    ddloptions report

    -- Write capture stats per table to the report file daily.
    report at 00:01

    -- Rollover the report file weekly. Useful when IE runs
    -- without being stopped/started for long periods of time to
    -- keep the report files from becoming too large.
    reportrollover at 00:01 on Sunday

    -- Report total operations captured, and operations per second
    -- every 10 minutes.
    reportcount every 10 minutes, rate

    -- Table list for capture
    table SRC_OCIGGLL.*;</copy>
    ```

    ![Copied and pasted script on the parameter file page](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/04-09-params.png " ")

10. Click **Create**. You return to the OCI GoldenGate Deployment Console Home page.

11. In the UAEXT **Action** menu, select **Start**. In the Confirm Action dialog, click **OK**.

    ![Start Extract](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/04-11-ggs-start-extract.png " ")

    The yellow exclamation point icon changes to a green checkmark.

    ![Extract started](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/04-11-ggs-extract-started.png " ")

## Task 4: Check for long running transactions

1.  In the source database SQL window, enter the following script, and then click **Run Statement**:

    ```
    <copy>select start_scn, start_time from gv$transaction where start_scn < (select max(start_scn) from dba_capture);</copy>
    ```

    If the query returns any rows, then you must locate the transaction's SCN and then either commit or rollback the transaction.

    ![Run statement and no query results highlighted](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/05-01-sql.png " ")

## Task 5: Export data using Oracle Data Pump (ExpDP)

Before using Oracle Data Pump to export data from the source database, first create an Oracle Object Store bucket, then create yourself a Credential Token, and then use these resources to create a credential in ATP.

1.  From the Oracle Cloud Console navigation menu (hamburger icon), click **Storage**, and then **Buckets**.

    ![Object Storage bucket in Oracle Cloud navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/06-01-storage-buckets.png " ")

2.  On the **Buckets in &lt;compartment-name&gt;** page, click **Create Bucket**.

    ![Buckets in compartment page](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/06-02-create-bucket.png " ")

3.  In the **Create Bucket** panel, enter a unique name, such as `Bucket-<user>,` and then click **Create**.

    ![Create Bucket panel](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/06-03-bucket.png " ")

4.  From the list of buckets, click the bucket you created. You're brought to the bucket Details page.

5.  On the bucket details page, under Objects, click **Upload**.

6.  Enter a prefix, select a file (a simple text file will do), and then click **Upload**.

7.  Close the panel. The object you uploaded appears in the Objects list.

8.  In the Objects list, click the three dots icon for your object, and then select **View Object Details**.

  ![View Object Details](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/06-08-view-details.png)

9.  In the Object Details panel, copy the URL Path (URI) up the object name and paste it into a text editor.

  ![Object URL Path](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/06-09-url-path.png)

    The bucket URI should match the following syntax:

    ```
    <copy>https://objectstorage.&lt;region&gt;.oraclecloud.com/n/&lt;namespace&gt;/b/&lt;bucket-name&gt;/o/</copy>
    ```

10. In the Oracle Cloud Console global header, click **Profile** (user icon), and then select your username.

    ![Profile menu](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/06-10-profile.png " ")

11. On the User Details page, under **Resources**, click **Auth Tokens**, and then click **Generate Token**.

    ![Resources on User Details page](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/06-11-auth-token.png " ")

12. In the Generate Token dialog, enter a description, and then click **Generate Token**.

    ![Generate Token dialog](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/06-12-generate-token.png " ")

13. Click **Copy**, and then click **Close**.

    > **Note:** Paste the token to a text editor for use in the next step.

    ![Copy highlighted](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/06-13-copy-token.png " ")

14. In the source database SQL window, enter the following script, replace the placeholders with your user name (UPPERCASE) and token value, and then click **Run Statement**:

    ```
    <copy>BEGIN
  DBMS_CLOUD.CREATE_CREDENTIAL(
    credential_name => 'ADB_OBJECTSTORE',
    username => '<identity-domain>/<user-name>',
    password => '<token>'
  );
  END;</copy>
    ```

    > **Note:** If you're using a federated user, then the username should be in the following format: `OracleIdentityCloudService/<user-name>`


    ![SQL worksheet](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/06-14-create-credential.png " ")

15. Run the following script to create the Export Data job using Oracle Data Pump ExpDP. Ensure that you replace the Object Store URI (`https://objectstorage.<region>.oraclecloud.com/n/<namespace>/b/<bucket-name>/o/`) with **your URI** from step 5. `SRC_OCIGGLL.dmp` is a file that will be created when this script runs. 

    ```
    <copy>DECLARE
    ind NUMBER;              -- Loop index
    h1 NUMBER;               -- Data Pump job handle
    percent_done NUMBER;     -- Percentage of job complete
    job_state VARCHAR2(30);  -- To keep track of job state
    le ku$_LogEntry;         -- For WIP and error messages
    js ku$_JobStatus;        -- The job status from get_status
    jd ku$_JobDesc;          -- The job description from get_status
    sts ku$_Status;          -- The status object returned by get_status

    BEGIN
    -- Create a (user-named) Data Pump job to do a schema export.
    h1 := DBMS_DATAPUMP.OPEN('EXPORT','SCHEMA',NULL,'SRC_OCIGGLL_EXPORT','LATEST');

    -- Specify a single dump file for the job (using the handle just returned
    -- and a directory object, which must already be defined and accessible
    -- to the user running this procedure.
    DBMS_DATAPUMP.ADD_FILE(h1,'https://objectstorage.&lt;region&gt;.oraclecloud.com/n/&lt;namespace&gt;/b/&lt;bucket-name&gt;/o/SRC_OCIGGLL.dmp','ADB_OBJECTSTORE','100MB',DBMS_DATAPUMP.KU$_FILE_TYPE_URIDUMP_FILE,1);

    -- A metadata filter is used to specify the schema that will be exported.
    DBMS_DATAPUMP.METADATA_FILTER(h1,'SCHEMA_EXPR','IN (''SRC_OCIGGLL'')');

    -- Start the job. An exception will be generated if something is not set up properly.
    DBMS_DATAPUMP.START_JOB(h1);

    -- The export job should now be running. In the following loop, the job
    -- is monitored until it completes. In the meantime, progress information is displayed.
    percent_done := 0;
    job_state := 'UNDEFINED';
    while (job_state != 'COMPLETED') and (job_state != 'STOPPED') loop
      dbms_datapump.get_status(h1,dbms_datapump.ku$_status_job_error + dbms_datapump.ku$_status_job_status + dbms_datapump.ku$_status_wip,-1,job_state,sts);
      js := sts.job_status;

    -- If the percentage done changed, display the new value.
    if js.percent_done != percent_done
    then
      dbms_output.put_line('*** Job percent done = ' || to_char(js.percent_done));
      percent_done := js.percent_done;
    end if;

    -- If any work-in-progress (WIP) or error messages were received for the job, display them.
    if (bitand(sts.mask,dbms_datapump.ku$_status_wip) != 0)
    then
      le := sts.wip;
    else
      if (bitand(sts.mask,dbms_datapump.ku$_status_job_error) != 0)
      then
        le := sts.error;
      else
        le := null;
      end if;
    end if;
    if le is not null
    then
      ind := le.FIRST;
      while ind is not null loop
        dbms_output.put_line(le(ind).LogText);
        ind := le.NEXT(ind);
      end loop;
    end if;
  end loop;

  -- Indicate that the job finished and detach from it.
  dbms_output.put_line('Job has completed');
  dbms_output.put_line('Final job state = ' || job_state);
  dbms_datapump.detach(h1);
END;</copy>
    ```

    ![SQL worksheet Run Script highlighted](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/06-15-sql-return.png " ")

> **Note:** The Script Output displays what looks like an error, but it reports "Job has completed successfully." You can also review the **DBMS Output** tab to see the same message displayed.

You may now **proceed to the next lab.**

## Learn more

* [Add an Extract for Oracle Database](https://docs.oracle.com/en/cloud/paas/goldengate-service/eeske/index.html)

## Acknowledgements
* **Author** - Katherine Wardhana, User Assistance Developer
* **Contributors** -  Jenny Chan, Consulting User Assistance Developer, Database User Assistance; Julien Testut, Database Product Management
* **Last Updated By/Date** - Katherine Wardhana, October 2024
