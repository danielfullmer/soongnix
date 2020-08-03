{ java_binary_host, java_library_host }:
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

#  Proto library
countryzonesprotos = java_library_host {
    name = "countryzonesprotos";
    proto = {
        type = "full";
        include_dirs = ["external/protobuf/src"];
    };

    srcs = ["src/main/proto/**/*.proto"];
};

#  The tzlookup_generator host tool.
tzlookup_generator = java_binary_host {
    name = "tzlookup_generator";

    manifest = "src/main/manifest/MANIFEST.mf";
    srcs = ["src/main/java/**/*.java"];
    javacflags = [
        "-encoding UTF-8"
    ];
    static_libs = [
        "icu4j"
        "countryzonesprotos"
        "libprotobuf-java-full"
    ];
};

in { inherit countryzonesprotos tzlookup_generator; }
