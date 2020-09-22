{ cc_library_static }:
let

#  Copyright (C) 2017 The Android Open Source Project
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

libmath = cc_library_static {
    name = "libmath";
    host_supported = true;
    vendor_available = true;
    apex_available = [
        "//apex_available:platform"
        "com.android.media"
        "com.android.media.swcodec"
        "com.android.neuralnetworks"
    ];
    min_sdk_version = "29";

    export_include_dirs = ["include"];
};

subdirs = ["tests"];

in { inherit libmath; }
