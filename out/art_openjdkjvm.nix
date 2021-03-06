{ art_cc_library, cc_defaults }:
let

#
#  Copyright (C) 2016 The Android Open Source Project
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

libopenjdkjvm_defaults = cc_defaults {
    name = "libopenjdkjvm_defaults";
    defaults = ["art_defaults"];
    host_supported = true;
    srcs = ["OpenjdkJvm.cc"];
    shared_libs = [
        "libbase"
    ];
    header_libs = [
        "libnativehelper_header_only"
    ];
};

libopenjdkjvm = art_cc_library {
    name = "libopenjdkjvm";
    defaults = ["libopenjdkjvm_defaults"];
    shared_libs = [
        "libart"
        "libartbase"
    ];
};

libopenjdkjvmd = art_cc_library {
    name = "libopenjdkjvmd";
    defaults = [
        "art_debug_defaults"
        "libopenjdkjvm_defaults"
    ];
    shared_libs = [
        "libartd"
        "libartbased"
    ];
};

in { inherit libopenjdkjvm libopenjdkjvm_defaults libopenjdkjvmd; }
