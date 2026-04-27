#!/bin/sh
AUTOINSTALL_FILE=./autoinstall.yaml
SOURCE_DIR=./ubuntu
TARGET_ISO=./iso/ubuntu-26.04-kulturloge-autoinstall-desktop-amd64.iso
VOLUME_NAME=UBUNTU_KULTURLOGE

# delete old image
echo "Deleting old image..."
rm $TARGET_ISO

# create new image
echo "Copying autoinstall.yaml to source location..."
cp $AUTOINSTALL_FILE $SOURCE_DIR
echo "Creating iso image $TARGET_ISO"
xorriso -as mkisofs -r -V $VOLUME_NAME -o $TARGET_ISO -J -l -b boot/grub/i386-pc/eltorito.img -c boot.catalog -no-emul-boot -boot-load-size 4 -boot-info-table $SOURCE_DIR
