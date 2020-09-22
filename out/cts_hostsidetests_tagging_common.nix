{ cc_test_library, java_library }:
let

#  Copyright (C) 2020 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

# ##############################################################################
#  Build the common library for use device-side
# ##############################################################################

tagging-common-devicesidelib = java_library {
    name = "tagging-common-devicesidelib";
    srcs = ["src/android/cts/tagging/Utils.java"];
    sdk_version = "current";
};

libtagging-common-devicesidelib-jni = cc_test_library {
    name = "libtagging-common-devicesidelib-jni";
    srcs = ["jni/android_cts_tagging_Utils.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    sdk_version = "current";
    gtest = false;
};

in { inherit libtagging-common-devicesidelib-jni tagging-common-devicesidelib; }
