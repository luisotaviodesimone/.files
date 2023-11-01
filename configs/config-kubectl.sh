if [[ -f ~/.kube/config ]]; then
    export KUBECONFIG="${HOME}/.kube/config"
fi

if [[ -d ~/.kube/configs ]]; then
    for config in ~/.kube/configs/*
    do
        KUBECONFIG="$KUBECONFIG:$config"
    done
fi

export KUBECONFIG