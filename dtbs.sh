#!/bin/bash

DEVICEPIPE="/dev/ttyUSB0"
BAUDRATE="115200"
DTSPATH="./output/build/linux-custom/arch/arm/boot/dts/"

#make linux-rebuild

stty -F $DEVICEPIPE $BAUDRATE

echo "" > $DEVICEPIPE
sleep 0.2
echo "root" > $DEVICEPIPE
sleep 0.2
echo "rz" > $DEVICEPIPE
sleep 0.5
sz --zmodem ${DTSPATH}/bcm2710-diypie.dtb ${DTSPATH}/overlays/dsi-test.dtbo ${DTSPATH}/overlays/vc4-kms-v3d.dtbo ./board/diypie/config.txt > $DEVICEPIPE < $DEVICEPIPE
sleep 0.1
echo "mv -f dsi-test.dtbo /boot/overlays" > $DEVICEPIPE
echo "mv -f vc4-kms-v3d.dtbo /boot/overlays" > $DEVICEPIPE
echo "mv -f bcm2710-diypie.dtb /boot" > $DEVICEPIPE
echo "mv -f config.txt /boot" > $DEVICEPIPE
sleep 0.1
echo "reboot" > $DEVICEPIPE