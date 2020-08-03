{ cc_library_headers }:
let

#
#  Copyright (C) 2016 The Android Open Source Project
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

#  Header only.
libgsl = cc_library_headers {
    name = "libgsl";
    host_supported = true;
    export_include_dirs = ["include"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    vendor_available = true;
};

#  Tests pending approval of external/Microsoft-unittest-cpp: http://b/32512867

in { inherit libgsl; }
