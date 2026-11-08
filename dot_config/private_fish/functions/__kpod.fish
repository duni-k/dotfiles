# Pick a pod with fzf. Usage: __kpod [namespace]  -> prints pod name
function __kpod
    __kauth; or return 1
    set -l ns_args
    test -n "$argv[1]"; and set ns_args -n $argv[1]
    kubectl get pods $ns_args --no-headers 2>/dev/null \
        | fzf --height=40% --reverse --prompt='pod> ' \
              --header='NAME  READY  STATUS  RESTARTS  AGE' \
        | awk '{print $1}'
end
