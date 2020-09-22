{ cc_library_static }:
let

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
libandroidicu_static = cc_library_static {
    name = "libandroidicu_static";
    host_supported = true;
    native_bridge_supported = true;
    srcs = [
        "shim.cpp"
    ];
    shared_libs = [
        "libicuuc"
        "libicui18n"
    ];
    cppflags = [
        "-std=c++11" #  Use the same standard as libicuuc
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-DU_SHOW_CPLUSPLUS_API=0"
    ];
    target = {
        android = {
            cflags = [
                "-DANDROID_LINK_SHARED_ICU4C"
            ];
        };
        windows = {
            enabled = true;
        };
    };
    apex_available = [
        "com.android.art.release"
        "com.android.art.debug"
        #  b/133140750 Clean this up. This is due to the dependency to from libmedia
        "//apex_available:platform"
    ];
};

in { inherit libandroidicu_static; }
