include $(TOPDIR)/rules.mk

PKG_NAME:=pimbd
PKG_VERSION:=20261113
PKG_RELEASE:=1

PKG_SOURCE_DATE:=2018-06-19
PKG_SOURCE_VERSION:=dbf4e5913b06e3160f506df15e6a047a403a5f21
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-dbf4e5913b06.tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/Oryon/pimbd/tar.gz/$(PKG_SOURCE_VERSION)?
PKG_HASH:=9ab30c50682aeb77bba58675b4dc6b4bd867f1321034f9b1a85f76b32ef5352d
PKG_BUILD_DIR:=$(BUILD_DIR)/pimbd-dbf4e5913b06e3160f506df15e6a047a403a5f21

PKG_MAINTAINER:=Pierre Pfister <pierre.pfister@darou.fr>
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

# Spammy debug builds for now
CMAKE_OPTIONS += -DL_LEVEL=7 \
		 -DWITH_LIBUBOX=1

define Package/pimbd
  SECTION:=net
  CATEGORY:=Network
  TITLE:=PIM BIDIR daemon
  URL:=https://github.com/Oryon/pimbd.git
  DEPENDS+=@IPV6
  DEPENDS+=netifd
endef

define Package/pimbd/description
  This package provides a daemon which implements the Protocol Independent
  Multicast BIDIR routing protocol. Note that a routing protocol must be
  installed and running in order for PIM to function.
endef

define Package/pimbd/install
	$(INSTALL_DIR) $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/pimbd $(1)/usr/sbin/pimbd
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/generic/pimbc.sh $(1)/usr/sbin/pimbc
	ln -s pimbd $(1)/usr/sbin/pimb-ipc
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/pimbd.init $(1)/etc/init.d/pimbd
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) files/firewall-uci.sh $(1)/etc/uci-defaults/99_pimbd_firewall
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/pimb.config $(1)/etc/config/pimb
endef

$(eval $(call BuildPackage,pimbd))
