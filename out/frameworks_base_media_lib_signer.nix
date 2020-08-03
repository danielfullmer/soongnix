{ java_sdk_library }:
let

#
#  Copyright (C) 2018 The Android Open Source Project
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

"com.android.mediadrm.signer" = java_sdk_library {
    name = "com.android.mediadrm.signer";
    srcs = ["java/**/*.java"];
    api_packages = ["com.android.mediadrm.signer"];
    srcs_lib = "framework";
    srcs_lib_whitelist_dirs = ["media/java"];
    srcs_lib_whitelist_pkgs = ["android.media"];
};

in { inherit "com.android.mediadrm.signer"; }
