#!/bin/bash

scp -i ~/.ssh/DevOpsStudents.pem -r ~/Code/Testing-VPC-Network/app/ ubuntu@54.216.151.221:/home/ubuntu/
scp -i ~/.ssh/DevOpsStudents.pem -r ~/Code/Testing-VPC-Network/environment/app/provision.sh ubuntu@54.216.151.221:/home/ubuntu/
ssh -i ~/.ssh/DevOpsStudents.pem ubuntu@54.216.151.221 -i $ ./provision.sh
