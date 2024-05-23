#!/bin/bash

CLUSTER=$1

virsh list --all | grep elemental-$CLUSTER | awk '{print $2}' | xargs -I% virsh start '%'
