# DevScripts

Daily misc scripts to help backend engineer.

## AWS

Scripts for AWS operations, such as EC2, ECS, RDS, etc.

| Scripts Name                          | Description                                                                       |
|---------------------------------------|-----------------------------------------------------------------------------------|
| `rds_create_blue_green_deployment.sh` | To create blue-green deployment for RDS, can be use for RDS version major upgrade |
| `rds_modify_db_parameter_group.sh`    | To modify RDS database parameter group, useful for changing RDS configuration     |

## DB

Scripts for database operations, mostly for postgres.

| Scripts Name            | Description                                                       |
|-------------------------|-------------------------------------------------------------------|
| `db_analyze_verbose.sh` | To pre-warm database by executing analyze verbose command         |
| `db_check_downtime.sh`  | To check db downtime, useful when migrating or upgrading database |

## Redis

Scripts for redis operations using redis-cli commands.

| Scripts Name                     | Description                                                  |
|----------------------------------|--------------------------------------------------------------|
| `redis_delete_multiple_cache.sh` | To delete multiple cache in redis by using cache key pattern |
