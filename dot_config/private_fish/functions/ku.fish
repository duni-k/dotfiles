# Switch kube context. Usage: ku [name]  -> oidc@<name>-bh
# Without a name: tv k8s-contexts (enter switches)
function ku --description 'switch kubectl context, or pick with tv k8s-contexts'
    if test (count $argv) -gt 0
        kubectl config use-context oidc@$argv[1]-bh
    else
        tv k8s-contexts
    end
end
