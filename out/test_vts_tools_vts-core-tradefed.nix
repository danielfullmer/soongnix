{ java_library_host, tradefed_binary_host }:
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

vts-core-tradefed-harness = java_library_host {
    name = "vts-core-tradefed-harness";
    srcs = [
        "src/com/android/tradefed/targetprep/MultiSimPreparer.java"
        "src/com/android/tradefed/testtype/binary/KernelTargetTest.java"
        "src/com/android/tradefed/testtype/suite/module/KernelTestModuleController.java"
        "src/com/android/tradefed/util/TargetFileUtils.java"
    ];
    java_resource_dirs = ["res"];
    libs = [
        "tradefed"
        "compatibility-host-util"
    ];
    static_libs = [
        "compatibility-tradefed"
    ];
};

vts-tradefed = tradefed_binary_host {
    name = "vts-tradefed";
    wrapper = "etc/vts-tradefed";
    short_name = "VTS";
    full_name = "Vendor Test Suite";
    version = "11_r1";
    static_libs = [
        "cts-tradefed-harness"
        "vts-core-tradefed-harness"
    ];
    required = ["compatibility-host-util"];
};

in { inherit vts-core-tradefed-harness vts-tradefed; }
