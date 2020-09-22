{ cc_library_shared }:
let

#
#  Copyright (C) 2018 The Android Open Source Project
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
"nfc_nci.st21nfc.default" = cc_library_shared {
    name = "nfc_nci.st21nfc.default";
    defaults = ["hidl_defaults"];
    proprietary = true;

    cflags = [
        "-DST21NFC"
        "-Wall"
        "-Werror"
        "-Wextra"
    ];

    srcs = [
        "adaptation/android_logmsg.cpp"
        "adaptation/config.cpp"
        "adaptation/i2clayer.cc"
        "hal/halcore.cc"
        "hal_wrapper.cc"
        "hal/hal_fd.cc"
    ];

    local_include_dirs = [
        "gki/common"
        "gki/ulinux"
        "hal"
        "include"
    ];

    export_include_dirs = [
        "include"
        "gki/ulinux"
    ];
    shared_libs = [
        "libbase"
        "libcutils"
        "libhardware"
        "libhardware_legacy"
        "libhidlbase"
        "liblog"
        "libutils"
    ];
};

in { inherit "nfc_nci.st21nfc.default"; }
