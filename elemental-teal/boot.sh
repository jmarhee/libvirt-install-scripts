#!/bin/bash

CLUSTER_TAG=elemental-$(openssl rand -hex 6)

for i in {1..3}; do \
VM_NAME=$(openssl rand -hex 4); \
sudo qemu-img create /var/lib/libvirt/images/${CLUSTER_TAG}-${VM_NAME}-ROOT_VOL.img 80G; \
sudo qemu-img create /var/lib/libvirt/images/${CLUSTER_TAG}-${VM_NAME}-DATA_VOL.img 120G; \
sudo virt-install \
--name=${CLUSTER_TAG}-node-${VM_NAME} \
--ram=8196 --vcpus=8 \
--cdrom=/var/lib/libvirt/images/$1 \
--os-variant=slem5.2 \
--disk path=/var/lib/libvirt/images/${CLUSTER_TAG}-${VM_NAME}-ROOT_VOL.img \
--disk path=/var/lib/libvirt/images/${CLUSTER_TAG}-${VM_NAME}-DATA_VOL.img \
--network bridge=br0,model=virtio \
--graphics vnc,listen=0.0.0.0 --noautoconsole \
--tpm backend.type=emulator,backend.version=2.0,model=tpm-crb \
--boot uefi; done
