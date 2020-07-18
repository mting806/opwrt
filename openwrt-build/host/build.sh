#!/bin/bash
virsh list | grep openwrt-build
if [ $? -eq 0 ] 
then
    virsh destroy openwrt-build
    virsh undefine openwrt-build
fi
virsh list --all | grep openwrt-build | grep off
if [ $? -eq 0 ] 
then
    virsh undefine openwrt-build
fi

rm -fr /home/vms/openwrt-build
mkdir /home/vms/openwrt-build
cp /root/centos7/CentOS-7-x86_64-GenericCloud-1907.qcow2 /home/vms/openwrt-build/ 
qemu-img resize /home/vms/openwrt-build/CentOS-7-x86_64-GenericCloud-1907.qcow2 +80G

genisoimage -output /home/vms/openwrt-build/init.iso -volid cidata -joliet -rock /root/opwrt-build/user-data /root/opwrt-build/meta-data

virt-install --name openwrt-build \
--ram 4096 \
--cpu host-passthrough \
--vcpus 2 \
--disk path=/home/vms/openwrt-build/CentOS-7-x86_64-GenericCloud-1907.qcow2 \
--os-type linux \
--os-variant centos7.0 \
--network bridge=br-int,model=virtio \
--graphics none \
--cdrom /home/vms/openwrt-build/init.iso \
--noautoconsole

sleep 5
virsh list | grep openwrt-build