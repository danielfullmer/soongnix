{ cc_library_headers, ndk_headers, ndk_library }:
let

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

libAAudio_headers = ndk_headers {
    name = "libAAudio_headers";
    from = "include";
    to = "";
    #  omit AAudioTesting.h; supplied separately to those who need it
    srcs = ["include/aaudio/AAudio.h"];
    license = "include/aaudio/NOTICE";
};

libaaudio = ndk_library {
    name = "libaaudio";
    #  deliberately includes symbols from AAudioTesting.h
    symbol_file = "libaaudio.map.txt";
    first_version = "26";
    unversioned_until = "current";
};

libaaudio_headers = cc_library_headers {
    name = "libaaudio_headers";
    export_include_dirs = ["include"];
    version_script = "libaaudio.map.txt";
};

in { inherit libAAudio_headers libaaudio libaaudio_headers; }
