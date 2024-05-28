#!/bin/bash

# Update the RDS parameter group to enable logical replication, if other parameters need to be updated, add them to the parameters list
export db_parameter_group_name="<db_parameter_group_name>"

aws rds modify-db-parameter-group \
    --db-parameter-group-name "$db_parameter_group_name" \
    --parameters "ParameterName=rds.logical_replication,ParameterValue=1,ApplyMethod=pending-reboot"
