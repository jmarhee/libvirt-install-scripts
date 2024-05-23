# elemental-teal

There are separate scripts for Elemental because with virtualized instances, the node will not automatically reboot after installation completes.

Run in this order:

```bash
./elemental-teal/boot.sh elemental.iso
./elemental-teal/autostart.sh ${cluster_id}
./elemental-teal/start.sh ${cluster_id} #after machines are powered off `virsh list --all`
```
