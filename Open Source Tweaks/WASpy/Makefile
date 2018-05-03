include /var/theos/makefiles/common.mk

TWEAK_NAME = watest
watest_FILES = Tweak.xm
watest_FRAMEWORKS = UIKit

include /var/theos/makefiles/tweak.mk

after-install::
	install.exec "killall -9 WhatsApp"
