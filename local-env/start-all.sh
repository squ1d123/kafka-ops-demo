#!/bin/bash
# set -x
# Start all services
docker-compose up -d
# give user 1000 ownership of the docker socket, this is needed for jenkins to
# run docker commands
sudo chown 1000:docker /var/run/docker.sock
# Print out initial admin password for jenkins
if initial_admin_pass=$(docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword) ; then
    echo "This is the Initial Admin password to use for jenkins: ${initial_admin_pass}"
fi
echo "Jenkins is available at http://localhost:8080"
echo "Kafka Topics UI is available at http://localhost:8000"
echo "Kafka Rest proxy is available at http://localhost:8082"
