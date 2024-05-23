#!/bin/bash

CLUSTER=$1

virsh list --all | grep elemental-$CLUSTER | awk '{print $2}' | xargs -I% virsh destroy '%' && \
rm /var/lib/libvirt/images/elemental-$cluster-*-*_VOL.img
