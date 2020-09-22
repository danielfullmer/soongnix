{ cc_library_shared }:
let

#
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
#

libshim_jni = cc_library_shared {
    name = "libshim_jni";
    srcs = ["Shim.c"];
    sdk_version = "24";
    apex_available = [
        "//apex_available:platform"
        "com.android.apex.cts.shim.v1"
        "com.android.apex.cts.shim.v2"
        "com.android.apex.cts.shim.v2_no_hashtree"
        "com.android.apex.cts.shim.v2_legacy"
        "com.android.apex.cts.shim.v2_sdk_target_p"
        "com.android.apex.cts.shim.v2_unsigned_payload"
        "com.android.apex.cts.shim.v3"
    ];
};

in { inherit libshim_jni; }
