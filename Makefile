include $(TOPDIR)/rules.mk
PKG_NAME:=binl_server
PKG_VERSION:=1.0
PKG_RELEASE:=1
PKG_LICENSE:=GPL-2.0-or-later
include $(INCLUDE_DIR)/package.mk
define Package/binl_server
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Mini Binl Server
	URL:=https://github.com/Florin9doi/ris-linux
	DEPENDS:= +uci
endef
define Package/binl_server/description
	Mini Binl Server
endef
define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef
define Package/binl_server/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/binl_server $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/binl_server.init $(1)/etc/init.d/binl_server
endef
$(eval $(call BuildPackage,binl_server))
