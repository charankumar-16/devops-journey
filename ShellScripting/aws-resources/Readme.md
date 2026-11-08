# Creating the Ec2 Instance using aws CLI.
 
 - To create an Instance, we need to have access to the aws console. To get that access, we add the user to the IAM user and give certain permissions.
    So, that the user could create the Instance and describe the resources. After completing this you will be having a public key and a private key {Using these two keys we need to configure the aws CLI}
 - Now go to the terminal and configure the terminal using the public and private key. So, that we connect to the aws-console.{aws configure}
 - Once this is done, we can go and start creating the Instance.
	- Step 1: Create a Key Pair [so, that we could able to login to the Instance]
			
		- aws ec2 create-key-pair --key-name my-key --query 'KeyMaterial' --output text > my-key.pem  [KeyMaterial: It selects key content from the response]
		- chmod 400 my-key.pem [Since It is a Key. we are restricting the permission]
	- Step 2: Create the security group[Firewall]
		- aws ec2 create-security-group --group-name my-sg --description "My SG"
		- aws ec2 authorize-security-group-ingress --group-name my-sg --protocol tcp --port 22 --cidr 0.0.0.0/0 [0.0.0.0/0 means we can connect with the Instance from anywhere in the world and we can                  restrict that using our Ip]
	- Step 3: Create the Instance/ Run the Instance
		- aws ec2 run-instances \
  		  --image-id ami-0abcdef1234567890 \
		  --instance-type t2.micro \
		  --key-name my-key \
		  --security-groups my-sg \
 		  --count 1
		 







