# Port-forward to a pod. Usage: kpf <local:remote | port> [namespace]
function kpf --description 'kubectl port-forward to a pod (fzf picker)'
    if test (count $argv) -lt 1
        echo "usage: kpf <[local:]remote> [namespace]" >&2
        return 1
    end
    set -l ns $argv[2]
    set -l pod (__kpod $ns); or return
    set -l args
    test -n "$ns"; and set args -n $ns
    kubectl port-forward $args $pod $argv[1]
end
