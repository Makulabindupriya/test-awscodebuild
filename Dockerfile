## CentOS 7 base image
FROM centos:7 AS centos

RUN mkdir /tests
WORKDIR /tests
COPY test2.sh .
RUN chmod +x test2.sh

## Install awscli
RUN yum install -y python3 python3-pip
RUN pip3 install awscli

## List the files
RUN ls /tests

## Check version
RUN aws --version
CMD ["./test2.sh"]

## Copy generated report to s3 bucket
#RUN aws s3 cp /tests/test-docker.txt s3://git-backup-test

## Default command to execute playwright test
#CMD ["npx", "playwright", "test"]
