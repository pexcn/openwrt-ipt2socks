include $(TOPDIR)/rules.mk

PKG_NAME:=ipt2socks
PKG_VERSION:=1.1.3
PKG_RELEASE:=2

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/zfl9/ipt2socks.git
PKG_SOURCE_VERSION:=384dab4bae5ed9402e07ec1950e502c05812bc26
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/$(PKG_SOURCE_SUBDIR)

PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=pexcn <i@pexcn.me>

include $(INCLUDE_DIR)/package.mk

define Package/ipt2socks
	SECTION:=net
	CATEGORY:=Network
	TITLE:=Utility for converting iptables (REDIRECT/TPROXY) to SOCKS5
	URL:=https://github.com/zfl9/ipt2socks
endef

define Package/ipt2socks/description
Utility for converting iptables (REDIRECT/TPROXY) to SOCKS5.
endef

define Package/ipt2socks/conffiles
/etc/config/ipt2socks
endef

define Package/ipt2socks/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ipt2socks $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) files/ipt2socks.init $(1)/etc/init.d/ipt2socks
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) files/ipt2socks.config $(1)/etc/config/ipt2socks
endef

$(eval $(call BuildPackage,ipt2socks))
