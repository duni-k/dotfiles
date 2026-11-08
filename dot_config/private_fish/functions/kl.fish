# Pods. Usage: kl [namespace]
# With a namespace: list its pods. Without: tv k8s-pods
# (ctrl-e exec, ctrl-l logs, ctrl-d delete; the source cycles current ns / all ns)
function kl --description 'list pods, or browse them with tv k8s-pods'
    __kauth; or return
    if test (count $argv) -gt 0
        kubectl -n $argv[1] get pods
    else
        tv k8s-pods
    end
end
