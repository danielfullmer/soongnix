{ cc_library }:
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

libhidladapter = cc_library {
    name = "libhidladapter";
    defaults = ["libhidl-defaults"];
    vendor_available = true;
    #  TODO(b/153609531): remove when no longer needed.
    native_bridge_supported = true;
    srcs = [
        "HidlBinderAdapter.cpp"
    ];
    export_include_dirs = ["include"];
    shared_libs = [
        "libbase"
        "libhidlbase"
        "liblog"
        "libutils"
    ];
    export_shared_lib_headers = [
        "libhidlbase"
        "libutils"
    ];
};

in { inherit libhidladapter; }
