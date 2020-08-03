{ cc_defaults, cc_library, cc_library_static }:
let

#  Copyright (C) 2016 The Android Open Source Project
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

libwifi-system-defaults = cc_defaults {
    name = "libwifi-system-defaults";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
        "-Winit-self"
        "-Wno-unused-function"
        "-Wno-unused-parameter"
        "-Wshadow"
        "-Wunused-variable"
        "-Wwrite-strings"
    ];
};

#  Device independent wifi system logic.
#  ============================================================
libwifi-system = cc_library {
    name = "libwifi-system";
    defaults = ["libwifi-system-defaults"];
    export_include_dirs = ["include"];
    export_shared_lib_headers = ["libbase"];
    shared_libs = [
        "libbase"
        "libcrypto"
        "libcutils"
    ];
    srcs = [
        "hostapd_manager.cpp"
        "supplicant_manager.cpp"
    ];
};

#  Test utilities (e.g. mock classes) for libwifi-system
#  ============================================================
libwifi-system-test = cc_library_static {
    name = "libwifi-system-test";
    defaults = ["libwifi-system-defaults"];
    static_libs = ["libgmock"];
    export_include_dirs = [
        "include"
        "testlib/include"
    ];
};

in { inherit libwifi-system libwifi-system-defaults libwifi-system-test; }
