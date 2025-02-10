Configuration Steps:
Prerequisites
Create JSON Relational Duality Views.
Enable Supplemental Logging for JSON Relational Duality Views
Create an Extract and trail file in Oracle GoldenGate for Oracle deployment.
Add a Data Stream from Oracle GoldenGate Distribution Service
Configure Downstream application as Consumer for GoldenGate Data Stream
Insert change data to the source document/tables for testing.
Consume the Change Data from the Data Stream.

Create JSON Relational Duality Views
====================================
ALTER SESSION SET CONTAINER=pdb; 
CREATE USER JSON_USER IDENTIFIED BY Madhu123# CONTAINER=CURRENT; 

ALTER SESSION SET CONTAINER=pdb; 
CREATE USER JSON_USER IDENTIFIED BY Madhu123# CONTAINER=CURRENT; 


CREATE TABLE JSON_USER.ATTENDEE (
ID NUMBER PRIMARY KEY,
NAME VARCHAR2(100),
COMPANY VARCHAR2(100) );

CREATE TABLE JSON_USER.SESSIONSS (
SESSION_ID VARCHAR2(10) PRIMARY KEY,
SESSION_NAME VARCHAR2(100),
SESSION_TIME TIMESTAMP,
ROOM VARCHAR2(50) );

CREATE TABLE JSON_USER.ATTENDEE_SESSION (
ATTENDEE_ID NUMBER,
SESSION_ID VARCHAR2(10),
PRIMARY KEY (ATTENDEE_ID, SESSION_ID),
FOREIGN KEY (ATTENDEE_ID) REFERENCES JSON_USER.ATTENDEE(ID),
FOREIGN KEY (SESSION_ID) REFERENCES JSON_USER.SESSIONSS(SESSION_ID) );

CREATE TABLE JSON_USER.SPEAKER (
ID NUMBER PRIMARY KEY,
NAME VARCHAR2(100) );

CREATE TABLE JSON_USER.SPEAKER_SESSION (
SPEAKER_ID NUMBER,
SESSION_ID VARCHAR2(10),
PRIMARY KEY (SPEAKER_ID, SESSION_ID),
FOREIGN KEY (SPEAKER_ID) REFERENCES JSON_USER.SPEAKER(ID),
FOREIGN KEY (SESSION_ID) REFERENCES JSON_USER.SESSIONSS(SESSION_ID) );

JSON relational duality view definition
=======================================
CREATE or replace JSON RELATIONAL DUALITY VIEW
JSON_USER.attendeeSchedule AS
SELECT JSON {
'_id': a.ID,
'name': a.NAME,
'company': a.COMPANY
,'schedule'   :
json[  select json{
'ATTENDEE_ID' : ass.ATTENDEE_ID,
'attendee_sess_id' : ass.session_id,
unnest(
select JSON {
'code': s.SESSION_ID,
'session_name': s.SESSION_NAME,
'time': s.SESSION_TIME,
'room': s.ROOM,
'speakers' : json[
select json{'speaker_sess_id' : ss.SESSION_ID,
'speaker_session_speaker_id' : ss.SPEAKER_ID,
unnest(
select json{
'speaker_id' : sp.id,
'speaker_name' : sp.name}
from JSON_USER.speaker sp with insert update nocheck
where sp.id = ss.speaker_id)}
from JSON_USER.speaker_session ss with insert update nocheck
where ss.session_id = s.session_id]}
from JSON_USER.sessionss s with insert update nocheck
where s.SESSION_ID = ass.SESSION_ID)}
from JSON_USER.ATTENDEE_SESSION ass with insert update nocheck
where ass.ATTENDEE_ID = a.id ]}
FROM JSON_USER.ATTENDEE a with insert update delete nocheck;

Enable Supplemental Logging for JSON Relational Duality Views
==============================================================

GG Common user 
CREATE USER c##ggadmin IDENTIFIED BY Madhu123# CONTAINER=all DEFAULT
TABLESPACE USER TEMPORARY TABLESPACE temp;
GRANT RESOURCE to c##ggadmin;
GRANT CREATE SESSION to c##ggadmin;
GRANT CREATE VIEW to c##ggadmin;
GRANT CREATE TABLE to c##ggadmin;
GRANT CONNECT to c##ggadmin CONTAINER=all; 

GRANT ALTER SYSTEM to c##ggadmin;
GRANT ALTER USER to c##ggadmin;
ALTER USER c##ggadmin SET CONTAINER_DATA=all CONTAINER=current;
ALTER USER c##ggadmin QUOTA unlimited ON GG_DATA;
GRANT SELECT ANY DICTIONARY to c##ggadmin;
GRANT SELECT ANY TRANSACTION to c##ggadmin;
EXEC DBMS_GOLDENGATE_AUTH.GRANT_ADMIN_PRIVILEGE('c##ggadmin');
GRANT CONNECT, RESOURCE to c##ggadmin; 
ALTER USER c##ggadmin SET CONTAINER_DATA = all CONTAINER = current;

GRANT OGG_APPLY,OGG_CAPTURE to c##ggadmin; 
GRANT SELECT, INSERT, UPDATE, DELETE on JSON_USER.SPEAKER;
GRANT SELECT, INSERT, UPDATE, DELETE on JSON_USER.ATTENDEE;
GRANT SELECT, INSERT, UPDATE, DELETE on JSON_USER.SESSIONSS;
GRANT SELECT, INSERT, UPDATE, DELETE on JSON_USER.ATTENDEE_SESSION;
pdb user 
ALTER SESSION SET CONTAINER=pdb; 
CREATE USER ggadmin IDENTIFIED BY Madhu123# CONTAINER=CURRENT; 
GRANT CONNECT, RESOURCE to ggadmin; 
GRANT OGG_APPLY,OGG_CAPTURE to ggadmin; 
GRANT SELECT, INSERT, UPDATE, DELETE on HR.EMPLOYEES;


ALTER SYSTEM SET ENABLE_GOLDENGATE_REPLICATION=true;
ALTER DATABASE FORCE LOGGING;
ALTER DATABASE ADD SUPPLEMENTAL LOG DATA;


#169/15551 ಶ್ರೀನೆರಳು 4ನೇ ಬ್ಲಾಕ್ 34 ವಾರ್ಡ್ ಕಂದಾಯಗಿರಿನಗರ ಚಿತ್ರದುರ್ಗ 577501

https://maps.app.goo.gl/qcFBjbb6aAUd98ie6

https://www.invitationbazaar.com/

Contacts
Trond Renshusløkken
Trond Renshusløkken
Hiring Manager
trond.renshuslokken@oracle.com
Fiona Coleman
Fiona Coleman
Recruiter
fiona.oriordan@oracle.com


29140308634


java -jar ./target/osaListPipes-0.0.1-SNAPSHOT.jar locahost osaadmin Pge4@GGSA@2024! sparkadmin Sparkadmin#123 false false

https://192.9.149.18/osa/#welcome



#!/bin/bash

# Variables for the Java file and email details

MAIL_BODY_FILE="mail_body.txt"
# Check if compilation succeeded
if [ $? -eq 0 ]; then
  echo "Compilation successful."

  # Run the Java program and capture the output
  echo "Running $CLASS_FILE..."
  java -jar ./target/osaListPipes-0.0.1-SNAPSHOT.jar localhost osaadmin Pge4@GGSA@2024! sparkadmin Sparkadmin#123 false false > program_output.txt 2>&1

  if [ $? -eq 0 ]; then
    echo "Java program ran successfully." > $MAIL_BODY_FILE
    echo "Output:" >> $MAIL_BODY_FILE
    cat program_output.txt >> $MAIL_BODY_FILE
  else
    echo "Java program encountered an error." > $MAIL_BODY_FILE
    echo "Error output:" >> $MAIL_BODY_FILE
    cat program_output.txt >> $MAIL_BODY_FILE
  fi
else
  echo "Compilation failed." > $MAIL_BODY_FILE
fi

# Send the email
echo "Sending email notification..."
oci ons message publish --body $MAIL_BODY_FILE --topic-id ocid1.onstopic.oc1.us-sanjose-1.amaaaaaaqegqafqaxsvvblinzoyf2lbpe3ymgiu6dtwaxgmktkpaspkjjqtq
# Cleanup
rm -f $MAIL_BODY_FILE program_output.txt
echo "Script execution complete."

if [[ ${MBODY} != *"RUNNING"* ]];then
    oci ons message publish --body "$MBODY" --topic-id ocid1.onstopic.oc1.us-sanjose-1.amaaaaaaqegqafqaxsvvblinzoyf2lbpe3ymgiu6dtwaxgmktkpaspkjjqtq
fi




export compartment_id=<substitute-value-of-compartment_id> 
export name=<substitute-value-of-name> 
export body=<substitute-value-of-body> 

topic_id=$(oci ons topic create --compartment-id $compartment_id --name $name --query data.id --raw-output)

oci ons message publish --body "TEST" --topic-id ocid1.onstopic.oc1.us-sanjose-1.amaaaaaaqegqafqaxsvvblinzoyf2lbpe3ymgiu6dtwaxgmktkpaspkjjqtq


[DEFAULT]
user=ocid1.user.oc1..aaaaaaaauerqwabbefumjtmophjcpqgr6gjxi45oipmimnzjjvtya2qzm6mq
fingerprint=b9:ca:14:05:3d:24:e3:ee:f1:3f:60:45:52:05:34:65
tenancy=ocid1.tenancy.oc1..aaaaaaaam22cbe4rwhfhc3jajgb6f6wos5ar4dl3ugg2a3mw4tneetpj5hra
region=us-sanjose-1
key_file=<path to your private keyfile> # TODO


ocid1.onstopic.oc1.us-sanjose-1.amaaaaaaqegqafqaxsvvblinzoyf2lbpe3ymgiu6dtwaxgmktkpaspkjjqtq





#!/bin/bash

# Threshold percentage for disk usage alert
THRESHOLD=80

# Get the current disk usage details
echo "Disk Utilization Report for $(hostname) on $(date)"
echo "----------------------------------------------------"
df -h

# Alert if disk usage exceeds the threshold
df -h --output=pcent,target | tail -n +2 | while read -r line; do
  USAGE=$(echo "$line" | awk '{print $1}' | tr -d '%')  # Extract usage and remove '%'
  MOUNT=$(echo "$line" | awk '{print $2}')

  # Ensure the value is a valid integer before comparing
  if [[ "$USAGE" =~ ^[0-9]+$ ]] && [ "$USAGE" -ge "$THRESHOLD" ]; then
    echo "Dear Shan & Madhu," >disk.txt
    echo "Please take care the GGSA instance `hostname` " >>disk.txt
    echo "The Disk usage on $MOUNT is at $USAGE%." >>disk.txt
    export disktxt=`cat disk.txt`
    echo $disktxt
    ##oci ons message publish --body "$disktext" --topic-id ocid1.onstopic.oc1.us-sanjose-1.amaaaaaaqegqafqaxsvvblinzoyf2lbpe3ymgiu6dtwaxgmktkpaspkjjqtq
  fi
done

echo "Script execution complete."


disk_utilization.sh
0 * * * * /home/opc/osaListPipes/disk_utilization.sh
0 * * * * /home/opc/osaListPipes/osa-pipeline-notification.sh

chmod +x disk_utilization.sh

crontab -e

0 * * * * /path/to/disk_utilization.sh | mail -s "Disk Utilization Report" your_email@example.com


create Extract

Now click on the home button and extract side, click on the + sogn to get extract create wizard
on Extract information page, 
choose extract type as integrated extract
enter extract name as EXTSRC and click next 
On extract option page, 
choose Oracle Domain as OracleGoldenGate 
and alias as sourcedb
trail name as et

1on managed options, go with default options 
select profile name as default 
and tick on check box ,critical to deployment



1. Now switch to Distribution Service and click  on add data steams
2. 



cd ~/websocket-client-template/
ag test/lab.yaml . -o output -p server=localhost -p authorization=basic 


sqlplus / as sysdba << EOF 
ALTER SESSION SET CONTAINER = PDB;
Insert into JSON_USER.ATTENDEESCHEDULE (DATA) values ('{"_id":4,"name":"Windy","company":"ACME Inc","schedule":[{"ATTENDEE_ID":4,"attendee_sess_id":"S004","code":"S004","session_name":"Database Optimization","time":"2024-09-15T09:00:00","room":"Room 104","speakers":[{"speaker_sess_id":"S004","speaker_session_speaker_id":104,"speaker_id":104,"speaker_name":"Jenny"}]}],"_metadata":{"etag":"DD5CA0676D00C68DC996124BBF81F612","asof":"00000000007B54D9"}}');
Insert into JSON_USER.ATTENDEESCHEDULE (DATA) values ('{"_id":5,"name":"Shawn","company":"WRIME AI","schedule":[{"ATTENDEE_ID":5,"attendee_sess_id":"S005","code":"S005","session_name":"Machine Learning in Databases","time":"2024-09-15T11:00:00","room":"Room 105","speakers":[{"speaker_sess_id":"S005","speaker_session_speaker_id":105,"speaker_id":105,"speaker_name":"Cetin"}]}],"_metadata":{"etag":"953321179FA5E16D26BB009D199EE3E1","asof":"00000000007B54D9"}}');
Insert into JSON_USER.ATTENDEESCHEDULE (DATA) values ('{"_id":6,"name":"Don","company":"RYTHM CORP","schedule":[{"ATTENDEE_ID":6,"attendee_sess_id":"S006","code":"S006","session_name":"Spatial graph Programming","time":"2024-09-16T09:00:00","room":"Room 106","speakers":[{"speaker_sess_id":"S006","speaker_session_speaker_id":106,"speaker_id":106,"speaker_name":"Ronald"}]}],"_metadata":{"etag":"B22F4BC1BC2FF28533180C0C1BFAA18F","asof":"00000000007B54D9"}}');
commit;
EOF


sqlplus / as sysdba << EOF 
ALTER SESSION SET CONTAINER = PDB;
Insert into JSON_USER.ATTENDEESCHEDULE (DATA) values ('{"_id":4,"name":"Windy","company":"ACME Inc","schedule":[{"ATTENDEE_ID":4,"attendee_sess_id":"S004","code":"S004","session_name":"Database Optimization","time":"2024-09-15T09:00:00","room":"Room 104","speakers":[{"speaker_sess_id":"S004","speaker_session_speaker_id":104,"speaker_id":104,"speaker_name":"Jenny"}]}],"_metadata":{"etag":"DD5CA0676D00C68DC996124BBF81F612","asof":"00000000007B54D9"}}');
Insert into JSON_USER.ATTENDEESCHEDULE (DATA) values ('{"_id":5,"name":"Shawn","company":"WRIME AI","schedule":[{"ATTENDEE_ID":5,"attendee_sess_id":"S005","code":"S005","session_name":"Machine Learning in Databases","time":"2024-09-15T11:00:00","room":"Room 105","speakers":[{"speaker_sess_id":"S005","speaker_session_speaker_id":105,"speaker_id":105,"speaker_name":"Cetin"}]}],"_metadata":{"etag":"953321179FA5E16D26BB009D199EE3E1","asof":"00000000007B54D9"}}');
Insert into JSON_USER.ATTENDEESCHEDULE (DATA) values ('{"_id":6,"name":"Don","company":"RYTHM CORP","schedule":[{"ATTENDEE_ID":6,"attendee_sess_id":"S006","code":"S006","session_name":"Spatial graph Programming","time":"2024-09-16T09:00:00","room":"Room 106","speakers":[{"speaker_sess_id":"S006","speaker_session_speaker_id":106,"speaker_id":106,"speaker_name":"Ronald"}]}],"_metadata":{"etag":"B22F4BC1BC2FF28533180C0C1BFAA18F","asof":"00000000007B54D9"}}');
commit;
EOF




https://docs.oracle.com/en/middleware/goldengate/core/23/coredoc/reference-json-dv-config-rest-api-sample.html#GUID-98F68B82-F252-4E52-A55C-87EDCA5E2EEF
Sample Commands to Configure GoldenGate Data Streams for JSON Relational Duality Views

https://blogs.oracle.com/dataintegration/post/oracle-goldengate-data-streams-and-json-duality

https://docs.oracle.com/en/middleware/goldengate/core/23/coredoc/distribute-json-dv-ogg-data-streams.html#GUID-2B7A2E68-6430-44C1-A9BF-C5ED47B3543F
Replicating Business Objects with Oracle JSON Relational Duality and GoldenGate Data Streams



In this lab, we will load data in the Oracle Database schema ***JSON_USER***  of Pluggable Database ***PDB***. GG extract process ***EXTSRC*** will capture the changes from Oracle Database and write them to the local trail file ***et***. From the Distribution Service, **Data Stream** created to consume the trail file ***et***. The YAML document used to generate the client-side code using @asyncapi/generator. 




JSO