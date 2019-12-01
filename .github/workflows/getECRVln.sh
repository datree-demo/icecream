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
aws ecr describe-image-scan-findings --repository-name icecream --image-id imageTag=$IMAGE_TAG --region us-west-1 |jq '.imageScanFindings.findings[] | {severity}'|grep 'HIGH\|CRITICAL' && echo "Found Critical or High Vlnerabilities" && exit 1 || echo "no Critical or High Vlnerabilities found" && exit 0