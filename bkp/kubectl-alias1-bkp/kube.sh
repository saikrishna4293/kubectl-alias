#!/bin/bash

K='kubectl'
KG='kubectl --kubeconfig=/home/vagrant/gcp-cluster/kube-config'

VERB=$1
KIND=$2
NAMESPACE=$4
PODNAME=$5

R=$(tput setaf 1)
G=$(tput setaf 2)
Y=$(tput setaf 3)
B=$(tput sgr0)
#B=$(tput blink)
NO=$(tput sgr0)

#if [ -z "${PODNAME}" ]
#then
## Get Script
if [ ${VERB} == "get" ]
then
	echo "${B}============================================================================================"
	echo "================>${NO} ${R}Single Master CLuster${NO} ===========> ${G}Verb: ${Y}${VERB}, ${G}Kind: ${Y}${KIND}, ${G}Namespace: ${Y}${NAMESPACE}${NO} "
	echo "${B}============================================================================================${NO}"
	${K} get ${KIND} -n ${NAMESPACE}
	echo "${B}============================================================================================"
	echo "=================>${NO} ${R}Google Cloud CLuster${NO} ===========> ${G}Verb: ${Y}${VERB}, ${G}Kind: ${Y}${KIND}, ${G}Namespace: ${Y}${NAMESPACE}${NO} "
	echo "${B}============================================================================================${NO}"
	${KG} get ${KIND} -n ${NAMESPACE}
	echo "${B}============================================================================================${NO}"
else
	echo "=======> Please do write commands in below mentioned format"
	echo "=======> example:"
	echo "		kdev get pods -n dit"
fi
#else
## Describe Script
if [ ${VERB} == "describe" ]
then
	echo "============================================================================================"
	echo "================> Single Master CLuster ===========> Verb: ${VERB}, Kind: ${KIND}, Namespace: ${NAMESPACE} "
	echo "============================================================================================"
	${K} describe ${KIND} -n ${NAMESPACE} ${PODNAME}
	echo "============================================================================================"
	echo "=================> Google Cloud CLuster ===========> Verb: ${VERB}, Kind: ${KIND}, Namespace: ${NAMESPACE} "
	echo "============================================================================================"
	${KG} describe ${KIND} -n ${NAMESPACE} ${PODNAME}
	echo "============================================================================================"
else
	echo "Please do write command in format"
	echo "ex:"
	echo "kdev describe pods -n dit nginx-deployment-67594d6bf6-cr9bg"
fi
#fi
