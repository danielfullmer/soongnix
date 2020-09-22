{ cc_library_static }:
let

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

libhealthloop = cc_library_static {
    name = "libhealthloop";
    vendor_available = true;
    recovery_available = true;
    srcs = [
        "HealthLoop.cpp"
        "utils.cpp"
    ];
    shared_libs = [
        "libcutils"
        "libbase"
    ];
    header_libs = [
        "libbatteryservice_headers"
        "libhealthd_headers"
        "libutils_headers"
    ];
    export_include_dirs = [
        "include"
    ];
};

in { inherit libhealthloop; }
