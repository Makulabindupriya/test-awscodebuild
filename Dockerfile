FROM 770989854283.dkr.ecr.us-west-2.amazonaws.com/test:centos

LABEL org.label-schema.schema-version=1.0 org.label-schema.name="CentOS Base"
RUN mkdir /tests
WORKDIR /tests
RUN touch test-docker.txt
COPY test2.sh .
RUN chmod +x test2.sh
#installing pip
RUN yum install python3-pip  unzip -y
RUN python3 -m pip install --upgrade pip
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip && ./aws/install
RUN pwd
#RUN ./test2.sh

#CMD ["sh", "test2.sh"]

#copy file from S3 bucket to ec2
#RUN aws s3 cp /tests/test-docker.txt s3://git-backup-test > test.txt
#RUN cat test.txt
RUN ls
#RUN aws s3 cp s3://tf-rf-scripts-spe-qaqc-bucket/scripts/aut-rf-spt temp --recursive
