{ cc_defaults, cc_library_headers, cc_library_shared, filegroup }:
let

#  Copyright (C) 2013 The Android Open Source Project
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

#  Default flags to be used throughout all libraries in inputflinger.
inputflinger_defaults = cc_defaults {
    name = "inputflinger_defaults";
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
        "-Wno-unused-parameter"
        "-Wthread-safety"
    ];
};

# ///////////////////////////////////////////////
#  libinputflinger
# ///////////////////////////////////////////////

libinputflinger_sources = filegroup {
    name = "libinputflinger_sources";
    srcs = [
        "InputClassifier.cpp"
        "InputClassifierConverter.cpp"
        "InputManager.cpp"
    ];
};

libinputflinger_defaults = cc_defaults {
    name = "libinputflinger_defaults";
    srcs = [":libinputflinger_sources"];
    shared_libs = [
        "android.hardware.input.classifier@1.0"
        "libbase"
        "libbinder"
        "libcrypto"
        "libcutils"
        "libhidlbase"
        "libinput"
        "liblog"
        "libstatslog"
        "libutils"
        "libui"
    ];
};

libinputflinger = cc_library_shared {
    name = "libinputflinger";
    defaults = [
        "inputflinger_defaults"
        "libinputflinger_defaults"
    ];
    cflags = [
        #  TODO(b/23084678): Move inputflinger to its own process and mark it hidden
        # -fvisibility=hidden
    ];
    shared_libs = [
        #  This should consist only of dependencies from inputflinger. Other dependencies should be
        #  in cc_defaults so that they are included in the tests.
        "libinputflinger_base"
        "libinputreporter"
        "libinputreader"
    ];
    static_libs = [
        "libinputdispatcher"
    ];
    export_static_lib_headers = [
        "libinputdispatcher"
    ];
    export_include_dirs = [
        "."
        "include"
    ];
};

# ///////////////////////////////////////////////
#  libinputflinger_base
# ///////////////////////////////////////////////

libinputflinger_headers = cc_library_headers {
    name = "libinputflinger_headers";
    export_include_dirs = ["include"];
};

libinputflinger_base_sources = filegroup {
    name = "libinputflinger_base_sources";
    srcs = [
        "InputListener.cpp"
        "InputReaderBase.cpp"
        "InputThread.cpp"
    ];
};

libinputflinger_base_defaults = cc_defaults {
    name = "libinputflinger_base_defaults";
    srcs = [":libinputflinger_base_sources"];
    shared_libs = [
        "libbase"
        "libcutils"
        "libinput"
        "liblog"
        "libutils"
    ];
    header_libs = [
        "libinputflinger_headers"
    ];
};

libinputflinger_base = cc_library_shared {
    name = "libinputflinger_base";
    defaults = [
        "inputflinger_defaults"
        "libinputflinger_base_defaults"
    ];
    export_header_lib_headers = [
        "libinputflinger_headers"
    ];
};

in { inherit inputflinger_defaults libinputflinger libinputflinger_base libinputflinger_base_defaults libinputflinger_base_sources libinputflinger_defaults libinputflinger_headers libinputflinger_sources; }
