#!/bin/bash

cd openwrt || exit 1

sed -i 's/192.168.1.1/192.168.1.1/g' package/base-files/files/bin/config_generate
sed -i "s/hostname='.*'/hostname='DOTYWRT'/g" package/base-files/files/bin/config_generate

./scripts/feeds update -a

rm -rf feeds/luci/applications/luci-app-argon-config
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/applications/luci-app-passwall
rm -rf feeds/luci/applications/luci-app-openclash

rm -rf feeds/packages/net/xray-core
rm -rf feeds/packages/net/v2ray-geodata
rm -rf feeds/packages/net/sing-box
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
rm -rf feeds/packages/net/geoview
rm -rf feeds/packages/net/shadow-tls

git clone --depth=1 https://github.com/sbwml/openwrt_helloworld.git package/openwrt_helloworld

rm -rf package/openwrt_helloworld/geoview

git clone --depth=1 https://github.com/DotyCat/luci-theme-argon.git feeds/luci/themes/luci-theme-argon
git clone --depth=1 https://github.com/DotyCat/luci-app-argon-config.git feeds/luci/applications/luci-app-argon-config

git clone --depth=1 https://github.com/DotyCat/QModem.git package/qmodem
git clone --depth=1 https://github.com/DotyCat/luci-app-modeminfo.git package/luci-app-modeminfo
git clone --depth=1 https://github.com/DotyCat/luci-app-netstat.git package/luci-app-netstat
git clone --depth=1 https://github.com/DotyCat/luci-app-xraycustom.git package/luci-app-xraycustom
git clone --depth=1 https://github.com/DotyCat/luci-app-aw1k-led.git package/luci-app-aw1k-led

git clone --depth=1 https://github.com/DotyCat/geoview.git package/openwrt_helloworld/geoview

mkdir -p package/luci-app-passwall/luci-app-passwall/root/usr/share/passwall/rules

echo "baidu.com" > \
package/luci-app-passwall/luci-app-passwall/root/usr/share/passwall/rules/chnlist

./scripts/feeds install -a
