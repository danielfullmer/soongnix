{ java_binary_host, java_library_host }:
let

#
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
#

#  apksig library, for signing APKs and verifying signatures of APKs
#  ============================================================
apksig = java_library_host {
    name = "apksig";
    srcs = ["src/main/java/**/*.java"];
};

#  apksigner command-line tool for signing APKs and verifying their signatures
#  ============================================================
apksigner = java_binary_host {
    name = "apksigner";
    srcs = ["src/apksigner/java/**/*.java"];
    java_resource_dirs = ["src/apksigner/java"];
    wrapper = "etc/apksigner";
    manifest = "src/apksigner/apksigner.mf";
    static_libs = ["apksig"];
};

in { inherit apksig apksigner; }
