{ cc_library_headers, cc_library_static }:
let

/*
 * Copyright 2018 The Android Open Source Project
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

philox_random_headers = cc_library_headers {
    name = "philox_random_headers";
    host_supported = false;
    vendor_available = true;
    export_include_dirs = ["."];
};

philox_random = cc_library_static {
    name = "philox_random";
    host_supported = false;
    vendor_available = true;
    srcs = [
        "guarded_philox_random.cc"
        "random.cc"
        "simple_philox.cc"
    ];
    cflags = [
        "-Wno-unused-parameter"
        "-Wno-invalid-partial-specialization"
    ];
    header_libs = [
        "libeigen"
        "philox_random_headers"
        "tensorflow_headers"
    ];
};

in { inherit philox_random philox_random_headers; }
