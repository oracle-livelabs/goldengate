# Introduction

## About this Workshop

Oracle GoldenGate, the industry-leading data replication, and integration software is now available as a fully-managed, cloud-native service on Oracle Cloud Infrastructure. This workshop guides you through how to use  OCI GoldenGate as the source deployment to extract data from Autonomous Transaction Processing (ATP) and deliver the data into a Kafka node running on an OCI Compute Instance. You can set up the Kafka node through Terraform and the advertised listener is automatically assigned to the compute node's Public IP. Kafka and Zookeeper services start with the terraform as well. OCI GoldenGate creates the topics automatically.

Estimated time: 60 minutes

![Work environment architecture](images/architecture.gif)

### Prerequisites

To successfully complete this LiveLab, you should have:
* Experience with Oracle Database
* Familiarity with Oracle GoldenGate is helpful, but not required
* Familiarity with Oracle Cloud Infrastructure is helpful, but not required
* An Oracle Cloud Account
* Access to OCI Cloud Shell
* Access to OCI Terraform
* 1 OCPU and 1 TB storage for the source Autonomous Transaction Processing (ATP) database
* Virtual machine for Apache Kafka - VM.Standard1.1

You may now **proceed to the first lab**.

## Learn more

* [About Oracle Cloud Infrastructure GoldenGate](https://docs.oracle.com/en/cloud/paas/goldengate-service/druyg/index.html#articletitle)
* [Take an interactive tour of OCI GoldenGate](https://apexapps.oracle.com/pls/apex/f?p=44785:112:0::::P112_CONTENT_ID:29986)

## Acknowledgements
* **Author** - Madhu Kumar S, Senior Solution Engineer, AppDev and Integration
* **Contributors** -  Denis Gray, Database Product Management; Jenny Chan, Consulting User Assistance Developer, Database User Assistance; Katherine Wardhana, User Assistance Developer
* **Last Updated By/Date** - Katherine Wardhana, User Assistance Developer, December 2023
