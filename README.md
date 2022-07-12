### Step 1

- First run `networking` Module to create a `VPC`, `2 Public Subnets`, `2 Private Subnets`.
- Now create  a SSH-key to ssh into ec2 from `ssh-key` module.

### Step 2

- Use the `vpc_id` created in previous step to create Security Group in that VPC.
- Now Run Secturity group module to create Security group to attach to Instance.

### Step 3

- Use `subnet_id` from `step 1` and `security_group ` from `step 2` to create ASG.
- Run `asg` module to create `launch_template` and `autoscaling_group` to launch instances.

### Step 4

- Run `alb` module to create a `target_group`, `application_loadbalancer` & `listener_rule`.

### Step 5

- Create a `route53_zone` from `route53_zone` module.
- Create a `route53_record` from `route53_record` to point the ALB DNS Name.

* Use these Command to apply terraform manifest.

```shell
terraform init
terraform plan
terraform apply
```

