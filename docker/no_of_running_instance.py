import boto3


running_instances = []
ec2client = boto3.client('ec2',region_name='us-east-1')
response = ec2client.describe_instances()
for reservation in response["Reservations"]:
    for instance in reservation["Instances"]:
        if instance['State']['Name'] == 'running':
           x = (instance["InstanceId"])
           running_instances.append(x)
print('Running Instances', len(running_instances))
