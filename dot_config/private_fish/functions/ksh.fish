# Shell into a pod. Usage: ksh [namespace] [container]
# Picks the pod with fzf; tries bash, falls back to sh.
function ksh --description 'kubectl exec a shell into a pod (fzf picker)'
    set -l ns $argv[1]
    set -l pod (__kpod $ns); or return
    set -l args
    test -n "$ns"; and set args -n $ns
    test -n "$argv[2]"; and set args $args -c $argv[2]
    kubectl exec -it $args $pod -- sh -c 'command -v bash >/dev/null && exec bash || exec sh'
end
