{ cc_binary }:
let

#
#  Copyright (C) 2019 The Android Open Source Project
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

"android.frameworks.automotive.display@1.0-service" = cc_binary {
    name = "android.frameworks.automotive.display@1.0-service";
    defaults = ["hidl_defaults"];
    srcs = [
        "main_automotivedisplayproxy.cpp"
        "AutomotiveDisplayProxyService.cpp"
    ];
    init_rc = ["android.frameworks.automotive.display@1.0-service.rc"];

    shared_libs = [
        "android.frameworks.automotive.display@1.0"
        "android.hardware.graphics.bufferqueue@2.0"
        "libgui"
        "libhidlbase"
        "liblog"
        "libui"
        "libutils"
    ];

    local_include_dirs = [
        "include"
    ];

    cflags = [
        "-DLOG_TAG=\"AutomotiveDisplayService\""
    ];

    vintf_fragments = [
        "manifest_android.frameworks.automotive.display@1.0.xml"
    ];
};

in { inherit "android.frameworks.automotive.display@1.0-service"; }
