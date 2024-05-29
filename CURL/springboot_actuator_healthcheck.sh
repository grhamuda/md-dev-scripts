#!/bin/bash

# Parameterize the service URL and port, need to install jq as pre-requisite
SERVICE_URL="service_name.com"
SERVICE_PORT="443"

while true; do
  # Make the GET request with a timeout of 1 second
  RESPONSE=$(curl -m 1 -s -o response.txt -w "%{http_code}" "https://$SERVICE_URL:$SERVICE_PORT/actuator/health")

  # Check if the response status is 200
  if [ "$RESPONSE" -eq 200 ]; then
    # Extract the status from the response
    STATUS=$(jq -r '.status' response.txt)
    # Print the status
    echo "$SERVICE_URL is $STATUS"
  else
    # Print an error message
    echo "$SERVICE_URL is down"
  fi

  # Clean up
  rm response.txt

  # Wait for 2 seconds before the next iteration
  sleep 2
done
