This Repo has Terraform Configuration files that 
Provision Infrastructure on AWS Ubuntu instance

It creates the following - 
a. VPC
b. Internet gateway
c. Route tables
d. Associates Route tables with Internet gateway
e. Subnets
f. Security group
g. AWS Ubuntu EC2 Instance
h. Using provisioner - file - Installs - nginx server
i. Using provisioner - remote-exec - makes .sh file Executable and Runs it on Remote Server
j. Using provisioner - local-exec - Logs the IP Address of the Remote Server
