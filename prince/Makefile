# 
# Copyright (C) 2009-2018 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=prince
PKG_VERSION:=20261113
PKG_RELEASE:=1

PKG_SOURCE_DATE:=2019-01-16
PKG_SOURCE_VERSION:=dde658a7814a8948f690b60a9196833e4cf72291
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-dde658a7814a.tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/AdvancedNetworkingSystems/prince/tar.gz/$(PKG_SOURCE_VERSION)?
PKG_HASH:=3be3e00e14c481cc104e6742da36ff4bbc60770334fbfe884bf646e2a95b07b6
PKG_BUILD_DIR:=$(BUILD_DIR)/prince-dde658a7814a8948f690b60a9196833e4cf72291

PKG_MAINTAINER:=Gabriele Gemmi <gabriel@autistici.org>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_FLAGS:=no-mips16

# out of source build
CMAKE_BINARY_SUBDIR:=build

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/prince
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Routing and Redirection
  TITLE:=Prince
  URL:=https://github.com/AdvancedNetworkingSystems/prince
  DEPENDS:=+libjson-c +libpthread
endef

define Package/prince/description
  Prince is an open source implementation of the PopRouting Algorithm.
  It has been developed as a Google Summer of Code Project in collaboration with Freifunk and the University of Trento.

  Prince fetches topology data from a Link State routing daemon (OONF, OLSR, OSPF, etc),
  calculates the betweenness centrality using the topology and then computes the
  the timers' optimal values using these data. At the end of the computation the timers are pushed back to the routing daemon.
  Since v0.4 it supports both OONF and OLSRd.
endef

define Package/prince/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/prince $(1)/usr/bin/prince

	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/build/libprince_oonf.so $(1)/usr/lib
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/build/libprince_olsr.so $(1)/usr/lib
	
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/prince.init $(1)/etc/init.d/prince
	$(INSTALL_DATA) ./files/prince.conf $(1)/etc/prince.conf
endef

CFLAGS += $(TARGET_CFLAGS) $(TARGET_CPPFLAGS)
LDFLAGS += $(TARGET_LDFLAGS)

$(eval $(call BuildPackage,prince))
