{ cc_library }:
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

computepipe_client_interface = cc_library {
    name = "computepipe_client_interface";
    srcs = [
        "AidlClient.cpp"
        "AidlClientImpl.cpp"
        "DebuggerImpl.cpp"
        "Factory.cpp"
        "PipeOptionsConverter.cpp"
        "StatusUtil.cpp"
    ];
    export_include_dirs = ["include"];
    header_libs = [
        "computepipe_runner_includes"
    ];
    static_libs = [
        "libcomputepipeprotos"
    ];
    shared_libs = [
        "computepipe_runner_component"
        "libbase"
        "libbinder_ndk"
        "liblog"
        "libnativewindow"
        "libutils"
        "android.automotive.computepipe.runner-ndk_platform"
        "android.automotive.computepipe.registry-ndk_platform"
        "libprotobuf-cpp-lite"
    ];
    include_dirs = [
        "packages/services/Car/computepipe"
    ];
    cflags = ["-DLOG_TAG=\"RunnerIpcInterface\""];
};

in { inherit computepipe_client_interface; }
