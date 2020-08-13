## I have no idea how I did this 

### Creating A Bash Script which will automatically SSH into our Bastion Server and then call another bash script which will SSH into our DB Instance


#### How does this work?

- The setup-db.sh file will secure copy our provision file into the ssh folder of our bastion server
- The setup file will then SSH into our bastion and run the provision file
- As the provision file is within our .ssh folder it will have access to our key
- We will then enter our DB Instance
