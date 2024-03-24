#!/usr/bin/bash

function throw()
{
   errorCode=$?
   echo "Error: ($?) LINENO:$1"
   exit $errorCode
}

function check_error {
  if [ $? -ne 0 ]; then
    echo "Error: ($?) LINENO:$1"
    exit 1
  fi
}

export DEBIAN_FRONTEND=noninteractive

ansible  -i node-hosts-all.yaml --become -m shell -a 'uptime' kubernetes || throw ${LINENO}

ANSIBLE_LOG_PATH=./install-kubebernetes.log ansible-playbook -i  node-hosts-all.yaml playbook-kubernetes/kubernetes-deploy.yaml --extra-vars "@run-kubernetes-node56.vars.yaml" || throw ${LINENO}
ANSIBLE_LOG_PATH=./post-install-kubebernetes.log ansible-playbook -i  node-hosts-all.yaml playbook-kubernetes/kubernetes-post-deploy.yaml --extra-vars "@run-kubernetes-node56.vars.yaml" || throw ${LINENO}

