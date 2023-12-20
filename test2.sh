#!/bin/bash
echo "in script file"
echo "hello test"
ls
aws s3 cp /tests/test-docker.txt s3://git-backup-test
