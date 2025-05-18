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

## Fluentd

docker-compose.yamlが事前に存在するので`kompose`を使ってk8sの設定を作成する

### REF

- https://speakerdeck.com/allegrogiken/docker-compose-kara-k8s-niru-men-sitemiru

## commands

```bash
# convert from compose.yaml to k8s config files.
kompose convert -f fluentd_sample/docker-compose.yaml -o k8s_sample/fluentd_sample
```

```bash
# deployment
kubectl apply -f fluentd_sample/deployment.yaml
# confirm
kubectl get pods -l app=fluentd-proxy
watch kubectl get pods -l app=fluentd-proxy
minikube kubectl get pods|less +F 
watch kubectl get pods
kubectl apply -f fluentd_sample/service.yaml
minikube service fluentd-proxy-service
curl localhost:8080/echo
```

kubectl describe pod fluentd-proxy-deployment-5zczj
kubectl delete pod fluentd-proxy-deployment-5zczj
