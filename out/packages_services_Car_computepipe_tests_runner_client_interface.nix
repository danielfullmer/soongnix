{ cc_test }:
let

#  Copyright (C) 2020 The Android Open Source Project
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

clientinterface_test = cc_test {
    name = "clientinterface_test";
    test_suites = ["device-tests"];
    srcs = [
        "ClientInterfaceTest.cc"
        "PipeOptionsConverterTest.cpp"
    ];
    static_libs = [
        "libgtest"
        "libgmock"
        "libcomputepipeprotos"
    ];
    header_libs = [
        "computepipe_router_headers"
        "computepipe_runner_includes"
    ];
    include_dirs = ["packages/services/Car/computepipe"];
    shared_libs = [
        "libbinder_ndk"
        "libutils"
        "libnativewindow"
        "computepipe_client_interface"
        "computepipe_runner_component"
        "android.automotive.computepipe.registry-ndk_platform"
        "android.automotive.computepipe.runner-ndk_platform"
        "android.automotive.computepipe.runner-ndk_platform"
        "libprotobuf-cpp-lite"
    ];
};

in { inherit clientinterface_test; }
