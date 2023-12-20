## CentOS 7 base image
FROM centos:7 AS centos

## Update the package manager and install necessary dependencies
RUN yum update -y && yum install -y curl sudo

## Install Node.js
RUN curl -sL https://rpm.nodesource.com/setup_16.x | sudo bash -
RUN yum -y install nodejs

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
RUN pip install awscli

## List the files
RUN ls /tests

## Check version
RUN aws --version

## Copy generated report to s3 bucket
RUN aws s3 cp /tests/test-docker.txt s3://git-backup-test

## Default command to execute playwright test
#CMD ["npx", "playwright", "test"]
