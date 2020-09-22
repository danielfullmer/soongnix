{ cc_test_library }:
let

#  Copyright (C) 2013 The Android Open Source Project
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

#  Test effect library
libctstesteffect = cc_test_library {
    name = "libctstesteffect";
    srcs = ["CTSTestEffect.cpp"];
    cflags = [
        "-O2"
        "-fvisibility=hidden"
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
        "-Wno-gnu-designator"
    ];
    relative_install_path = "soundfx";
    include_dirs = ["system/media/audio_effects/include"];
};

in { inherit libctstesteffect; }
