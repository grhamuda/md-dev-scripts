#!/bin/bash

# To create a blue-green deployment for RDS instance major version upgrade
export deployment_name="<deployment_name>"
export rds_arn="<source_rds_arn>"
export new_engine_version="<new_engine_version>"
export new_db_parameter_group_name="<new_db_parameter_group_name>"

aws rds create-blue-green-deployment \
--blue-green-deployment-name "$deployment_name" \
--source "$rds_arn" \
--target-engine-version "$new_engine_version" \
--target-db-parameter-group-name "$new_db_parameter_group_name"
