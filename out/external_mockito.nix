{ java_import_host, java_library_host, java_library_static }:
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
#
#

#  Builds the Mockito source code, but does not include any run-time
#  dependencies. Most projects should use mockito-target instead, which includes
#  everything needed to run Mockito tests.
mockito = java_library_static {
    name = "mockito";
    host_supported = true;
    hostdex = true;
    no_framework_libs = true;
    srcs = ["src/main/java/**/*.java"];

    libs = [
        "junit"
        "objenesis"
    ];

    target = {
        android = {
            #  Exclude source used to dynamically create classes since target builds use
            #  dexmaker instead and including it causes conflicts.
            exclude_srcs = [
                "src/main/java/org/mockito/internal/creation/bytebuddy/**/*.java"
            ];
        };
        host = {
            static_libs = [
                "mockito-byte-buddy"
                "mockito-byte-buddy-agent"
            ];
        };
    };
    sdk_version = "core_current";
    java_version = "1.7";

    errorprone = {
        javacflags = [
            "-Xep:CollectionIncompatibleType:WARN" #  b/74213384
        ];
    };
};

#  Compatibility library for old name of host target
mockito-host = java_library_host {
    name = "mockito-host";
    static_libs = ["mockito"];
};

#  Compatibility library for old name of api target
mockito-api = java_library_static {
    name = "mockito-api";
    hostdex = true;
    no_framework_libs = true;
    static_libs = ["mockito"];
    sdk_version = "core_current";
};

#  Compatibility library for old name of host target
mockito-inline = java_library_host {
    name = "mockito-inline";
    static_libs = ["mockito"];
    java_resource_dirs = ["subprojects/inline/src/main/resources"];
};

#  Host prebuilt dependencies.
#  ============================================================
mockito-byte-buddy = java_import_host {
    name = "mockito-byte-buddy";
    jars = ["lib/byte-buddy-1.8.15.jar"];
};

mockito-byte-buddy-agent = java_import_host {
    name = "mockito-byte-buddy-agent";
    jars = ["lib/byte-buddy-agent-1.8.15.jar"];
};

in { inherit mockito mockito-api mockito-byte-buddy mockito-byte-buddy-agent mockito-host mockito-inline; }
