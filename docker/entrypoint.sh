#!/bin/bash

#if [ ! -z "$DB_ENV_POSTGRES_USER" ]; then
#    echo "set applications.application.itlenergy-server-api.resources.jdbc-connection-pool.java:app/ItlEnergyPool.property.User=$DB_ENV_POSTGRES_USER" >> /app/post-deploy.cmd
#fi
#
#if [ ! -z "$DB_ENV_POSTGRES_PASSWORD" ]; then
#    echo "set applications.application.itlenergy-server-api.resources.jdbc-connection-pool.java:app/ItlEnergyPool.property.Password=$DB_ENV_POSTGRES_PASSWORD" >> /app/post-deploy.cmd
#else
#    echo "WARNING: default database password in use"
#fi

if [ ! -z "$TICKET_KEY" ]; then
    echo "set-web-env-entry --name=TicketEncryptionKey --type=java.lang.String --value=\"$TICKEY_KEY\" itlenergy-web" >> /app/post-deploy.cmd
else
    echo "WARNING: default ticket encryption key in use"
fi

if [ ! -z "$TICKET_SECRET" ]; then
    echo "set-web-env-entry --name=TicketEncryptionSecret --type=java.lang.String --value=\"$TICKET_SECRET\" itlenergy-web" >> /app/post-deploy.cmd
else
    echo "WARNING: default ticket encryption secret in use"
fi

/opt/embedded-glassfish/entrypoint.sh