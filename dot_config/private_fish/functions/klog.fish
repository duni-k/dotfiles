# Tail logs of a pod. Usage: klog [namespace] [container]
function klog --description 'kubectl logs -f for a pod (fzf picker)'
    set -l ns $argv[1]
    set -l pod (__kpod $ns); or return
    set -l args
    test -n "$ns"; and set args -n $ns
    test -n "$argv[2]"; and set args $args -c $argv[2]
    kubectl logs -f --tail=200 $args $pod
end
