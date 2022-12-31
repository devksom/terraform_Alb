## AWS ELB - Application Load Balancer 

### Contents                   

A load balancer pointing to Two EC2 instances with a simple web application that shows the web page with the string "Hey, it's a me, `<HOSTNAME>`!"

### Objectives                     

1. Create a VPC
2. Create Two Subnets in separate Availability Zones
3. Create Two Instances, one in each subnet created above
4. Create an application load balancer for the two instances, with the following properties
  1. healthy threshold: 3
  2. unhealthy threshold: 3
  3. interval: 10 seconds
7.  Verify load balancer is working  (= you get reply from both instances at different times)
8. Ensure the security group of the webservers allow HTTP traffic from the Load balancer only and nowhere else
