#!/bin/bash

# Ensure the necessary environment variables are set
if [ -z "$DB_DATABASE" ] || [ -z "$DB_USERNAME" ] || [ -z "$DB_PASSWORD" ]; then
  echo "Error: One or more environment variables are not set."
  echo "Please set DB_DATABASE, DB_USERNAME, and DB_PASSWORD."
  exit 1
fi

# Use sed to replace placeholders in init.sql
sed -e "s/{{DB_DATABASE}}/$DB_DATABASE/g" \
    -e "s/{{DB_USERNAME}}/$DB_USERNAME/g" \
    -e "s/{{DB_PASSWORD}}/$DB_PASSWORD/g" /etc/mysql/init.sql > /etc/mysql/init_processed.sql

echo "Processed SQL file saved as init_processed.sql"

chmod +x /etc/mysql/init.sql

