#!/bin/bash
#
#################################################################
#
#Author: Harshit
#Date: 10/10/2024
#
#This script will provide the information about the aws resources and redirect the output in 'resourceTrackerOutput' file.
#
#AWS S3
#AWS EC2
#AWS Lambda
#AWS IAM users
#################################################################

{

echo  "\nList S3 buckets"
aws s3 ls

echo  "\nList EC2 Instances"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

echo "\nList Lambda"
aws lambda list-functions | jq '.Functions[] | {name: .FunctionName, runtime: .Runtime}'

echo  "\nList IAM Users"
aws iam list-users | jq '.Users[].UserName'

} > resourceTrackerOutput
