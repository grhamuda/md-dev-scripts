# DevScripts

Daily misc scripts to help backend engineer.

## AWS

Scripts for AWS operations, such as EC2, ECS, RDS, etc.

### RDS

This scripts should be executed in environment with AWS CLI installed and configured with access to the RDS instance (such as bastion instance).

| Scripts Name                          | Description                                                                       |
|---------------------------------------|-----------------------------------------------------------------------------------|
| `rds_create_blue_green_deployment.sh` | To create blue-green deployment for RDS, can be use for RDS version major upgrade |
| `rds_modify_db_parameter_group.sh`    | To modify RDS database parameter group, useful for changing RDS configuration     |

### Redis

Scripts for redis operations using redis-cli commands, this scripts should be executed in environment with redis cli installed and configured.

| Scripts Name                     | Description                                                  |
|----------------------------------|--------------------------------------------------------------|
| `redis_delete_multiple_cache.sh` | To delete multiple cache in redis by using cache key pattern |

## DB

Scripts for database operations, mostly for postgres.

| Scripts Name            | Description                                                       |
|-------------------------|-------------------------------------------------------------------|
| `db_analyze_verbose.sh` | To pre-warm database by executing analyze verbose command         |
| `db_check_downtime.sh`  | To check db downtime, useful when migrating or upgrading database |
