Minikube
====

Init
----

https://minikube.sigs.k8s.io/docs/start/?arch=%2Fmacos%2Farm64%2Fstable%2Fhomebrew

.. code-block:: bash

    brew install minikube


Version check
????

.. code-block:: bash

  minikube version
  # result
  minikube version: v1.35.0
  commit: dd5d320e41b5451cdf3c01891bc4e13d189586ed

Start up
????

.. code-block:: bash

  minikube start

Template commands
????

.. code-block:: bash

  # ${pod_name}
  # ${container_name}
  # Dashboard
  # minikube dashboard
  # Get pod
  # minikube kubectl -- get po -A
  # Deploy Service
  # minikube kubectl create deployment ${service_name} --image=image
  # kubectl expose deployment ${service_name} --type=NodePort --port=8080
  # Serviceに接続するURLを返す
  # minikube service ${service_name}
  # Port Forward
  # minikube kubectl port-forward service/${service_name} 7080:8080


