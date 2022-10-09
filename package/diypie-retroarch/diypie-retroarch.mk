################################################################################
#
# retroarch
#
################################################################################

DIYPIE_RETROARCH_VERSION = master
DIYPIE_RETROARCH_SITE = $(call github,DIYPie,RetroArch,$(DIYPIE_RETROARCH_VERSION))
DIYPIE_RETROARCH_LICENSE = GPL-3.0
DIYPIE_RETROARCH_LICENSE_FILES = COPYING
DIYPIE_RETROARCH_DEPENDENCIES = host-pkgconf mesa3d

DIYPIE_RETROARCH_CONFIG_OPTS = \
	--build=arm-linux \
	--prefix=$(TARGET_DIR)/usr \
	--sysconfdir=$(STAGING_DIR) \
	--host=$(TARGET_CC) \
	--disable-vg \
	--disable-opengl \
	--enable-opengles \
	--enable-egl \
	--enable-dispmanx \
	--disable-x11 \
	--disable-sdl2 \
	--disable-ffmpeg \
	--enable-udev \
	--disable-sdl \
	--disable-pulse \
	--disable-oss \
	--disable-freetype \
	--disable-7zip

# DIYPIE_RETROARCH_CONFIG_OPTS = \
# 	--build=arm-linux \
# 	--prefix=$(TARGET_DIR)/usr \
# 	--sysconfdir=$(STAGING_DIR) \
# 	--host=$(TARGET_CC) \
# 	--disable-gdi \
# 	--disable-d3dx \
# 	--disable-d3d8 \
# 	--disable-d3d9 \
# 	--disable-d3d10 \
# 	--disable-d3d11 \
# 	--disable-d3d12 \
# 	--disable-metal \
# 	--disable-opengl1 \
# 	--disable-builtinflac \
# 	--disable-builtinmbedtls \
# 	--disable-builtinzlib \
# 	--disable-x11

ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
DIYPIE_RETROARCH_CONFIG_OPTS += --enable-neon --enable-floathard
endif

ifeq ($(BR2_X86_CPU_HAS_SSE),y)
DIYPIE_RETROARCH_CONFIG_OPTS += --enable-sse
endif

# ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
# DIYPIE_RETROARCH_DEPENDENCIES += alsa-lib
# DIYPIE_RETROARCH_CONFIG_OPTS += --enable-alsa
# else
# DIYPIE_RETROARCH_CONFIG_OPTS += --disable-alsa
# endif

# ifeq ($(BR2_PACKAGE_DBUS),y)
# DIYPIE_RETROARCH_CONFIG_OPTS += --enable-dbus
# else
# DIYPIE_RETROARCH_CONFIG_OPTS += --disable-dbus
# endif

# ifeq ($(BR2_PACKAGE_DIYPIE_RETROARCH_OPENSSL),y)
# DIYPIE_RETROARCH_DEPENDENCIES += openssl
# DIYPIE_RETROARCH_CONFIG_OPTS += --enable-ssl
# else
# DIYPIE_RETROARCH_CONFIG_OPTS += --disable-ssl
# endif

# ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
# DIYPIE_RETROARCH_DEPENDENCIES += pulseaudio
# DIYPIE_RETROARCH_CONFIG_OPTS += --enable-pulse
# else
# DIYPIE_RETROARCH_CONFIG_OPTS += --disable-pulse
# endif

# ifeq ($(BR2_PACKAGE_TINYALSA),y)
# DIYPIE_RETROARCH_DEPENDENCIES += tinyalsa
# DIYPIE_RETROARCH_CONFIG_OPTS += --enable-tinyalsa
# else
# DIYPIE_RETROARCH_CONFIG_OPTS += --disable-tinyalsa
# endif

# ifeq ($(BR2_PACKAGE_JACK2),y)
# DIYPIE_RETROARCH_DEPENDENCIES += jack2
# DIYPIE_RETROARCH_CONFIG_OPTS += --enable-jack
# else
# DIYPIE_RETROARCH_CONFIG_OPTS += --disable-jack
# endif

# ifeq ($(BR2_PACKAGE_HAS_EUDEV),y)
# DIYPIE_RETROARCH_DEPENDENCIES += eudev
# DIYPIE_RETROARCH_CONFIG_OPTS += --enable-udev
# else
# DIYPIE_RETROARCH_CONFIG_OPTS += --disable-udev
# endif

# ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
# DIYPIE_RETROARCH_CONFIG_OPTS += --enable-udev
# else
# DIYPIE_RETROARCH_CONFIG_OPTS += --disable-udev
# endif

# ifeq ($(BR2_PACKAGE_XORG7),y)
# DIYPIE_RETROARCH_DEPENDENCIES += xorg7
# DIYPIE_RETROARCH_CONFIG_OPTS += --enable-x11
# else
# DIYPIE_RETROARCH_CONFIG_OPTS += --disable-x11
# endif

# ifeq ($(BR2_PACKAGE_SYSTEMD),y)
# DIYPIE_RETROARCH_DEPENDENCIES += systemd
# DIYPIE_RETROARCH_CONFIG_OPTS += --enable-systemd
# else
# DIYPIE_RETROARCH_CONFIG_OPTS += --disable-systemd
# endif

# ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
# DIYPIE_RETROARCH_CONFIG_OPTS += --enable-opengl
# DIYPIE_RETROARCH_DEPENDENCIES += mesa3d
# else
# DIYPIE_RETROARCH_CONFIG_OPTS += --disable-opengl
# endif

# ifeq ($(BR2_PACKAGE_DIYPIE_RETROARCH_EGL),y)
# DIYPIE_RETROARCH_CONFIG_OPTS += --enable-egl
# DIYPIE_RETROARCH_DEPENDENCIES += mesa3d
# else
# DIYPIE_RETROARCH_CONFIG_OPTS += --disable-egl
# endif

# ifeq ($(BR2_PACKAGE_DIYPIE_RETROARCH_DISPMANX),y)
# DIYPIE_RETROARCH_CONFIG_OPTS += \
# 	--enable-dispmanx \
# 	--enable-egl \
# 	--enable-rpng \
# 	--enable-rbmp \
# 	--enable-rjpeg
# DIYPIE_RETROARCH_DEPENDENCIES += rpi-userland
# else
# DIYPIE_RETROARCH_CONFIG_OPTS += --disable-dispmanx
# endif

# ifeq ($(BR2_PACKAGE_DIYPIE_RETROARCH_GLES),y)
# DIYPIE_RETROARCH_CONFIG_OPTS += --enable-opengles
# DIYPIE_RETROARCH_DEPENDENCIES += mesa3d
# else
# DIYPIE_RETROARCH_CONFIG_OPTS += --disable-opengles
# endif

# ifeq ($(BR2_PACKAGE_ZLIB),y)
# DIYPIE_RETROARCH_DEPENDENCIES += libzlib
# DIYPIE_RETROARCH_CONFIG_OPTS += --enable-zlib
# else
# DIYPIE_RETROARCH_CONFIG_OPTS += --disable-zlib
# endif

# ifeq ($(BR2_PACKAGE_DIYPIE_RETROARCH_FFMPEG),y)
# DIYPIE_RETROARCH_DEPENDENCIES += ffmpeg
# DIYPIE_RETROARCH_CONFIG_OPTS += --enable-ffmpeg
# else
# DIYPIE_RETROARCH_CONFIG_OPTS += --disable-ffmpeg
# endif

# ifeq ($(BR2_PACKAGE_DIYPIE_RETROARCH_QT5),y)
# DIYPIE_RETROARCH_CONFIG_OPTS += --enable-qt
# DIYPIE_RETROARCH_DEPENDENCIES += qt5base
# else
# DIYPIE_RETROARCH_CONFIG_OPTS += --disable-qt
# endif

# ifeq ($(BR2_PACKAGE_DIYPIE_RETROARCH_KMS),y)
# DIYPIE_RETROARCH_CONFIG_OPTS += --enable-kms
# DIYPIE_RETROARCH_DEPENDENCIES += mesa3d libdrm
# else
# DIYPIE_RETROARCH_CONFIG_OPTS += --disable-kms
# endif

# ifeq ($(BR2_PACKAGE_DIYPIE_RETROARCH_SDL),y)
# DIYPIE_RETROARCH_CONFIG_OPTS += --enable-sdl
# DIYPIE_RETROARCH_DEPENDENCIES += sdl
# else
# DIYPIE_RETROARCH_CONFIG_OPTS += --disable-sdl
# endif

# ifeq ($(BR2_PACKAGE_DIYPIE_RETROARCH_SDL2),y)
# DIYPIE_RETROARCH_CONFIG_OPTS += --enable-sdl2
# DIYPIE_RETROARCH_DEPENDENCIES += sdl2
# else
# DIYPIE_RETROARCH_CONFIG_OPTS += --disable-sdl2
# endif

# ifeq ($(BR2_PACKAGE_DIYPIE_RETROARCH_WAYLAND),y)
# DIYPIE_RETROARCH_CONFIG_OPTS += --enable-wayland
# DIYPIE_RETROARCH_DEPENDENCIES += mesa3d
# else
# DIYPIE_RETROARCH_CONFIG_OPTS += --disable-wayland
# endif

# ifeq ($(BR2_PACKAGE_DIYPIE_RETROARCH_V4L2),y)
# DIYPIE_RETROARCH_DEPENDENCIES += libv4l
# DIYPIE_RETROARCH_CONFIG_OPTS += --enable-v4l2
# else
# DIYPIE_RETROARCH_CONFIG_OPTS += --disable-v4l2
# endif

# ifeq ($(BR2_PACKAGE_DIYPIE_RETROARCH_XVIDEO),y)
# DIYPIE_RETROARCH_CONFIG_OPTS += --enable-xvideo
# DIYPIE_RETROARCH_DEPENDENCIES += xlib_libXv
# else
# DIYPIE_RETROARCH_CONFIG_OPTS += --disable-xvideo
# endif

# ifeq ($(BR2_PACKAGE_DIYPIE_RETROARCH_RGUI_MENU),y)
# DIYPIE_RETROARCH_CONFIG_OPTS += --enable-rgui
# else
# DIYPIE_RETROARCH_CONFIG_OPTS += --disable-rgui
# endif

# ifeq ($(BR2_PACKAGE_DIYPIE_RETROARCH_MATERIAUI_MENU),y)
# DIYPIE_RETROARCH_CONFIG_OPTS += --enable-materialui
# else
# DIYPIE_RETROARCH_CONFIG_OPTS += --disable-materialui
# endif

# ifeq ($(BR2_PACKAGE_DIYPIE_RETROARCH_XMB_MENU),y)
# DIYPIE_RETROARCH_CONFIG_OPTS += --enable-xmb
# else
# DIYPIE_RETROARCH_CONFIG_OPTS += --disable-xmb
# endif

# ifeq ($(BR2_PACKAGE_DIYPIE_RETROARCH_OZONE_MENU),y)
# DIYPIE_RETROARCH_CONFIG_OPTS += --enable-ozone
# else
# DIYPIE_RETROARCH_CONFIG_OPTS += --disable-ozone
# endif

define DIYPIE_RETROARCH_CONFIGURE_CMDS
	cd $(@D) && \
	PKG_CONF_PATH=pkg-config \
	PKG_CONFIG_PATH="$(HOST_PKG_CONFIG_PATH)" \
	CFLAGS="-DMESA_EGL_NO_X11_HEADERS" \
	$(TARGET_CONFIGURE_OPTS) \
	$(TARGET_CONFIGURE_ARGS) \
	CROSS_COMPILE="$(TARGET_CROSS)" \
	./configure $(DIYPIE_RETROARCH_CONFIG_OPTS)
endef

define DIYPIE_RETROARCH_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_ARGS) $(MAKE) -C $(@D)
	$(TARGET_MAKE_ENV) compiler=$(TARGET_CC) $(MAKE) -C $(@D)/libretro-common/audio/dsp_filters
	$(TARGET_MAKE_ENV) compiler=$(TARGET_CC) $(MAKE) -C $(@D)/gfx/video_filters
endef

define DIYPIE_RETROARCH_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/libretro/assets/
	mkdir -p $(TARGET_DIR)/usr/lib/libretro/
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info/
	mkdir -p $(TARGET_DIR)/usr/lib/retroarch/filters/video/
	mkdir -p $(TARGET_DIR)/usr/lib/retroarch/filters/audio/
	mkdir -p $(TARGET_DIR)/usr/share/libretro/autoconfig/
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
	$(TARGET_MAKE_ENV) $(MAKE) PREFIX=$(TARGET_DIR) -C $(@D)/libretro-common/audio/dsp_filters install
	$(TARGET_MAKE_ENV) $(MAKE) PREFIX=$(TARGET_DIR) -C $(@D)/gfx/video_filters install
	$(INSTALL) -m 0644 -D $(DIYPIE_RETROARCH_PKGDIR)/retroarch.cfg $(TARGET_DIR)/etc/retroarch.cfg
endef

define DIYPIE_RETROARCH_USERS
	retroarch 2000 retroarch 2000 != - - retroarch
endef

$(eval $(generic-package))
