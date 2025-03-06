# Cascading Topology in Oracle GoldenGate


## Introduction

This lab describes how to use Admin Client to run OBEY scripts <strong>`add_replication_reporting.oby`</strong>, which would automate the set up of Oracle GoldenGate processes on the source (<strong>`depl_north`</strong>) and target (<strong>`depl_south`</strong>) deployments. 

Check the business reports using the <strong>`check_replication_reporting.oby`</strong> script. You can use the `source_dml_operations.sh` script to add records to the source database and view the Extract Statistics to confirm that the committed transactions were captured. Then you can run the `source_target_select.sh` script to replicate the changes on the target database. Delete the data replication environment using the <strong>`delete_replication_reporting.oby`</strong>.

The source deployment <strong>`depl_north`</strong> is connected to the <strong>`DBNORTH`</strong> PDB and the <strong>`depl_south`</strong> deployment is connected to the <strong>`DBSOUTH`</strong> PDB. The deployments are already created in the environment. 

Estimated Time: 10 minutes

### Objectives