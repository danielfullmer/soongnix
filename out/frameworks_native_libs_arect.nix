{ cc_library_static, ndk_headers }:
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

libarect_headers = ndk_headers {
    name = "libarect_headers";
    from = "include/android";
    to = "android";
    srcs = ["include/android/*.h"];
    license = "NOTICE";
};

libarect = cc_library_static {
    name = "libarect";
    host_supported = true;
    vendor_available = true;
    export_include_dirs = ["include"];
    target = {
        windows = {
            enabled = true;
        };
    };
};

in { inherit libarect libarect_headers; }
