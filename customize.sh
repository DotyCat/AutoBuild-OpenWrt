#!/bin/bash

cd openwrt || exit 1

sed -i 's/192.168.1.1/192.168.1.1/g' package/base-files/files/bin/config_generate
sed -i "s/hostname='.*'/hostname='DOTYWRT'/g" package/base-files/files/bin/config_generate

./scripts/feeds update -a

rm -rf feeds/luci/applications/luci-app-argon-config
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/applications/luci-app-passwall
rm -rf feeds/luci/applications/luci-app-openclash

rm -rf feeds/packages/net/v2ray-geodata
rm -rf feeds/packages/net/chinadns-ng
rm -rf feeds/packages/net/dns2socks
rm -rf feeds/packages/net/hysteria
rm -rf feeds/packages/net/ipt2socks
rm -rf feeds/packages/net/microsocks
rm -rf feeds/packages/net/naiveproxy
rm -rf feeds/packages/net/shadowsocks-libev
rm -rf feeds/packages/net/shadowsocks-rust
rm -rf feeds/packages/net/shadowsocksr-libev
rm -rf feeds/packages/net/simple-obfs
rm -rf feeds/packages/net/tcping
rm -rf feeds/packages/net/trojan-plus
rm -rf feeds/packages/net/tuic-client
rm -rf feeds/packages/net/v2ray-plugin
rm -rf feeds/packages/net/xray-plugin
rm -rf feeds/packages/net/shadow-tls

git clone --depth=1 https://github.com/DotyCat/passwall.git package/passwall
git clone --depth=1 https://github.com/DotyCat/luci-theme-argon.git package/themes/luci-theme-argon
git clone --depth=1 https://github.com/DotyCat/luci-app-argon-config.git package/themes/luci-app-argon-config

git clone --depth=1 https://github.com/DotyCat/QModem.git package/qmodem
git clone --depth=1 https://github.com/DotyCat/luci-app-modeminfo.git package/luci-app-modeminfo
git clone --depth=1 https://github.com/DotyCat/luci-app-netstat.git package/luci-app-netstat
git clone --depth=1 https://github.com/DotyCat/luci-app-projectx.git package/luci-app-projectx
git clone --depth=1 https://github.com/DotyCat/luci-app-aw1k-led.git package/luci-app-aw1k-led

mkdir -p package/luci-app-passwall/luci-app-passwall/root/usr/share/passwall/rules

echo "baidu.com" > \
package/luci-app-passwall/luci-app-passwall/root/usr/share/passwall/rules/chnlist

sed -i 's/--set=llvm\.download-ci-llvm=true/--set=llvm.download-ci-llvm=false/g' feeds/packages/lang/rust/Makefile
grep -n "llvm.download-ci-llvm" feeds/packages/lang/rust/Makefile

./scripts/feeds install -a
