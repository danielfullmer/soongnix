{ cc_binary }:
let

#
#  Copyright (C) 2017 The Android Open Source Project
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

"android.hardware.confirmationui@1.0-service" = cc_binary {
    name = "android.hardware.confirmationui@1.0-service";
    init_rc = ["android.hardware.confirmationui@1.0-service.rc"];
    vintf_fragments = ["android.hardware.confirmationui@1.0-service.xml"];
    vendor = true;
    relative_install_path = "hw";
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    srcs = [
        "service.cpp"
        "ConfirmationUI.cpp"
        "PlatformSpecifics.cpp"
    ];
    shared_libs = [
        "android.hardware.confirmationui@1.0"
        "android.hardware.confirmationui-support-lib"
        "android.hardware.keymaster@4.0"
        "libcrypto"
        "libbase"
        "libhidlbase"
        "liblog"
        "libutils"
    ];
};

in { inherit "android.hardware.confirmationui@1.0-service"; }
