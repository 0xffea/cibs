#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license
# at http://www.opensource.org/licenses/CDDL-1.0
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each file.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
#
# Copyright (C) 2012, Nexenta Systems, Inc. All rights reserved.
#

# include guard
ifeq (,$(__quilt_mk))

build-depends += developer/quilt

patchdir = $(CURDIR)/patches

quilt-stamp: unpack-stamp
	[ ! -f "$(patchdir)/series" ] || QUILT_PATCHES="$(patchdir)" quilt push -a || test $$? = 2
	touch $@

unpatch:
	[ ! -f "$(patchdir)/series" ] || QUILT_PATCHES="$(patchdir)" quilt pop -a || test $$? = 2
	rm -f quilt-stamp

clean::
	rm -rf .pc

patch-stamp: quilt-stamp

pre-configure-stamp: patch-stamp	

__quilt_mk := included
endif

