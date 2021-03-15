# terraform-prometheus-grafanaHigh level structure

###########################################################
1-	Terraform will create 
-	VPC
-	Subnent
-	Ec2
-	Internet Gate way for internet access 
-	User_data to run script.sh on the run-time. 

############################################################
What will happen. 
1-	Terrafom code with provision 13 resources
=============================================
2-	Terrform will create ec2 instance and will configure docker and docker compose.
===================================================================================
3-	Terrafrom will expose all container ports via dynamic security group to be access from outside.

4-	Docker-compose will run prometheus-compose.yml startup all required containers.
5-	Terrofom will output all localhost urls with theirs assigned port to be access externally. At the end of terraform apply you will something like below 
alertmanager_URL = "http://3.237.239.23:9093"
cadvisor_URL = "http://3.237.239.23:8080"
instance_public_ip = "3.237.239.23"
node-exporter_URL = "http://3.237.239.23:9100"
pushgateway_URL = http://3.237.239.23:9091
6-	Terrafom will create the weather application and create an image out of it and run it during the instance startup. 
7-	weather.py application will be dockerized and and imaged and run as container on port 9090:90. You may exec the container and run python3 weather.py and will provide you the below data for Tallinn 


