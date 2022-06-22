# Prepare setup

## Introduction
This lab will show you how to download the Oracle Resource Manager (ORM) stack zip file to set up the resource needed to run this workshop. This workshop requires a compute instance and a Virtual Cloud Network (VCN).

### Objectives
-   Download ORM stack.
-   Configure an existing Virtual Cloud Network (VCN).


## Task 1: Download Oracle Resource Manager (ORM) stack zip file
1.  Click the link below to download the Resource Manager zip file you need to build your environment:

    - [ggma-mkplc-freetier.zip](https://objectstorage.us-ashburn-1.oraclecloud.com/p/JX8hrs75mnqH1ZFZoJ5JgQvD9qZQRKf-KFsQ_K7JsyKWt-rbXDgHLS_uVl-nDQZ2/n/natdsecurity/b/stack/o/ggma-mkplc-freetier.zip)

2.  Save in your downloads folder.

We strongly recommend using this stack to create a self-contained/dedicated VCN with your instance(s). Skip to *Step 3* to follow our recommendations. If you would rather use an exiting VCN then proceed to the next step as indicated below to update your existing VCN with the required Egress rules.

## Task 2: Adding Security Rules to an Existing VCN   
This workshop requires a certain number of ports to be available, a requirement that can be met by using the default ORM stack execution that creates a dedicated VCN. In order to use an existing VCN the following ports should be added to Egress rules

| Port           |Description                            |
| :------------- | :------------------------------------ |
| 22             | SSH                                   |
| 9010           | Administration Service                |
| 6080           | noVNC Remote Desktop                  |

1.  Go to *Networking >> Virtual Cloud Networks*
2.  Choose your network.
3.  Under Resources, select Security Lists.
4.  Click **Default Security Lists** under **Create Security List**.
5.  Click **Add Ingress Rule**.
6.  Enter the following:  
    - Source CIDR: 0.0.0.0/0
    - Destination Port Range: *Refer to above table*
7.  Click **Add Ingress Rule**.

## Task 3: Setup Compute   
Using the details from the two steps above, proceed to the lab *Environment Setup* from the menu on the right to setup your workshop environment using Oracle Resource Manager (ORM) and one of the following options:
  -  Create Stack:  *Compute + Networking*
  -  Create Stack:  *Compute only* with an existing VCN where security lists have been updated as per *Step 2* above

You may now **proceed to the next lab**.

## Acknowledgements
* **Author** - Rene Fontcha, LiveLabs Platform Lead, NA Technology, September 2020
* **Contributors** - Madhu Kumar, Rene Fontcha
* **Last Updated By/Date** - Anuradha Chepuri, June 2022
