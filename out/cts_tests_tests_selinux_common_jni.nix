{ cc_test_library }:
let

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

libctsselinux_jni = cc_test_library {
    name = "libctsselinux_jni";
    srcs = [
        "CtsSecurityJniOnLoad.cpp"
        "android_security_SELinuxTargetSdkTest.cpp"
    ];
    shared_libs = [
        "libbase"
        "libc++"
        "libcrypto"
        "liblog"
        "libnativehelper"
        "libpackagelistparser"
        "libpcre2"
        "libselinux"
    ];
    gtest = false;
};

in { inherit libctsselinux_jni; }