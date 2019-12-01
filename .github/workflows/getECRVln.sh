#!/bin/bash
IMAGE_TAG=$1
echo "Checking Vlnerabilities for: $IMAGE_TAG"
echo "Waiting for AWS ECR Image Scanning..."
sleep 5
echo "Waiting for AWS ECR Image Scanning..."
sleep 5
echo "Waiting for AWS ECR Image Scanning..."
sleep 5
echo "Waiting for AWS ECR Image Scanning..."
sleep 5
aws ecr describe-image-scan-findings --repository-name icecream --image-id imageTag=$IMAGE_TAG --region us-west-1 |jq '.imageScanFindings.findings[] | {severity}'|grep 'CRITICAL' && echo "Found Critical Vlnerabilities" && exit 1 || echo "no Critical Vlnerabilities found" && exit 0