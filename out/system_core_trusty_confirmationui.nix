{ cc_binary, cc_library }:
let

#  Copyright (C) 2020 The Android Open-Source Project
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
#

#  WARNING: Everything listed here will be built on ALL platforms,
#  including x86, the emulator, and the SDK.  Modules must be uniquely
#  named (liblights.panda), and must build everywhere, or limit themselves
#  to only building on ARM if they include assembly. Individual makefiles
#  are responsible for having their own logic, for fine-grained control.

"android.hardware.confirmationui@1.0-service.trusty" = cc_binary {
    name = "android.hardware.confirmationui@1.0-service.trusty";
    relative_install_path = "hw";
    vendor = true;
    shared_libs = [
        "android.hardware.confirmationui@1.0"
        "android.hardware.confirmationui.not-so-secure-input"
        "android.hardware.confirmationui@1.0-lib.trusty"
        "libbase"
        "libhidlbase"
        "libutils"
    ];

    init_rc = ["android.hardware.confirmationui@1.0-service.trusty.rc"];

    vintf_fragments = ["android.hardware.confirmationui@1.0-service.trusty.xml"];

    srcs = [
        "service.cpp"
    ];

    cflags = [
        "-Wall"
        "-Werror"
        "-DTEEUI_USE_STD_VECTOR"
    ];
};

"android.hardware.confirmationui@1.0-lib.trusty" = cc_library {
    name = "android.hardware.confirmationui@1.0-lib.trusty";
    vendor = true;
    shared_libs = [
        "android.hardware.confirmationui@1.0"
        "android.hardware.keymaster@4.0"
        "libbase"
        "libhidlbase"
        "libteeui_hal_support"
        "libtrusty"
        "libutils"
    ];

    export_include_dirs = ["include"];

    srcs = [
        "TrustyApp.cpp"
        "TrustyConfirmationUI.cpp"
    ];

    cflags = [
        "-Wall"
        "-Werror"
        "-DTEEUI_USE_STD_VECTOR"
    ];
};

"android.hardware.confirmationui.not-so-secure-input" = cc_library {
    name = "android.hardware.confirmationui.not-so-secure-input";
    vendor = true;
    shared_libs = [
        "libbase"
        "libcrypto"
        "libteeui_hal_support"
    ];

    srcs = [
        "NotSoSecureInput.cpp"
    ];

    cflags = [
        "-Wall"
        "-Werror"
        "-DTEEUI_USE_STD_VECTOR"
    ];
};

in { inherit "android.hardware.confirmationui.not-so-secure-input" "android.hardware.confirmationui@1.0-lib.trusty" "android.hardware.confirmationui@1.0-service.trusty"; }
