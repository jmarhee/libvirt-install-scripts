#!/bin/bash

VM_NAME=$1

sudo qemu-img create -b /var/lib/libvirt/images/noble-server-cloudimg-amd64.img -f qcow2 -F qcow2 /var/lib/libvirt/images/${VM_NAME}-ROOT_VOL.img 120G
sudo qemu-img create /var/lib/libvirt/images/${VM_NAME}-DATA_VOL.img 80G;
# noble-server-cloudimg-amd64.img

sudo virt-install --name=${VM_NAME} --ram=8196 --vcpus=4 --import --disk path=/var/lib/libvirt/images/${VM_NAME}-ROOT_VOL.img,format=qcow2 --disk path=/var/lib/libvirt/images/${VM_NAME}-DATA_VOL.img,format=qcow2 --disk path=cidata-noble.iso,device=cdrom --os-variant=ubuntu24.04 --network bridge=br0,model=virtio --graphics vnc,listen=0.0.0.0 --noautoconsole
