{ cc_binary_host, cc_library_static }:
let

#  Copyright 2012 Intel Corporation
#  Copyright (C) 2010-2011 Chia-I Wu <olvaffe@gmail.com>
#  Copyright (C) 2010-2011 LunarG Inc.
#
#  Permission is hereby granted, free of charge, to any person obtaining a
#  copy of this software and associated documentation files (the "Software"),
#  to deal in the Software without restriction, including without limitation
#  the rights to use, copy, modify, merge, publish, distribute, sublicense,
#  and/or sell copies of the Software, and to permit persons to whom the
#  Software is furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included
#  in all copies or substantial portions of the Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
#  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
#  DEALINGS IN THE SOFTWARE.

build = ["Android.sources.bp"];

#
#  The libmesa_glsl_utils libraries allow us to avoid a circular dependency
#  between core mesa and glsl.
#
libmesa_glsl_utils = cc_library_static {
    name = "libmesa_glsl_utils";
    defaults = ["mesa_common_defaults"];
    host_supported = true;

    srcs = [
        "main/extensions_table.c"
        "main/imports.c"
        "program/symbol_table.c"
        "program/dummy_errors.c"
    ];
    header_libs = ["libmesa_glsl_utils_includes"];

    target = {
        host = {
            cflags = ["-D_POSIX_C_SOURCE=199309L"];
        };
    };
};

mesa_gen_matypes = cc_binary_host {
    name = "mesa_gen_matypes";
    defaults = ["mesa_common_defaults"];
    srcs = ["x86/gen_matypes.c"];
    header_libs = ["mesa_mapi_headers"];
    compile_multilib = "32";
};

libmesa_sse41 = cc_library_static {
    name = "libmesa_sse41";
    defaults = ["mesa_common_defaults"];

    srcs = [":mesa_x86_sse41_srcs"];

    cflags = [
        "-msse4.1"
        "-mstackrealign"
    ];
    header_libs = ["libmesa_sse41_includes"];

    enabled = false;
    arch = {
        x86 = {
            sse4_1 = {
                enabled = true;
            };
        };
        x86_64 = {
            sse4_1 = {
                enabled = true;
            };
        };
    };
};

in { inherit libmesa_glsl_utils libmesa_sse41 mesa_gen_matypes; }
