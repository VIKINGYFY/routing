#
# Copyright (C) 2008-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=vis
PKG_VERSION:=20261113
PKG_SOURCE_SUBDIR:=vis-2016.03.10~7710cce4
PKG_SOURCE:=$(PKG_SOURCE_SUBDIR).tar.zst
PKG_RELEASE:=2
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2016-03-10
PKG_SOURCE_VERSION:=7710cce42e8d63ea114056a4a140835d4a452933
PKG_SOURCE_URL:=https://git.open-mesh.org/vis.git
PKG_MIRROR_HASH:=5fa4d2edd0e62fff7d86b36df76ca5e60c63673875862e3fcc8ddbb12617995e

PKG_MAINTAINER:=Corinna Aichele <onelektra@gmx.net>
PKG_LICENSE:=GPL-2.0-only

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/vis
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Routing and Redirection
  DEPENDS:=+libpthread
  TITLE:=visualization server for B.A.T.M.A.N. layer 3
  URL:=https://www.open-mesh.org/
endef

define Package/vis/description
visualization server for B.A.T.M.A.N. layer 3
endef

MAKE_FLAGS += \
	EXTRA_CFLAGS='-DDEBUG_MALLOC -DMEMORY_USAGE -DPROFILE_DATA -DREVISION_VERSION=\"\ rv$(PKG_SOURCE_VERSION)\" -D_GNU_SOURCE' \
	REVISION="$(PKG_SOURCE_VERSION)" \
	CC="$(TARGET_CC)" \
	vis

define Package/vis/install
	$(INSTALL_DIR) $(1)/usr/sbin $(1)/etc/config $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/vis $(1)/usr/sbin/
	$(INSTALL_BIN) ./files/etc/init.d/vis $(1)/etc/init.d
	$(INSTALL_CONF) ./files/etc/config/vis $(1)/etc/config
endef

define Package/vis/conffiles
/etc/config/vis
endef

$(eval $(call BuildPackage,vis))
