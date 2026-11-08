# Make sure the OIDC token for the current context is valid, in the foreground.
# kubelogin may need a browser login; that can't happen inside tv/fzf/$(...),
# so refresh it here first (a no-op while the cached token is still valid).
function __kauth
    kubectl auth whoami >/dev/null; or begin
        echo "kubectl auth failed for context "(kubectl config current-context) >&2
        return 1
    end
end
