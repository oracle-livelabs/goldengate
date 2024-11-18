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

    - [gg23ai-license-stack.zip](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/goldengate-library/gg23ai-license-stack.zip)

2. Save the file in your downloads folder.

    - You will use this file in the next lab section to start the Terraform Resource Manager, spinning up the Virtual Network and the Compute instance.

We strongly recommend using this stack to create a self-contained/dedicated VCN with your instance(s). Skip to *Step 3* to follow our recommendations. If you would rather use an exiting VCN then proceed to the next step as indicated below to update your existing VCN with the required Egress rules.

## Task 2: Adding Security Rules to an Existing VCN

This workshop requires a certain number of ports to be available, a requirement that can be met by using the default ORM stack execution that creates a dedicated VCN. In order to use an existing VCN the following ports should be added to Egress rules

| Port           |Description                            |
| :------------- | :------------------------------------ |
| 22             | SSH                                   |
| 443            | NGINX Proxy (https)                   |
| 6080           | noVNC Remote Desktop                  |
| 10000-10400    | GoldenGate consoles                   |

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
- **Last Updated** - Jan Leemans, June 2024
