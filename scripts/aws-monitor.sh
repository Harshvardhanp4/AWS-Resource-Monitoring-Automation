#!/bin/bash

################################
################################
# Author: Harshvardhan Patil
# Date: 22th June 2026
#
# Version: V2
#
# This script reports AWS resource usage
##################################
##################################

set -x

#==========================================================
# ADDED: Dependency Checks
#==========================================================

command -v aws >/dev/null 2>&1 || {
    echo "ERROR: AWS CLI is not installed."
    exit 1
}

command -v jq >/dev/null 2>&1 || {
    echo "ERROR: jq is not installed."
    exit 1
}

#==========================================================
# ADDED: Report Header with Timestamp
#==========================================================

echo "=================================================="
echo "AWS RESOURCE USAGE REPORT"
echo "Generated At: $(date)"
echo "=================================================="

# Resources we will track
# AWS S3
# AWS EC2
# AWS LAMBDA
# AWS IAM Users

#==========================================================
# LIST S3 BUCKETS
#==========================================================

echo ""
echo "Print list of S3 buckets:"

aws s3 ls

#==========================================================
# ADDED: S3 Bucket Count
#==========================================================

s3_count=$(aws s3 ls | wc -l)

echo "Total S3 Buckets: $s3_count"

#==========================================================
# LIST EC2 INSTANCES
#==========================================================

echo ""
echo "Print list of EC2 instances:"

aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

#==========================================================
# ADDED: EC2 Instance Count
#==========================================================

ec2_count=$(aws ec2 describe-instances \
    | jq '.Reservations[].Instances[].InstanceId' \
    | wc -l)

echo "Total EC2 Instances: $ec2_count"

#==========================================================
# LIST AWS LAMBDA FUNCTIONS
#==========================================================

echo ""
echo "Print list of Lambda functions:"

aws lambda list-functions

#==========================================================
# ADDED: Lambda Function Count
#==========================================================

lambda_count=$(aws lambda list-functions \
    | jq '.Functions | length')

echo "Total Lambda Functions: $lambda_count"

#==========================================================
# LIST IAM USERS
#==========================================================

echo ""
echo "Print list of IAM users:"

aws iam list-users

#==========================================================
# ADDED: IAM User Count
#==========================================================

iam_count=$(aws iam list-users \
    | jq '.Users | length')

echo "Total IAM Users: $iam_count"

#==========================================================
# ADDED: Summary Section
#==========================================================

echo ""
echo "================ SUMMARY ================"

echo "S3 Buckets       : $s3_count"
echo "EC2 Instances    : $ec2_count"
echo "Lambda Functions : $lambda_count"
echo "IAM Users        : $iam_count"

echo "========================================"

#==========================================================
# ADDED: Completion Message
#==========================================================

echo ""
echo "Report completed successfully."