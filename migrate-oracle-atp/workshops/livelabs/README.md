# Welcome to Migrate HR database workshop

## Introduction

In this workshop, we will migrate the sample HR database application to an Autonomous Database in Oracle Cloud Infrastructure using the new cloud-native GoldenGate service. The purpose of this workshop is to show the simple and yet efficient way to migrate a database to Oracle Cloud. This workshop consists of 4 labs.  We will use the GoldenGate service for the database migration to designated resources in Oracle Cloud Infrastructure in the first three labs. in the last **Bonus** lab, we will create an HR application in APEX

*Estimated total Workshop Time*: 1.5 hours

### About HR schema

We are about to migrate Oracle's famous sample schema HR to the Oracle Autonomous Database. This sample database schema will represent our on-premises source database and consists of multiple tables. 

### About GoldenGate Service

Oracle Cloud Infrastructure (OCI) GoldenGate is a managed service providing a real-time data mesh platform, which uses replication to keep data highly available, and enabling real-time analysis. You can design, execute and monitor their data replication and stream data processing solutions without the need to allocate or manage compute environments, it is a fully managed service. Today we will explore its capabilities and migrate our source database to target.

### About Autonomous Database

This is self-driving, converged, multimodel database and machine learning-based automation takes care of its operational lifecycle management. Auto-provisioning and auto-tuning to simplify the creation and optimization of all data stores in the cloud. You can start with the lowest cost and commitment, and autoscale as the business grows. Today we will use this 19c database as our target database.

### About Application Express (APEX)

First of all Oracle Application Express (APEX) is a low-code development platform that enables you to build scalable, secure enterprise apps, with world-class features, that can be deployed anywhere. Also, APEX is a built-in tool of the Autonomous Database and we will explore the best capabilities in the bonus step.

### About Terraform 

Terraform is an open-source tool that allows you to manage programmatically, version, and persist infrastructure through the "infrastructure-as-code" model.
The Oracle Cloud Infrastructure (OCI) Terraform provider is a component that connects Terraform to the OCI services that you want to manage. We will use it as our infrastructure orchestration to deploy all necessary resources.

### Objectives

In this workshop you will :
* Explore Cloud-Shell, web-based terminal
* Benefit from OCI terraform provider
* Explore OCI compute service
* Understand the migration flow of GoldenGate
* Explore Autonomous Database and its capabilities
* Dive into APEX low-code application development