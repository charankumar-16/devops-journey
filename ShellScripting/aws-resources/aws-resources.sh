#!/bin/bash


##########################
#Author: Charan Kumar Bolla
#Date: 11/07/2026
#Description: This Shell scripts is for getting the resources of aws
#
#########################





set -x
set -e
set -o pipefail

echo "Today date :$(date)" > resources_list.txt

echo "###############ec2 Instances available################ " >> resources_list.txt
aws ec2 describe-instances | jq '.Reservations[].Instances[] | {InstanceId:.InstanceId,InstanceType:.InstanceType ,Launchtime:.LaunchTime}' >> resources_list.txt

echo "##############IAM users##############" >> resources_list.txt
aws iam list-users | jq '.Users[] | {UserName:.UserName, CreateDate:.CreateDate} ' >> resources_list.txt

echo "##############S3 Storage###########" >> resources_list.txt
aws s3 ls >> resources_list.txt


echo "##############Lambda Functions########" >> resources_list.txt
aws lambda list-functions >> resources_list.txt




