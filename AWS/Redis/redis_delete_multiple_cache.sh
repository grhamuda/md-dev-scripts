#!/bin/bash
export PATTERNS=("PRODUCT_01*" "ITEM_01*")
export REDIS_HOST="<redis_host>"
export REDIS_PORT="<redis_port>"

for pattern in "${PATTERNS[@]}"
do
  for key in $(redis-cli -h $REDIS_HOST -p $REDIS_PORT KEYS "$pattern")
  do
    echo "Deleting key: $key"
    result=$(redis-cli -h $REDIS_HOST -p $REDIS_PORT DEL "$key")
    while [[ "$result" == "MOVED "* ]]
    do
      target=$(echo "$result" | awk '{print $3}')
      new_host=$(echo "$target" | cut -d':' -f1)
      new_port=$(echo "$target" | cut -d':' -f2)
      result=$(redis-cli -h "$new_host" -p "$new_port" DEL "$key")
    done
  done
done
