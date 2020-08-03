{ cc_defaults, cc_library_headers }:
let

/*
 * Copyright 2017 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

neuralnetworks_defaults = cc_defaults {
    name = "neuralnetworks_defaults";
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
        "-O3"
    ];
    product_variables = {
        debuggable = { #  eng and userdebug builds
            cflags = ["-DNN_DEBUGGABLE"];
        };
    };
};

libneuralnetworks_generated_test_harness_headers = cc_library_headers {
    name = "libneuralnetworks_generated_test_harness_headers";
    host_supported = false;
    export_include_dirs = ["tools/test_generator/include"];
};

libneuralnetworks_generated_tests = cc_library_headers {
    name = "libneuralnetworks_generated_tests";
    host_supported = false;
    export_include_dirs = ["runtime/test/generated"];
};

libneuralnetworks_generated_test_harness = cc_library_headers {
    name = "libneuralnetworks_generated_test_harness";
    host_supported = false;
    export_include_dirs = ["runtime/test/"];
};

in { inherit libneuralnetworks_generated_test_harness libneuralnetworks_generated_test_harness_headers libneuralnetworks_generated_tests neuralnetworks_defaults; }
