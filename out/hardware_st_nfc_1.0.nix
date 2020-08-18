{ cc_library_shared }:
let

#  Copyright (C) 2011 The Android Open Source Project
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

"nfc_nci.st21nfc" = cc_library_shared {
    name = "nfc_nci.st21nfc";
    proprietary = true;
    relative_install_path = "hw";
    srcs = [
        "hal/halcore.c"

        "adaptation/i2clayer.c"
        "adaptation/android_logmsg.cpp"
        "adaptation/config.cpp"
        "nfc_nci_st21nfc.c"
        "hal_wrapper.c"
    ];
    shared_libs = [
        "liblog"
        "libcutils"
        "libdl"
        "libhardware"
    ];
    cflags = [
        "-DANDROID"
        "-DST21NFC"
        "-DDEBUG"
    ];
    local_include_dirs = [
        "include"
        "gki/ulinux"
        "gki/common"
        "adaptation"
        "hal"
    ];
    #  nfc_nci.$(TARGET_DEVICE)
};

in { inherit "nfc_nci.st21nfc"; }
