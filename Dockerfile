FROM centos:7

LABEL org.label-schema.schema-version=1.0 org.label-schema.name="CentOS Base"
RUN mkdir /tests
WORKDIR /tests
COPY test2.sh .
RUN chmod +x test2.sh
#installing pip
RUN yum install python3-pip  unzip -y
RUN python3 -m pip install --upgrade pip
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip && ./aws/install
RUN 
RUN pwd
RUN ./test2.sh

#CMD ["sh", "test2.sh"]

#copy file from S3 bucket to ec2
RUN aws s3 cp s3://tf-rf-scripts-spe-qaqc-bucket/scripts/TestSuite.robot testsuite.robot
#RUN aws s3 cp s3://tf-rf-scripts-spe-qaqc-bucket/scripts/aut-rf-spt temp --recursive
