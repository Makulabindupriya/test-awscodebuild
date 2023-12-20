#!/bin/sh
echo "hello"
aws s3 cp /tests/test-docker.txt s3://git-backup-test
