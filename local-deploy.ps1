kubectl apply -f ./k8s-dev/namespace.yaml
kubectl -n ikomida delete secret environment
kubectl -n ikomida create secret generic environment --from-env-file ./k8s-dev/environment-secret.env
kubectl -n ikomida-worker delete secret environment
kubectl -n ikomida-worker create secret generic environment --from-env-file ./k8s-dev/environment-secret.env
kubectl -n ikomida-job delete secret environment
kubectl -n ikomida-job create secret generic environment --from-env-file ./k8s-dev/environment-secret.env