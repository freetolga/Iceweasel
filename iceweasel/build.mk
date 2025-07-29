# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

installer:
	@$(MAKE) -C iceweasel/installer installer

package:
	@$(MAKE) -C iceweasel/installer make-archive

l10n-package:
	@$(MAKE) -C iceweasel/installer make-langpack

mozpackage:
	@$(MAKE) -C iceweasel/installer

package-compare:
	@$(MAKE) -C iceweasel/installer package-compare

stage-package:
	@$(MAKE) -C iceweasel/installer stage-package make-buildinfo-file

sdk:
	@$(MAKE) -C iceweasel/installer make-sdk

install::
	@$(MAKE) -C iceweasel/installer install

clean::
	@$(MAKE) -C iceweasel/installer clean

distclean::
	@$(MAKE) -C iceweasel/installer distclean

source-package::
	@$(MAKE) -C iceweasel/installer source-package

upload::
	@$(MAKE) -C iceweasel/installer upload

source-upload::
	@$(MAKE) -C iceweasel/installer source-upload

hg-bundle::
	@$(MAKE) -C iceweasel/installer hg-bundle

l10n-check::
	@$(MAKE) -C iceweasel/locales l10n-check

ifdef ENABLE_TESTS
# Implemented in testing/testsuite-targets.mk

mochitest-browser-chrome:
	$(RUN_MOCHITEST) --flavor=browser
	$(CHECK_TEST_ERROR)

mochitest:: mochitest-browser-chrome

.PHONY: mochitest-browser-chrome

endif
