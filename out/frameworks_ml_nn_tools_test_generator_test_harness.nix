{ cc_library_headers, cc_library_static, filegroup }:
let

#
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
#

libneuralnetworks_generated_test_harness = cc_library_static {
    name = "libneuralnetworks_generated_test_harness";
    srcs = [
        "TestHarness.cpp"
    ];
    host_supported = false;
    defaults = ["neuralnetworks_defaults"];
    export_include_dirs = ["include"];
    static_libs = [
        "libbase"
        "libgmock"
        "libgtest"
    ];
};

#  Deprecated.
libneuralnetworks_generated_test_harness_headers = cc_library_headers {
    name = "libneuralnetworks_generated_test_harness_headers";
    host_supported = false;
    export_include_dirs = ["include_legacy"];
};

#  For CTS that cannot depend on non-NDK library.
libneuralnetworks_generated_test_harness_for_cts = filegroup {
    name = "libneuralnetworks_generated_test_harness_for_cts";
    srcs = [
        "TestHarness.cpp"
    ];
};

in { inherit libneuralnetworks_generated_test_harness libneuralnetworks_generated_test_harness_for_cts libneuralnetworks_generated_test_harness_headers; }
