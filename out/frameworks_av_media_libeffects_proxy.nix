{ cc_library_shared }:
let

#  Copyright 2013 The Android Open Source Project
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

libeffectproxy = cc_library_shared {
    name = "libeffectproxy";
    relative_install_path = "soundfx";

    vendor = true;
    srcs = ["EffectProxy.cpp"];

    cflags = [
        "-fvisibility=hidden"
        "-Wall"
        "-Werror"
    ];

    include_dirs = ["frameworks/av/media/libeffects/factory"];

    header_libs = ["libaudioeffects"];
    shared_libs = [
        "liblog"
        "libcutils"
        "libutils"
        "libdl"
        "libeffects"
    ];
};

in { inherit libeffectproxy; }
