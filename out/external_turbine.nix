{ java_library_host }:
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
#

turbine = java_library_host {
    name = "turbine";

    srcs = [
        "java/**/*.java"
        "proto/**/*.proto"
    ];

    manifest = "manifest.txt";
    static_libs = [
        "error_prone_annotations"
        "guava-21.0"
        "jsr305-3.0.1"
    ];

    #  Required for use of javax.annotation.Generated per http://b/62050818
    javacflags = ["-J--add-modules=java.xml.ws.annotation"];
    plugins = ["dagger2-auto-value"];
    libs = ["dagger2-auto-value"];

    proto = {
        type = "full";
    };
};

in { inherit turbine; }
