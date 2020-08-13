#!/bin/bash

scp -i ~/.ssh/DevOpsStudents.pem -r ~/Code/Testing-VPC-Network/provision.sh ubuntu@54.170.220.240:/home/ubuntu/.ssh/
ssh -i ~/.ssh/DevOpsStudents.pem ubuntu@54.170.220.240 -i $ ./.ssh/provision.sh

