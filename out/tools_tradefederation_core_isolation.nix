{ java_library_host }:
let

#  Copyright 2019 The Android Open Source Project
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

tradefed-isolation = java_library_host {
    name = "tradefed-isolation";
    defaults = ["tradefed_defaults"];
    srcs = [
        "com/android/tradefed/isolation/IsolationFilter.java"
        "com/android/tradefed/isolation/IsolationResultForwarder.java"
        "com/android/tradefed/isolation/IsolationRunner.java"
    ];
    static_libs = [
        "tradefed-isolation-protos"
        "tradefed-lite"
        "junit"
        "commons-cli-1.2"
    ];
};

tradefed-isolation-protos = java_library_host {
    name = "tradefed-isolation-protos";
    srcs = [
        "isolation_runner.proto"
    ];
    libs = [
        "libprotobuf-java-full"
    ];
    proto = {
        include_dirs = ["external/protobuf/src"];
        type = "full";
    };
};

in { inherit tradefed-isolation tradefed-isolation-protos; }
