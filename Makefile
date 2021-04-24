TARGET := iphone:clang:latest:13.0
INSTALL_TARGET_PROCESSES = YouTube

FINALPACKAGE=1
DEBUG=0

ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AutoYouTubeDarkMode
AutoYouTubeDarkMode_FILES = Tweak.xm
AutoYouTubeDarkMode_CFLAGS = -fobjc-arc
AutoYouTubeDarkMode_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
