# poc-devops-cluster

Socle Kubernetes local du POC : Vagrant, Ansible, kubeadm/containerd, MetalLB, Traefik, Gateway API et Gateway partagee.

## Usage

```sh
make up
```

Le cluster expose Traefik via MetalLB. Par defaut, le pool est configure dans `ansible/group_vars/all.yml` avec `192.168.33.100-192.168.33.120`.

Ce repo ne deploie pas GitLab, ArgoCD, le registry ni les applications. Ces composants vivent dans `poc-devops-platform`.
