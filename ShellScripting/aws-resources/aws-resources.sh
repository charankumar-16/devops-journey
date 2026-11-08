#!/bin/bash
set -x
set -e
set -o pipefail


echo "ec2 Instances available " > resources_list.txt
aws ec2 describe-instances | jq '.Reservations[].Instances[] | {InstanceId:.InstanceId,InstanceType:.InstanceType ,Launchtime:.LaunchTime}' >> resources_list.txt

echo "IAM users" >> resources_list.txt
aws iam list-users | jq '.Users[] | {UserName:.UserName, CreateDate:.CreateDate} ' >> resources_list.txt

echo "S3 Storage" >> resources_list.txt
aws s3 ls >> resources_list.txt


echo "Lambda Functions" >> resources_list.txt
aws lambda list-functions >> resources_list.txt




