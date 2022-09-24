
$prod = $false
if($args.count -gt 1){
    $prod=$args[1] -eq "prod"
}
kubectl -n ikomida delete secret environment
kubectl -n ikomida-worker delete secret environment
kubectl -n ikomida-job delete secret environment
if($prod){
kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s
kubectl -n ikomida create secret generic environment --from-env-file ./k8s/environment-secret.env
kubectl -n ikomida-worker create secret generic environment --from-env-file ./k8s/environment-secret.env
kubectl -n ikomida-job create secret generic environment --from-env-file ./k8s/environment-secret.env
}else{
kubectl apply -f k8s-dev/namespace.yaml
kubectl apply -f k8s-dev
kubectl -n ikomida create secret generic environment --from-env-file ./k8s-dev/environment-secret.env
kubectl -n ikomida-worker create secret generic environment --from-env-file ./k8s-dev/environment-secret.env
kubectl -n ikomida-job create secret generic environment --from-env-file ./k8s-dev/environment-secret.env
}