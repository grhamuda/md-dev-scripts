#!/bin/bash

export PGPASSWORD="<password>"
export HOST="<db_hostname>"
export PGUSERNAME="<username>"
export DATABASE="<db_name>"
export PGCONNECT_TIMEOUT=5

# Log file to store the downtime events, do not forget to create the file before running the script
log_file="downtime_log.txt"

# Initialize the previous status to online
prev_status="start"

while true; do
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "Checking database status at ${timestamp}"

    # Attempt to connect to the database
    if psql -h ${HOST} -U ${PGUSERNAME} -d ${DATABASE} -c 'SELECT * FROM information_schema.sql_sizing LIMIT 1;' > /dev/null 2>&1; then
        current_status="start"
    else
        current_status="stop"
    fi

    # Check if the status has changed
    if [ "${current_status}" != "${prev_status}" ]; then
        downtime_message="!!! Downtime ${prev_status} at ${timestamp} !!!"
        echo "${downtime_message}"
        echo "${downtime_message}" >> "${log_file}"
        prev_status="${current_status}"
    fi

    # Add a delay before the next check
    sleep 1
done
