#!/bin/bash -e

. /opt/bitnami/base/functions
. /opt/bitnami/base/helpers

print_welcome_page

if [[ "$1" == "nami" && "$2" == "start" ]] || [[ "$1" == "/init.sh" ]]; then
  nami_initialize tomcat jenkins
  info "Starting jenkins... "
fi

if [ ! -d /bitnami/jenkins/1001 ]
then
    mkdir -p /bitnami/jenkins/1001
    chown -Rf tomcat /bitnami/jenkins/1001
fi

exec tini -- "$@"
