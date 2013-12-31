#!/bin/bash

OUTDIR=arch/arm/boot
TOOLCHAINDIR=~/android-toolchain/arm-eabi-4.6
TARGET_PRODUCT=vu2sk_SKT_KR
CROSS_COMPILE=$TOOLCHAINDIR/bin/arm-eabi-
defconfig=optiwiz-vu2sk_defconfig
ramdisk=skramdisk.gz
base=0x80200000
ramdiskaddr=0x82200000
pagesize=2048
cmdline='vmalloc=520M console=ttyHSL0,115200,n8 androidboot.hardware=vu2sk lpj=67668'

[ -e $OUTDIR/zImage ] && rm $OUTDIR/zImage

if [ ! -e .config ]; then
echo ""
echo ""
echo "[*] Make defconfig"
echo ""
echo ""
make -j128 $defconfig
fi

echo ""
echo ""
echo "[*] Make zImage & modules"
echo ""
echo ""
make -j128

if [ ! -e $OUTDIR/zImage ]; then
echo ""
echo ""
echo "[*] ERROR"
echo ""
exit
fi

echo ""
echo ""
echo "[*] Make boot.img"
echo ""
echo ""
./mkbootimg --kernel $OUTDIR/zImage --ramdisk $ramdisk --base $base --ramdiskaddr $ramdiskaddr --pagesize $pagesize --cmdline "$cmdline" --output release/boot.img

echo ""
echo ""
echo "[*] Make CWM-flashable zip"
echo ""
echo ""
cd release
zip -r Kernel.zip META-INF boot.img

