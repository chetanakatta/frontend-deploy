locals {
    #converting StringList to List
    public_subnet_id = element(split(",",data.aws_ssm_parameter.public_subnet_ids.value), 0)
}