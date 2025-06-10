#!/bin/bash

## Load the config file
source "/etc/libvirt/hooks/kvm.conf"

## GPU Nvidia
virsh nodedev-reattach $VIRSH_GPU_VIDEO
virsh nodedev-reattach $VIRSH_GPU_AUDIO
## Sata SSD 480gb
virsh nodedev-reattach $VIRSH_SATA_CONTROLLER

## Unload vfio
modprobe -r vfio_pci
modprobe -r vfio_iommu_type1
modprobe -r vfio
