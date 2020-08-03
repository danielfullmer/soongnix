{ java_import_host, java_library_host }:
let

#  Copyright (C) 2014 The Android Open Source Project
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

jarjar = java_library_host {
    name = "jarjar";
    manifest = "manifest.txt";

    srcs = ["src/main/**/*.java"];
    java_resource_dirs = ["res"];

    static_libs = [
        "asm-6.0"
        "asm-commons-6.0"
    ];

    libs = [
        "jarjar-maven-plugin-api"
        "jarjar-apache-ant"
    ];
};

# #################################################

jarjar-maven-plugin-api = java_import_host {
    name = "jarjar-maven-plugin-api";
    jars = ["lib/maven-plugin-api.jar"];
};

jarjar-apache-ant = java_import_host {
    name = "jarjar-apache-ant";
    jars = ["lib/apache-ant-1.9.4.jar"];
};

in { inherit jarjar jarjar-apache-ant jarjar-maven-plugin-api; }
