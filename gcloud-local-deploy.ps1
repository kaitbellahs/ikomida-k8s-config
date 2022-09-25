$environment = 0
if($args.count -gt 0){
    if($args[0] -eq "production"){
        $environment = 2
    }
    if($args[0] -eq "homologation"){
        $environment = 1
    }
}

echo "apply environment: $environment"

kubectl -n ikomida delete secret environment
kubectl -n ikomida-worker delete secret environment
kubectl -n ikomida-job delete secret environment
if($environment -eq 1){
    echo "apply homologation settings"
    kubectl apply -f k8s-hmlg/namespace.yaml
    kubectl -n ikomida create secret generic environment --from-env-file ./k8s-hmlg/environment-secret.env
    kubectl -n ikomida-worker create secret generic environment --from-env-file ./k8s-hmlg/environment-secret.env
    kubectl -n ikomida-job create secret generic environment --from-env-file ./k8s-hmlg/environment-secret.env
    kubectl apply -f k8s-hmlg
}elseif($environment -eq 2){
    echo "apply production settings"
    kubectl apply -f k8s/namespace.yaml
    kubectl -n ikomida create secret generic environment --from-env-file ./k8s/environment-secret.env
    kubectl -n ikomida-worker create secret generic environment --from-env-file ./k8s/environment-secret.env
    kubectl -n ikomida-job create secret generic environment --from-env-file ./k8s/environment-secret.env
    kubectl apply -f k8s-hmlg
}else{
    echo "apply development settings"
    kubectl apply -f k8s-dev/namespace.yaml
    kubectl -n ikomida create secret generic environment --from-env-file ./k8s-dev/environment-secret.env
    kubectl -n ikomida-worker create secret generic environment --from-env-file ./k8s-dev/environment-secret.env
    kubectl -n ikomida-job create secret generic environment --from-env-file ./k8s-dev/environment-secret.env
    kubectl apply -f k8s-hmlg
}