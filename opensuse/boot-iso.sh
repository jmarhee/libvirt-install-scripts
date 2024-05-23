#!/bin/bash

CLUSTER_TAG=openSUSE-$(openssl rand -hex 6)
ISO=openSUSE-Leap-15.0-NET-x86_64.iso

for i in {1..2}; do \
VM_NAME=$(openssl rand -hex 4); \
sudo qemu-img create /var/lib/libvirt/images/${CLUSTER_TAG}-${VM_NAME}-ROOT_VOL.img 180G; \
sudo qemu-img create /var/lib/libvirt/images/${CLUSTER_TAG}-${VM_NAME}-DATA_VOL.img 250G; \
sudo virt-install \
--name=${CLUSTER_TAG}-node-${VM_NAME} \
--ram=4196 --vcpus=4 \
--cdrom=/var/lib/libvirt/images/${ISO} \
--os-variant=sle15sp5 \
--disk path=/var/lib/libvirt/images/${CLUSTER_TAG}-${VM_NAME}-ROOT_VOL.img \
--disk path=/var/lib/libvirt/images/${CLUSTER_TAG}-${VM_NAME}-DATA_VOL.img \
--network bridge=br0,model=virtio \
--graphics vnc,listen=0.0.0.0 --noautoconsole \
--tpm backend.type=emulator,backend.version=2.0,model=tpm-crb \
--boot uefi; done
