#
# Copyright (C) 2007-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ndppd
PKG_VERSION:=20261113
PKG_RELEASE:=1

PKG_SOURCE_DATE:=2026-10-17
PKG_SOURCE_VERSION:=a8d5bc06b672d5ad7d53ccacc793851e1328d599
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-a8d5bc06b672.tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/DanielAdolfsson/ndppd/tar.gz/$(PKG_SOURCE_VERSION)?
PKG_HASH:=6e67d904ada509085f4ba5c4867278d2e7718fb2e53ffe4f257e0d5a427ff2af
PKG_BUILD_DIR:=$(BUILD_DIR)/ndppd-a8d5bc06b672d5ad7d53ccacc793851e1328d599

PKG_LICENSE:=GPL-3.0-or-later

include $(INCLUDE_DIR)/package.mk

define Package/ndppd
  SECTION:=net
  CATEGORY:=Network
  TITLE:=NDP Proxy Daemon
  URL:=http://www.priv.nu/projects/ndppd/
  MAINTAINER:=Gabriel Kerneis <gabriel@kerneis.info>
  DEPENDS:=@IPV6
endef

define Package/ndppd/description
 ndppd, or NDP Proxy Daemon, is a daemon that proxies NDP (Neighbor Discovery
 Protocol) messages between interfaces.  ndppd currently only supports Neighbor
 Solicitation Messages and Neighbor Advertisement Messages.

 The ndp_proxy provided by Linux doesn't support listing proxies, and only hosts
 are supported.  No subnets.  ndppd solves this by listening for Neighbor
 Solicitation messages on an interface, then query the internal interfaces for
 that target IP before finally sending a Neighbor Advertisement message.
endef

define Package/ndppd/conffiles
/etc/ndppd.conf
endef

define Build/Compile
	$(call Build/Compile/Default,ndppd)
endef

define Package/ndppd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ndppd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/ndppd.init $(1)/etc/init.d/ndppd
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/ndppd.conf-dist $(1)/etc/ndppd.conf
endef

$(eval $(call BuildPackage,ndppd))
