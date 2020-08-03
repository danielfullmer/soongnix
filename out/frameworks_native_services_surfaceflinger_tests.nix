{ cc_test }:
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

SurfaceFlinger_test = cc_test {
    name = "SurfaceFlinger_test";
    defaults = ["surfaceflinger_defaults"];
    test_suites = ["device-tests"];
    srcs = [
        "BufferGenerator.cpp"
        "Credentials_test.cpp"
        "InvalidHandles_test.cpp"
        "Stress_test.cpp"
        "SurfaceInterceptor_test.cpp"
        "Transaction_test.cpp"
        "VirtualDisplay_test.cpp"
    ];
    data = ["SurfaceFlinger_test.filter"];
    static_libs = [
        "libtrace_proto"
    ];
    shared_libs = [
        "libandroid"
        "libbinder"
        "libcutils"
        "libEGL"
        "libGLESv2"
        "libgui"
        "liblayers_proto"
        "liblog"
        "libprotobuf-cpp-full"
        "libtimestats_proto"
        "libui"
        "libutils"
    ];

};

subdirs = [
    "fakehwc"
    "hwc2"
    "unittests"
    "vsync"
    "waitforvsync"
];

in { inherit SurfaceFlinger_test; }
