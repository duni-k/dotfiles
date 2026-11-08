# Switch the default namespace of the current context (fzf), or: kns <name>
function kns --description 'switch kubectl namespace'
    set -l ns $argv[1]
    if test -z "$ns"
        __kauth; or return
        set ns (kubectl get ns --no-headers -o custom-columns=:metadata.name \
            | fzf --height=40% --reverse --prompt='namespace> '); or return
    end
    kubectl config set-context --current --namespace=$ns
end
