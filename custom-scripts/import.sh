#!/bin/sh

export PATH=$PATH:$JBOSS_HOME/bin

for i in {1..10}; do
    kcadm.sh config credentials --server http://localhost:8080/auth --realm master --user admin --password admin
    custom_realm=$(kcadm.sh get realms/restusers)
    if [ -z "$custom_realm" ]; then
        echo "Importing custom realm."
        kcadm.sh create realms -f /opt/jboss/keycloak/objects/realm.json
        sleep 5s
        echo "Importing components."
        for f in /opt/jboss/keycloak/objects/components/*.json; do
            kcadm.sh create components -r restusers -f $f
        done
    else
        echo "the custom realm already exists."
        exit
    fi
    sleep 5s
done