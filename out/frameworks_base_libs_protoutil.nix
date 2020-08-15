{ cc_defaults, cc_library, cc_test }:
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
libprotoutil_defaults = cc_defaults {
    name = "libprotoutil_defaults";

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-missing-field-initializers"
        "-Wno-unused-variable"
        "-Wunused-parameter"
    ];

    srcs = [
        "src/EncodedBuffer.cpp"
        "src/ProtoFileReader.cpp"
        "src/ProtoOutputStream.cpp"
        "src/ProtoReader.cpp"
        "src/protobuf.cpp"
    ];

    shared_libs = [
        "libbase"
        "libutils"
        "libcutils"
        "liblog"
    ];
};

libprotoutil = cc_library {
    name = "libprotoutil";

    defaults = ["libprotoutil_defaults"];

    export_include_dirs = ["include"];
};

libprotoutil_test = cc_test {
    name = "libprotoutil_test";

    defaults = ["libprotoutil_defaults"];

    local_include_dirs = ["include"];

    srcs = [
        "tests/EncodedBuffer_test.cpp"
        "tests/ProtoOutputStream_test.cpp"
        "tests/protobuf_test.cpp"
        "tests/test.proto"
    ];

    shared_libs = [
        "libprotobuf-cpp-full"
    ];

    static_libs = [
        "libgmock"
    ];

    proto = {
        type = "full";
    };
};

in { inherit libprotoutil libprotoutil_defaults libprotoutil_test; }
