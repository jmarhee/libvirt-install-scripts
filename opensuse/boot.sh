#!/bin/bash

VM_NAME=$1

sudo qemu-img create -b /var/lib/libvirt/images/openSUSE-Leap-15.5.x86_64-NoCloud.qcow2 -f qcow2 -F qcow2 /var/lib/libvirt/images/${VM_NAME}-ROOT_VOL.img 120G
sudo qemu-img create /var/lib/libvirt/images/${VM_NAME}-DATA_VOL.img 80G;

sudo virt-install --name=${VM_NAME} --ram=8196 --vcpus=4 --import --disk path=/var/lib/libvirt/images/${VM_NAME}-ROOT_VOL.img,format=qcow2 --disk path=/var/lib/libvirt/images/${VM_NAME}-DATA_VOL.img,format=qcow2 --disk path=cidata-opensuse.iso,device=cdrom --os-variant=sle15sp5 --network bridge=br0,model=virtio --graphics vnc,listen=0.0.0.0 --noautoconsole
