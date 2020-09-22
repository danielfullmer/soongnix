{ cc_test }:
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

piperegistration_test = cc_test {
    name = "piperegistration_test";
    test_suites = ["device-tests"];
    srcs = [
        "PipeRegistrationTest.cpp"
        "FakeRunner.cpp"
    ];
    static_libs = [
        "libgtest"
        "libgmock"
    ];
    header_libs = [
        "computepipe_router_headers"
    ];
    shared_libs = [
        "libbinder_ndk"
        "libbinder"
        "libutils"
        "android.automotive.computepipe.router@1.0-impl"
        "android.automotive.computepipe.runner-ndk_platform"
        "android.automotive.computepipe.registry-ndk_platform"
    ];
};

pipequery_test = cc_test {
    name = "pipequery_test";
    test_suites = ["device-tests"];
    srcs = [
        "PipeQueryTest.cpp"
        "FakeRunner.cpp"
    ];
    static_libs = [
        "libgtest"
        "libgmock"
    ];
    header_libs = [
        "computepipe_router_headers"
    ];
    shared_libs = [
        "libbinder"
        "libbinder_ndk"
        "libutils"
        "android.automotive.computepipe.router@1.0-impl"
        "android.automotive.computepipe.runner-ndk_platform"
        "android.automotive.computepipe.registry-ndk_platform"
    ];
};

in { inherit pipequery_test piperegistration_test; }
