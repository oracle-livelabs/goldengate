# Create the database connections

## Introduction

In this lab, you learn to create Oracle GoldenGate Free database connections.

Estimated time: 15 minutes

### About Oracle GoldenGate Free connections

An Oracle GoldenGate Free connection contains the network connectivity information for Oracle Database sources and targets.

### Objectives

In this lab, you will:
* Login to the Oracle GoldenGate Free console 
* Create the source and target connections


## Task 1: Log in to GoldenGate Free

1. In your lab instructions, click **View Login Info**.

    ![View login info ](./images/01-01-login-info.png " ")

2. On the Reservation Information page, under Terraform Values, copy the **OGG Public IP** and paste the IP in a new window.

    ![Terraform values](./images/01-02-terraform.png " ")

    > **Note:** Add `https://` before the IP address if you're having trouble connecting. 

3. In the GoldenGate Free welcome page, enter **oggadmin** for your Username. For password, paste the **Global Password** from the Reservation Information. Click **Log in**. 

    ![Login screen](./images/01-03-login.png " ")

## Task 2: Create the source connection

1.  On the GoldenGate Free **Home** page, click **Create connection**.

    ![GoldenGate Free Home page](./images/02-01-create-connection.png " ")

2.  The Create database connection configuration panel consists of six pages. On the General information page, for Name, enter **sourceDB** and optionally, a description.

3.  Click **Next**.

    ![General information page](./images/02-03-general-info.png " ")

4.  On the Connection details page, for Connection role select **Source**.

5.  For the Connection type dropdown, select **Basic**.

6.  For Hostname, enter the **DB Free E Private IP** found in the Reservation Information.

7.  For Port, enter **1521**.

8. For Database type, select **Pluggable database (PDB) in Oracle Database 21c or above**.

9.  For Pluggable database service name (PDB), enter **Freepdb1**.

10.  Select **SYSDBA privileges available**.

    ![SYSDBA priviledges](./images/02-10-sysdba-priv.png " ")

11. Once you click on the SYSDBA checkbox, an Administrator Credentials pop up will appear. For User with admin privilege, enter `sys`. For password, paste the **Global Password** from the Reservation Information. Click **OK**.

    ![Administrator credentials page](./images/02-11-admin-credentials.png " ")

12. You're brought back to the Connection details page. Click **Next**.

    ![Connection details page](./images/02-12-connection-details.png " ")

13. On the GoldenGate admin user page, enter your username, **ggadmin**, password, and select **Add GoldenGate admin database user**. For password, paste the **Global Password** from the Reservation Information.

14. Click **Next**.

    ![GoldenGate admin user page](./images/02-14-gg-admin-user.png " ")

15. On the Configuration page, click **Run analysis**.

    ![Click run analysis](./images/02-15-run-analysis.png " ")

16. Review the script by scrolling through and reviewing it completely. Select **I have reviewed the SQL script and am aware of the changes it will apply to my database**.

17. Click **Run SQL**.

    ![Click Run SQL](./images/02-17-run-sql.png " ")

18. Review the Prepare database result. Click **OK**.

    ![Prepare database result](./images/02-18-preapre-db-result.png " ")

19. Click **Next**.

20. On the Confirmation page, review the details, and then click **Create**.

    ![Confirmation details](./images/02-20-confirmation-details.png " ")

## Task 3: Create the target connection

1.  On the Database connections page, click **Create database connection**.

	![Create database connection](./images/03-01-create-connection.png " ")

2.  The Create database connection configuration panel consists of six pages. On the General information page, for Name, enter **targetDB** and optionally, a description.

3.  Click **Next**.

    ![General information page](./images/03-03-general-info.png " ")

4.  On the Connection details page, for Connection role select **Target**.

5.  For the Connection type dropdown, select **Basic**.

6.  For Hostname, enter the **DB Free W Private IP** found in the Reservation Information.

7.  For Port, enter **1521**.

8. For Database type, select **Pluggable database (PDB) in Oracle Database 21c or above**.

9.  For Pluggable database service name (PDB), enter **Freepdb1**.

10.  Select **SYSDBA privileges available**.

    ![SYSDBA priviledges](./images/03-10-sysdba-priv.png " ")

11. Once you click on the SYSDBA checkbox, an Administrator Credentials pop up will appear. For User with admin privilege, enter `sys`. For password, paste the **Global Password** from the Reservation Information. Click **OK**.

    ![Administrator credentials page](./images/02-11-admin-credentials.png " ")

12. Click **Next**.

    ![Connection details page](./images/03-12-connection-details.png " ")

13. On the GoldenGate admin user page, enter your username, **ggadmin**, password, and select **Add GoldenGate admin database user**. For password, paste the **Global Password** from the Reservation Information.

14. Click **Next**.

    ![GoldenGate admin user page](./images/02-14-gg-admin-user.png " ")

15. On the Configuration page, click **Run analysis**.

    ![Click run analysis](./images/02-15-run-analysis.png " ")

16. Review the script by scrolling through and reviewing it completely. Select **I have reviewed the SQL script and am aware of the changes it will apply to my database**.

17. Click **Run SQL**.

    ![Click Run SQL](./images/02-17-run-sql.png " ")

18. Review the Prepare database result. Click **OK**.

    ![Prepare database result](./images/02-18-preapre-db-result.png " ")

19. Click **Next**.

20. On the Confirmation page, review the details, and then click **Create**.

    ![Confirmation details](./images/03-20-confirmation-details.png " ")

**Proceed to the next lab.**

## Learn more

* [Create an Oracle Database connection](https://docs-uat.us.oracle.com/en/middleware/goldengate/free/21/uggfe/create-database-connections.html#GUID-F752AD5C-20E4-4397-A5C2-8066CB80A2E6)
* [About the configuration script](https://docs-uat.us.oracle.com/en/middleware/goldengate/free/21/uggfe/create-database-connections.html#GUID-3C6691FA-2C40-445D-8A1A-A7B708085DD9)

## Acknowledgements
* **Author** - Katherine Wardhana, User Assistance Developer
* **Contributors** -  Alex Lima, Database Product Management & Jenny Chan, Consulting User Assistance Developer, Database User Assistance 
* **Last Updated By/Date** - Katherine Wardhana, September 2023

