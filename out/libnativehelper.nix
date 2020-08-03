{ cc_library, cc_library_headers, cc_library_shared, ndk_headers }:
let

#  Copyright (C) 2009 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

jni_headers = cc_library_headers {
    name = "jni_headers";
    host_supported = true;
    export_include_dirs = ["include_jni"];
    vendor_available = true;
    target = {
        windows = {
            enabled = true;
        };
    };
};

libnativehelper_header_only = cc_library_headers {
    name = "libnativehelper_header_only";
    host_supported = true;
    export_include_dirs = ["header_only_include"];
    target = {
        windows = {
            enabled = true;
        };
    };
};

jni_platform_headers = cc_library_headers {
    name = "jni_platform_headers";
    host_supported = true;
    export_include_dirs = ["platform_include"];
    target = {
        windows = {
            enabled = true;
        };
    };
};

libnativehelper = cc_library {
    name = "libnativehelper";
    host_supported = true;
    srcs = [
        "JNIHelp.cpp"
        "JniConstants.cpp"
        "JniInvocation.cpp"
        "toStringArray.cpp"
    ];
    shared_libs = [
        "libbase"
        "liblog"
    ];
    cflags = [
        "-Werror"
        "-fvisibility=protected"
    ];
    export_include_dirs = [
        "include"
        "header_only_include"
        "platform_include"
    ];
    stubs = {
        symbol_file = "libnativehelper.map.txt";
        versions = ["1"];
    };
    target = {
        windows = {
            enabled = true;
        };
    };
};

#
#  NDK-only build for the target (device), using libc++.
#  - Relies only on NDK exposed functionality.
#  - This doesn't include JniInvocation.
#

"libnativehelper_compat_libc++" = cc_library_shared {
    name = "libnativehelper_compat_libc++";
    export_include_dirs = [
        "header_only_include"
        "include"
    ];
    cflags = ["-Werror"];
    include_dirs = [
        "libnativehelper/header_only_include"
        "libnativehelper/platform_include"
    ];
    srcs = [
        "JNIHelp.cpp"
        "JniConstants.cpp"
        "toStringArray.cpp"
    ];
    shared_libs = [
        "liblog"
    ];
    sdk_version = "19";
    stl = "c++_static";
};

"ndk_jni.h" = ndk_headers {
    name = "ndk_jni.h";
    from = "include_jni";
    to = "";
    srcs = ["include_jni/jni.h"];
    license = "NOTICE";
};

#
#  Tests.
#

subdirs = ["tests"];

in { inherit "libnativehelper_compat_libc++" "ndk_jni.h" jni_headers jni_platform_headers libnativehelper libnativehelper_header_only; }
