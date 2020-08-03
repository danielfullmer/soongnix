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

#  Make the JNI part
#  ============================================================
libwifi-service = cc_library_shared {
    name = "libwifi-service";

    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
        "-Wno-unused-parameter"
        "-Wno-unused-function"
        "-Wunused-variable"
        "-Winit-self"
        "-Wwrite-strings"
        "-Wshadow"
    ];

    shared_libs = [
        "liblog"
        "libnativehelper"
        "libcutils"
        "libutils"
        "libdl"
    ];

    srcs = [
        "jni/com_android_server_wifi_WifiNative.cpp"
        "jni/jni_helper.cpp"
    ];

    product_variables = {
        pdk = {
            enabled = false;
        };
    };
};

in { inherit libwifi-service; }
