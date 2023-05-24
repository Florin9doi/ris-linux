```bash
sudo apt install libncurses-dev

mkdir openwrt-sdk; cd openwrt-sdk
curl -O https://archive.openwrt.org/releases/19.07.9/targets/ar71xx/generic/openwrt-sdk-19.07.9-ar71xx-generic_gcc-7.5.0_musl.Linux-x86_64.tar.xz
tar -xf openwrt-sdk-19.07.9-ar71xx-generic_gcc-7.5.0_musl.Linux-x86_64.tar.xz
cd openwrt-sdk-19.07.9-ar71xx-generic_gcc-7.5.0_musl.Linux-x86_64/
./scripts/feeds update -a

make defconfig
sed -i "s/CONFIG_SIGNED_PACKAGES=y/# CONFIG_SIGNED_PACKAGES is not set/g" .config
make -j20

git clone https://github.com/Florin9doi/ris-linux.git package/binl_server/

make package/binl_server/compile

scp -o HostKeyAlgorithms=+ssh-rsa ./build_dir/target-mips_24kc_musl/binl_server-1.0/.pkgdir/binl_server/usr/bin/binl_server root@192.168.1.1:/usr/bin/
scp -o HostKeyAlgorithms=+ssh-rsa ./build_dir/target-mips_24kc_musl/binl_server-1.0/.pkgdir/binl_server/etc/init.d/binl_server root@192.168.1.1:/etc/init.d/

ssh -o HostKeyAlgorithms=+ssh-rsa root@192.168.1.1 chmod +x /etc/init.d/binl_server
ssh -o HostKeyAlgorithms=+ssh-rsa root@192.168.1.1 /etc/init.d/binl_server enable
ssh -o HostKeyAlgorithms=+ssh-rsa root@192.168.1.1 /etc/init.d/binl_server start

ssh -o HostKeyAlgorithms=+ssh-rsa root@192.168.1.1 "echo \"8086 100f xxx.inf serv.sss\" > /mnt/usb/PXE/win51-32-xp/nics.txt"
```
