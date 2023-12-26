#!/bin/sh
echo "begin pull"
version="1.28.5"
array=(
    "kube-apiserver:v$version"
    "kube-controller-manager:v$version"
    "kube-scheduler:v$version"
    "kube-proxy:v$version"
    "pause:3.9"
    "etcd:3.5.9-0"
    "coredns/coredns:v1.10.1"
)
prefix_old="registry.k8s.io/"
prefix_new="registry.cn-hangzhou.aliyuncs.com/google_containers/"


for i in "${!array[@]}";do
    echo array[i]
    docker pull "$prefix_new${array[i]}"
    docker tag "$prefix_new${array[i]}" "$prefix_old${array[i]}"
done