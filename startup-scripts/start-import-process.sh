#/bin/sh

echo "start import in its own process" 
chmod +x /opt/jboss/custom-scripts/add_user.sh
/opt/jboss/custom-scripts/add_user.sh
/opt/jboss/custom-scripts/import.sh &> /dev/null & disown
