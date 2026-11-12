#
# Copyright (C) 2007-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ahcpd
PKG_VERSION:=20261113
PKG_RELEASE:=1

PKG_SOURCE_DATE:=2014-01-08
PKG_SOURCE_VERSION:=c36568fff791901ce3e324b84cf191471cb72c52
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-c36568fff791.tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/jech/ahcpd/tar.gz/$(PKG_SOURCE_VERSION)?
PKG_HASH:=2d00d593e38fb4066fc6ac9b147c531860c2493f064dee36e87af07a4b1a5b8a
PKG_BUILD_DIR:=$(BUILD_DIR)/ahcpd-c36568fff791901ce3e324b84cf191471cb72c52

PKG_MAINTAINER:=Gabriel Kerneis <gabriel@kerneis.info>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENCE

include $(INCLUDE_DIR)/package.mk

define Package/ahcpd
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Ad-Hoc Configuration Protocol daemon
  URL:=https://www.irif.fr/~jch/software/ahcp/
  DEPENDS:=@IPV6 +ip +librt
endef

define Package/ahcpd/description
 Ahcpd is a daemon for configuring an IPv6 network using the Ad-Hoc
 Configuration Protocol (AHCP).  AHCP is designed for wireless mesh
 networks, where IPv6 autoconfiguration and DHCPv6 do not work, but may
 also be used on wired networks.
endef

define Package/ahcpd/conffiles
/etc/config/ahcpd
endef

MAKE_FLAGS += \
	      EXTRA_DEFINES="$(TARGET_CFLAGS)"

define Package/ahcpd/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc/ahcp
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ahcp-config.sh $(1)/etc/ahcp/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ahcpd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/ahcpd.config $(1)/etc/config/ahcpd
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/ahcpd.init $(1)/etc/init.d/ahcpd
endef

$(eval $(call BuildPackage,ahcpd))
