{ cc_library_headers }:
let

#  Copyright (C) 2012 The Android Open Source Project
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

libeigen = cc_library_headers {
    name = "libeigen";

    #  Although entire directory is exported, only Eigen and unsupported/Eigen
    #  contain actual exported headers. When capturing header files for
    #  snapshot, only these two directories will be globbed.
    export_include_dirs = ["."];

    vendor_available = true;
    host_supported = true;
    apex_available = [
        "com.android.neuralnetworks"
        "test_com.android.neuralnetworks"
        "//apex_available:platform"
    ];
};

subdirs = ["blas"];

in { inherit libeigen; }
