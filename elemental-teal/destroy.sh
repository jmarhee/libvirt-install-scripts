#!/bin/bash

CLUSTER=$1

virsh list --all | grep elemental-$CLUSTER | awk '{print $2}' | xargs -I% virsh destroy '%' && \
echo $(rm /var/lib/libvirt/images/elemental-$CLUSTER-*)
