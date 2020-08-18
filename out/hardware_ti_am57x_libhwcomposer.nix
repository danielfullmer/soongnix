{ cc_library_shared }:
let

#  Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
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

"hwcomposer.am57x" = cc_library_shared {
    name = "hwcomposer.am57x";

    vendor = true;
    relative_install_path = "hw";

    srcs = [
        "display.cpp"
        "drmfb.cpp"
        "format.cpp"
        "hwc.cpp"
    ];

    cflags = [
        "-DLOG_TAG=\"ti_hwc\""
        "-Wno-unused-parameter"
        "-Wno-missing-field-initializers"
        "-fexceptions"
        "-Wno-implicit-fallthrough" #  in format.cpp
    ];

    shared_libs = [
        "liblog"
        "libcutils"
        "libutils"
        "libhardware"
        "libhardware_legacy"
        "libdrm"
        "libkmsxx"
    ];
};

in { inherit "hwcomposer.am57x"; }
