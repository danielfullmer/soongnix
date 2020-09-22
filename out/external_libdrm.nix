{ cc_defaults, cc_library }:
let

#
#  Copyright © 2011-2012 Intel Corporation
#
#  Permission is hereby granted, free of charge, to any person obtaining a
#  copy of this software and associated documentation files (the "Software"),
#  to deal in the Software without restriction, including without limitation
#  the rights to use, copy, modify, merge, publish, distribute, sublicense,
#  and/or sell copies of the Software, and to permit persons to whom the
#  Software is furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice (including the next
#  paragraph) shall be included in all copies or substantial portions of the
#  Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
#  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
#  IN THE SOFTWARE.
#

subdirs = ["*"];
build = ["Android.sources.bp"];

libdrm_defaults = cc_defaults {
    name = "libdrm_defaults";
    cflags = [
        #  XXX: Consider moving these to config.h analogous to autoconf.
        "-DMAJOR_IN_SYSMACROS=1"
        "-DHAVE_VISIBILITY=1"
        "-DHAVE_LIBDRM_ATOMIC_PRIMITIVES=1"

        "-Wall"
        "-Werror"
        "-Wno-deprecated-declarations"
        "-Wno-format"
        "-Wno-gnu-variable-sized-type-not-at-end"
        "-Wno-implicit-function-declaration"
        "-Wno-int-conversion"
        "-Wno-missing-field-initializers"
        "-Wno-pointer-arith"
        "-Wno-unused-parameter"
        "-Wno-unused-variable"
    ];
    export_system_include_dirs = ["."];
};

#  Library for the device
libdrm = cc_library {
    name = "libdrm";
    recovery_available = true;
    vendor_available = true;
    host_supported = true;
    defaults = [
        "libdrm_defaults"
        "libdrm_sources"
    ];

    export_include_dirs = [
        "include/drm"
        "android"
    ];

    cflags = [
        "-Wno-enum-conversion"
        "-Wno-pointer-arith"
        "-Wno-sign-compare"
        "-Wno-tautological-compare"
    ];
};

in { inherit libdrm libdrm_defaults; }
