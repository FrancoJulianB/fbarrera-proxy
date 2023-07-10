#!/bin/sh


if [ -f /tmp/add_user.state ]; then
  echo "El script ya se ha ejecutado anteriormente. No se realizarán cambios."
else
  /opt/jboss/keycloak/bin/add-user-keycloak.sh -u admin -p admin
  pwd -P
  touch /tmp/add_user.state 
  echo "Reiniciando el contenedor de Keycloak..."
  /opt/jboss/keycloak/bin/jboss-cli.sh --connect command=:reload
fi