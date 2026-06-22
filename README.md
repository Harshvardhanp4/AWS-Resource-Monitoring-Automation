# AWS Resource Monitoring Automation

## Overview

AWS Resource Monitoring Automation is a Bash-based DevOps project that automates the collection of AWS resource information using the AWS CLI. The script gathers details about commonly used AWS services and generates a consolidated resource usage report.

The project is designed to demonstrate Linux shell scripting, AWS CLI usage, JSON parsing with jq, and automation using cron jobs.

## Features

* List Amazon S3 buckets
* List Amazon EC2 instances
* List AWS Lambda functions
* List AWS IAM users
* Display resource counts
* Dependency validation for AWS CLI and jq
* Timestamped report generation
* Cron job scheduling support

## Technologies Used

* Bash Shell Scripting
* AWS CLI
* jq
* Cron
* Linux / WSL

## Project Structure

```text
aws-resource-monitor/
├── aws-resource-tracker.sh
└── README.md
```

## Prerequisites

Before running the script, ensure the following are installed:

### AWS CLI

Verify installation:

```bash
aws --version
```

### jq

Verify installation:

```bash
jq --version
```

### AWS Credentials

Configure AWS credentials:

```bash
aws configure
```

Provide:

* AWS Access Key ID
* AWS Secret Access Key
* Default Region
* Output Format

## Installation

Clone the repository:

```bash
git clone <repository-url>
cd aws-resource-monitor
```

Make the script executable:

```bash
chmod +x aws-resource-tracker.sh
```

## Usage

Run the script manually:

```bash
./aws-resource-tracker.sh
```

or

```bash
bash aws-resource-tracker.sh
```

## Sample Output

```text
==================================================
AWS RESOURCE USAGE REPORT
Generated At: Sun Jun 22 09:00:00 IST 2026
==================================================

Print list of S3 buckets:
my-bucket-1
my-bucket-2

Total S3 Buckets: 2

Print list of EC2 instances:
i-0123456789abcdef0

Total EC2 Instances: 1

Print list of Lambda functions:
...

Total Lambda Functions: 4

Print list of IAM users:
...

Total IAM Users: 3

================ SUMMARY ================
S3 Buckets       : 2
EC2 Instances    : 1
Lambda Functions : 4
IAM Users        : 3
========================================

Report completed successfully.
```

## Cron Job Automation

Open crontab:

```bash
crontab -e
```

Example schedule:

```cron
0 9 * * * /path/to/aws-resource-tracker.sh
```

This executes the script every day at 9:00 AM.

## Learning Objectives

This project demonstrates:

* Linux Shell Scripting
* AWS CLI Operations
* AWS Resource Discovery
* JSON Parsing using jq
* Automation with Cron Jobs
* Basic Error Handling
* Bash Variables and Command Substitution

## Future Improvements

* Export reports to log files
* Generate CSV reports
* Email notifications
* CloudWatch integration
* Resource utilization analytics
* Docker containerization

## Author

Harshvardhan Patil
