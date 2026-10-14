#!/bin/bash
# Installs k3s (lightweight Kubernetes) on first boot.
# k3s is used instead of full EKS to keep this portfolio project low-cost
# while still giving you a real, working Kubernetes API to deploy against.

set -e

curl -sfL https://get.k3s.io | sh -

# Make kubeconfig readable so it can be pulled down for local kubectl use
chmod 644 /etc/rancher/k3s/k3s.yaml

# Wait for k3s to be ready
until kubectl --kubeconfig /etc/rancher/k3s/k3s.yaml get nodes 2>/dev/null; do
  sleep 5
done

echo "k3s installation complete" > /var/log/k3s-setup-done.log
