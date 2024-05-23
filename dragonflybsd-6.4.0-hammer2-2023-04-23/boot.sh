#!/bin/bash

VM_NAME=dragonflybsd-$(openssl rand -hex 6)

#sudo qemu-img create -b /var/lib/libvirt/images/dragonflybsd-6.4.0-hammer2-2023-04-23.qcow2 
#sudo qemu-img create -b /var/lib/libvirt/images/dragonflybsd-6.2.2-ufs-2022-09-06.qcow2 -f qcow2 -F qcow2 /var/lib/libvirt/images/${VM_NAME}.img 80G
#sudo virt-install --name=${VM_NAME} --ram=8196 --vcpus=4 --import --disk path=/var/lib/libvirt/images/${VM_NAME}.img,format=qcow2 --disk path=cidata-dragonflybsd.iso,device=cdrom --os-variant=dragonflybsd5.6 --network bridge=br0,model=virtio --graphics vnc,listen=0.0.0.0 --noautoconsole
sudo virt-install --name=${VM_NAME} \
--vcpus=4 \
--ram=8196 \
--disk path=/var/lib/libvirt/images/${VM_NAME}-ROOT.img,format=qcow2,size=20,bus=virtio \
--cdrom /var/lib/libvirt/images/dfly-x86_64-6.4.0_REL.iso \
--os-variant=dragonflybsd5.6 \
--network bridge=br0,model=virtio \
--network bridge=virbr0,model=virtio \
--graphics vnc --noautoconsole
