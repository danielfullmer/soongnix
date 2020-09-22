{ cc_defaults, cc_library_headers, cc_library_shared, filegroup }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

libinputreporter_headers = cc_library_headers {
    name = "libinputreporter_headers";
    export_include_dirs = ["."];
};

libinputreporter_sources = filegroup {
    name = "libinputreporter_sources";
    srcs = [
        "InputReporter.cpp"
    ];
};

libinputreporter_defaults = cc_defaults {
    name = "libinputreporter_defaults";
    srcs = [":libinputreporter_sources"];
    shared_libs = [
        "liblog"
        "libutils"
    ];
    header_libs = [
        "libinputreporter_headers"
    ];
};

libinputreporter = cc_library_shared {
    name = "libinputreporter";
    defaults = [
        "inputflinger_defaults"
        "libinputreporter_defaults"
    ];
    export_header_lib_headers = [
        "libinputreporter_headers"
    ];
};

in { inherit libinputreporter libinputreporter_defaults libinputreporter_headers libinputreporter_sources; }
