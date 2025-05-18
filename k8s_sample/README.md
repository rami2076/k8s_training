# k8s sample

# commands

## Kotlin App

https://www.baeldung.com/kotlin/docker-kubernetes-deploy-app

```bash
# deployment
kubectl apply -f kt_sample/deployment.yaml
# confirm
kubectl get pods -l app=kotlin-app
minikube kubectl get pods|less +F 
watch kubectl get pods
kubectl apply -f kt_sample/service.yaml
minikube service kotlin-app
minikube kubectl port-forward service/kotlin-app 8080:8080
curl localhost:8080/echo
```
