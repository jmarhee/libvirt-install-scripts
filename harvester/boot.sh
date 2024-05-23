#!/bin/bash

CLUSTER_TAG=harvester-$(openssl rand -hex 6)
ISO=harvester-v1.3.0-amd64.iso

for i in {1..2}; do \
VM_NAME=$(openssl rand -hex 4); \
sudo qemu-img create /var/lib/libvirt/images/${CLUSTER_TAG}-${VM_NAME}-ROOT_VOL.img 180G; \
sudo qemu-img create /var/lib/libvirt/images/${CLUSTER_TAG}-${VM_NAME}-DATA_VOL.img 250G; \
sudo virt-install \
--name=${CLUSTER_TAG}-node-${VM_NAME} \
--ram=8196 --vcpus=8 \
--cdrom=/var/lib/libvirt/images/${ISO} \
--os-variant=slem5.2 \
--disk path=/var/lib/libvirt/images/${CLUSTER_TAG}-${VM_NAME}-ROOT_VOL.img \
--disk path=/var/lib/libvirt/images/${CLUSTER_TAG}-${VM_NAME}-DATA_VOL.img \
--network bridge=br0,model=virtio \
--network bridge=virbr0,model=virtio \
--graphics vnc,listen=0.0.0.0 --noautoconsole \
--tpm backend.type=emulator,backend.version=2.0,model=tpm-crb \
--boot uefi; done
