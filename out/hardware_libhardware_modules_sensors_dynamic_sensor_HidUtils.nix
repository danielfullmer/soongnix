{ cc_binary_host, cc_defaults, cc_library, cc_test_host }:
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

hid_defaults = cc_defaults {
    name = "hid_defaults";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
};

libhidparser = cc_library {
    name = "libhidparser";
    defaults = ["hid_defaults"];
    host_supported = true;

    #  indended to be used by hal components, thus vendor
    vendor = true;

    srcs = [
        "HidGlobal.cpp"
        "HidItem.cpp"
        "HidLocal.cpp"
        "HidParser.cpp"
        "HidReport.cpp"
        "HidTree.cpp"
    ];
    export_include_dirs = ["."];

    target = {
        android = {
            cflags = ["-DLOG_TAG=\"HidUtil\""];
            shared_libs = ["libbase"];
        };
    };
};

#
#  Example of HidParser
#
hidparser_example = cc_binary_host {
    name = "hidparser_example";
    defaults = ["hid_defaults"];

    srcs = [
        "test/HidParserExample.cpp"
        "test/TestHidDescriptor.cpp"
    ];
    static_libs = ["libhidparser"];

    local_include_dirs = ["test"];
};

#
#  Another example of HidParser
#
hidparser_example2 = cc_binary_host {
    name = "hidparser_example2";
    defaults = ["hid_defaults"];

    srcs = [
        "test/HidParserExample2.cpp"
        "test/TestHidDescriptor.cpp"
    ];
    static_libs = ["libhidparser"];

    local_include_dirs = ["test"];
};

#
#  Test for TriState template
#
tristate_test = cc_test_host {
    name = "tristate_test";
    defaults = ["hid_defaults"];

    srcs = ["test/TriStateTest.cpp"];

    local_include_dirs = ["test"];
};

in { inherit hid_defaults hidparser_example hidparser_example2 libhidparser tristate_test; }
