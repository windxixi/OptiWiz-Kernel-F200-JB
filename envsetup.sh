export ARCH=arm
export CROSS_COMPILE=../prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.6/bin/arm-linux-androideabi-
echo
echo "Issue make gkatt-perf_defconfig to make the configuration, then make menuconfig to make changes."
echo -e "make targets:\n\tmrproper - cleans ALL build information, including .config\n\tclean - removes last build\n\tzImage - makes kernel and outputs to arch/arm/boot/zImage"
echo
