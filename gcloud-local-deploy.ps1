$environment = 0
if($args.count -gt 0){
    if($args[0] -eq "production"){
        $environment = 2
    }
    if($args[0] -eq "homologation"){
        $environment = 1
    }
}

kubectl -n ikomida delete secret environment
kubectl -n ikomida-worker delete secret environment
kubectl -n ikomida-job delete secret environment
echo "apply environment: $environment"
if($environment -eq 1){
    kubectl apply -f k8s-hmlg/namespace.yaml
    kubectl apply -f k8s-hmlg
    kubectl -n ikomida create secret generic environment --from-env-file ./k8s-hmlg/environment-secret.env
    kubectl -n ikomida-worker create secret generic environment --from-env-file ./k8s-hmlg/environment-secret.env
    kubectl -n ikomida-job create secret generic environment --from-env-file ./k8s-hmlg/environment-secret.env
}elseif($environment -eq 2){
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