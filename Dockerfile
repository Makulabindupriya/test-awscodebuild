## CentOS 7 base image
FROM centos:7 AS centos

## Update the package manager and install necessary dependencies
RUN yum update -y && yum install -y curl sudo

USER root
RUN mkdir /tests
COPY . /tests
WORKDIR /tests
RUN touch test-docker.txt

## Set variable for clone url
ARG GITHUB_URL
ARG BRANCH_NAME
RUN echo "Git Url: $GITHUB_URL"
RUN echo "Git Branch name: $BRANCH_NAME"

## Install awscli
RUN yum install -y python3 python3-pip
RUN pip3 install awscli

## List the files
RUN ls /tests

## Check version
RUN aws --version

## Copy generated report to s3 bucket
RUN aws s3 cp /tests/test-docker.txt s3://git-backup-test

## Default command to execute playwright test
#CMD ["npx", "playwright", "test"]
