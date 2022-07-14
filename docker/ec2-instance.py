
import boto3

running_instances = []
ec2client = boto3.client('ec2',region_name='us-east-1')
response = ec2client.describe_instances()
for reservation in response["Reservations"]:
    for instance in reservation["Instances"]:
        if instance['State']['Name'] == 'running':
           x = (instance["PublicIp"])
        #    print (x)
           running_instances.append(x)
print('IP of Running instances', len(running_instances))
