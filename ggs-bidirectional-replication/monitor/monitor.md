# Monitor Extracts and Replicats

## Introduction

This lab walks you through the steps to monitor the Extract and Replicat processes that were created and run in the previous lab.

Estimated Lab Time: 2 minutes

### About Performance Monitoring

Monitoring the performance of your GoldenGate instance ensures that your data replication processes are running smoothly and efficiently. You can monitor performance in both the Oracle Cloud Infrastructure (OCI) GoldenGate Deployment Console as well as in the Oracle Cloud Console on the Deployment Details page.

### Objectives

In this lab, you will:
* View charts and statistics using the Performance Metrics Server in the GoldenGate deployment console
* Use Metrics on the Deployment Details page in the Oracle Cloud Console to determine overall instance health and utilization.

### Prerequisites

In order to complete this lab, you should have completed the preceding lab and have both an Extract and Replicat running.

## Task 1: Use the Performance Metrics Server

1. In the GoldenGate deployment console navigation menu, expand **Services**, then **Performance Metrics Service**.

    ![Performance Metrics Service page - EXT highlighted](./images/01-01-perf-metric-serv.png " ")

    > **Note:** You can also view performance details for the Administration, Distribution, and Receiver Services, as well as any other processes created.

2. On the Metrics page, you can view real time Process and Thread Performance, Status and Configuration, and Performance Metrics Statistics.

    ![Performance Metrics Service](./images/01-02--stats.png " ")


## Task 2: View GoldenGate Metrics in the Oracle Cloud console

[](include:03-viewing-gg-metrics-console.md)

## Learn More

* [Monitor performance using the deployment console](https://docs.oracle.com/en/cloud/paas/goldengate-service/alllr/)
* [Monitor performance in the Oracle Cloud console](https://docs.oracle.com/en/cloud/paas/goldengate-service/vddvk/)

## Acknowledgements
* **Author** - Jenny Chan, User Assistance Development Manager
* **Contributors** -  Julien Testut, Database Product Management; Katherine Wardhana, User Assistance Developer
* **Last Updated By/Date** - Jenny Chan, March 2026
