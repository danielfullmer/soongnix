{ cc_library_headers }:
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

libnativebase_headers = cc_library_headers {
    name = "libnativebase_headers";
    vendor_available = true;
    host_supported = true;
    #  TODO(b/153609531): remove when no longer needed.
    native_bridge_supported = true;
    export_include_dirs = ["include"];

    target = {
        linux_bionic = {
            enabled = true;
        };
        windows = {
            enabled = true;
        };
    };
    min_sdk_version = "29";
};

in { inherit libnativebase_headers; }
