{ cc_binary, cc_library_shared }:
let

#
#  Copyright (C) 2015 The Android Open-Source Project
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

#  trusty_keymaster is a binary used only for on-device testing.  It
#  runs Trusty Keymaster through a basic set of operations with RSA
#  and ECDSA keys.
trusty_keymaster_tipc = cc_binary {
    name = "trusty_keymaster_tipc";
    vendor = true;
    srcs = [
        "ipc/trusty_keymaster_ipc.cpp"
        "legacy/trusty_keymaster_device.cpp"
        "legacy/trusty_keymaster_main.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];

    local_include_dirs = ["include"];

    shared_libs = [
        "libcrypto"
        "libcutils"
        "libkeymaster_portable"
        "libtrusty"
        "libkeymaster_messages"
        "libsoftkeymasterdevice"
        "liblog"
    ];
};

#  keystore.trusty is the HAL used by keystore on Trusty devices.
"keystore.trusty" = cc_library_shared {
    name = "keystore.trusty";
    vendor = true;
    relative_install_path = "hw";
    srcs = [
        "ipc/trusty_keymaster_ipc.cpp"
        "legacy/module.cpp"
        "legacy/trusty_keymaster_device.cpp"
    ];

    cflags = [
        "-fvisibility=hidden"
        "-Wall"
        "-Werror"
    ];

    local_include_dirs = ["include"];

    shared_libs = [
        "libcrypto"
        "libkeymaster_messages"
        "libtrusty"
        "liblog"
        "libcutils"
    ];
    header_libs = ["libhardware_headers"];
};

"android.hardware.keymaster@3.0-service.trusty" = cc_binary {
    name = "android.hardware.keymaster@3.0-service.trusty";
    defaults = ["hidl_defaults"];
    relative_install_path = "hw";
    vendor = true;
    init_rc = ["3.0/android.hardware.keymaster@3.0-service.trusty.rc"];
    srcs = [
        "3.0/service.cpp"
        "3.0/TrustyKeymaster3Device.cpp"
        "ipc/trusty_keymaster_ipc.cpp"
        "TrustyKeymaster.cpp"
    ];

    local_include_dirs = ["include"];

    shared_libs = [
        "liblog"
        "libcutils"
        "libdl"
        "libbase"
        "libutils"
        "libhardware"
        "libhidlbase"
        "libtrusty"
        "libkeymaster_messages"
        "libkeymaster3device"
        "android.hardware.keymaster@3.0"
    ];
};

"android.hardware.keymaster@4.0-service.trusty" = cc_binary {
    name = "android.hardware.keymaster@4.0-service.trusty";
    defaults = ["hidl_defaults"];
    relative_install_path = "hw";
    vendor = true;
    init_rc = ["4.0/android.hardware.keymaster@4.0-service.trusty.rc"];
    srcs = [
        "4.0/service.cpp"
        "4.0/TrustyKeymaster4Device.cpp"
        "ipc/trusty_keymaster_ipc.cpp"
        "TrustyKeymaster.cpp"
    ];

    local_include_dirs = ["include"];

    shared_libs = [
        "liblog"
        "libcutils"
        "libdl"
        "libbase"
        "libutils"
        "libhardware"
        "libhidlbase"
        "libtrusty"
        "libkeymaster_messages"
        "libkeymaster4"
        "android.hardware.keymaster@4.0"
    ];

    vintf_fragments = ["4.0/android.hardware.keymaster@4.0-service.trusty.xml"];
};

in { inherit "android.hardware.keymaster@3.0-service.trusty" "android.hardware.keymaster@4.0-service.trusty" "keystore.trusty" trusty_keymaster_tipc; }
