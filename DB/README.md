# DB

Scripts for database operations, mostly for postgres.

| Scripts Name                 | Description                                                                                                  |
|------------------------------|--------------------------------------------------------------------------------------------------------------|
| `db_analyze_verbose.sh`      | To pre-warm database by executing analyze verbose command                                                    |
| `db_check_downtime.sh`       | To check db downtime, useful when migrating or upgrading database                                            |
| `db_check_hanging_query.sql` | To check hanging query in database, useful to check which query is stuck or taking long times to be executed |
