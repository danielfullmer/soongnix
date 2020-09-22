{ cc_binary_host, cc_defaults, java_library }:
let

#
#  Copyright (C) 2015 The Android Open Source Project
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

#  ==========================================================
#  Build the host executable: protoc-gen-javastream
#  ==========================================================
protoc-gen-stream-defaults = cc_defaults {
    name = "protoc-gen-stream-defaults";
    srcs = [
        "Errors.cpp"
        "stream_proto_utils.cpp"
        "string_utils.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];

    static_libs = ["libprotoc"];
};

protoc-gen-javastream = cc_binary_host {
    name = "protoc-gen-javastream";
    srcs = [
        "java/main.cpp"
    ];

    defaults = ["protoc-gen-stream-defaults"];
};

protoc-gen-cppstream = cc_binary_host {
    name = "protoc-gen-cppstream";
    srcs = [
        "cpp/main.cpp"
    ];

    defaults = ["protoc-gen-stream-defaults"];
};

#  ==========================================================
#  Build the java test
#  ==========================================================
StreamingProtoTest = java_library {
    name = "StreamingProtoTest";
    srcs = [
        "test/src/com/android/streaming_proto_test/Main.java"
        "test/imported.proto"
        "test/test.proto"
    ];
    proto = {
        plugin = "javastream";
    };
    static_libs = ["libprotobuf-java-lite"];
};

in { inherit StreamingProtoTest protoc-gen-cppstream protoc-gen-javastream protoc-gen-stream-defaults; }
