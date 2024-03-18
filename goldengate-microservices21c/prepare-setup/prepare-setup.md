# Prepare Setup

## Introduction

This lab will show you how to download the Oracle Resource Manager (ORM) stack zip file needed to setup the resource needed to run this workshop. This workshop requires a compute instance and a Virtual Cloud Network (VCN).

*Estimated Lab Time*: 15 mins

### Objectives

- Download ORM stack
- Configure an existing Virtual Cloud Network (VCN)

### Prerequisites

This lab assumes you have:

- An Oracle Free Tier or Paid Cloud account

## Task 1: Download Oracle Resource Manager (ORM) stack zip file

1. Click on the link below to download the Resource Manager zip file you need to build your environment:

    - [ll-orm-mkplc-freetier.zip](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/goldengate-library/ll-orm-mkplc-freetier.zip)

2. Save in your downloads folder.

    ***TEMPORARY ACTIVITIES AWAITING IMAGE AVAILABILITY ON MARKETPLACE***

    As the lab image is not yet available on marketplace, some extra steps are required to run this lab.  It is assumed you are familiar with OCI to perform these steps, no detailed screenshots are provided:

    - Unzip the stack zip file on you local machine
    - Create a new Custom Compute image, importing it using [this Object Storage URL](https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/siH5t5NlLNbwypWi8aDZiEPH_o_dKg4vmH5dYkql1rS4-yw845dK2dLdFoFkXqEk/n/oractdemeabdmautodb/b/bucket-20231204-1409/o/gg21c-livelab-image-20231221-1415)
    - Copy the OCID of the new Custom Image you just created
    - Edit the **variables.tf** file, and replace the OCID image ID on line 32 with the new one you just created
    - Zip the altered stack definition into a new zip file
    - You can now continue the lab from here, using the new zip file you just created

We strongly recommend using this stack to create a self-contained/dedicated VCN with your instance(s). Skip to *Step 3* to follow our recommendations. If you would rather use an exiting VCN then proceed to the next step as indicated below to update your existing VCN with the required Egress rules.

## Task 2: Adding Security Rules to an Existing VCN

This workshop requires a certain number of ports to be available, a requirement that can be met by using the default ORM stack execution that creates a dedicated VCN. In order to use an existing VCN the following ports should be added to Egress rules

| Port        | Description          |
| :---------- | :------------------- |
| 22          | SSH                  |
| 443         | NGINX Proxy (https)  |
| 16000       | GGMA Admin Server    |
| 6080        | noVNC Remote Desktop |
| 10000-10400 | GoldenGate consoles  |

1. Go to *Networking >> Virtual Cloud Networks*
2. Choose your network
3. Under Resources, select Security Lists
4. Click on Default Security Lists under the Create Security List button
5. Click Add Ingress Rule button
6. Enter the following:
    - Source CIDR: 0.0.0.0/0
    - Destination Port Range: *Refer to above table*
7. Click the Add Ingress Rules button

## Task 3: Setup Compute

Using the details from the two steps above, proceed to the lab *Environment Setup* from the menu on the left to setup your workshop environment using Oracle Resource Manager (ORM) and one of the following options:

- **Task 1A: Create Stack: Compute + Networking** (Advised)

    or

- **Task 1B: Create Stack: Compute only** with an existing VCN where security lists have been updated as per *Step 2* above
    
You may now **proceed to the next lab**.

## Acknowledgements

- **Author** - Jan Leemans, December 2023
- **Contributors** - Carmelo Millan
- **Last Updated By/Date**
