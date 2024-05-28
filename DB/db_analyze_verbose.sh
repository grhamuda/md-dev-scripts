#!/bin/bash

# Define the list of databases and their corresponding credentials, can support multiple databases
databases=(
    "<db_host>,<db_name>,<db_password>,<db_username>"
    "<db_host>,<db_name>,<db_password>,<db_username>"
)

# Function to execute psql command for each database
execute_psql() {
    db_host=$1
    db_name=$2
    db_password=$3
    db_user=$4
    echo "$(date +"%Y-%m-%d %T") - Starting ANALYZE VERBOSE for $dbname"
    # Execute psql command for the current database
    PGPASSWORD="$db_password" psql -h "$db_host" -d "$db_name" -U "$db_user" -c "ANALYZE VERBOSE;"
    echo "$(date +"%Y-%m-%d %T") - Completed ANALYZE VERBOSE for $dbname"
}

# Loop through each database and execute psql command in parallel
for db in "${databases[@]}"; do
    IFS=',' read -r dbname dbpassword dbuser <<< "$db"
    execute_psql "$dbname" "$dbpassword" "$dbuser" &
done

# Wait for all background processes to finish
wait
