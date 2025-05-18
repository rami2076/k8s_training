Minikube
====

https://minikube.sigs.k8s.io/docs/start/?arch=%2Fmacos%2Farm64%2Fstable%2Fhomebrew

.． code-block:: bash

  minikube kubectl create deployment hello-minikube --image=kicbase/echo-server:1.0
  minikube kubectl expose deployment hello-minikube --type=NodePort --port=8080