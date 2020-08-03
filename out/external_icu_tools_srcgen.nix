{ filegroup, java_binary_host, java_library_host }:
let

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

#  build the android_icu4j srcgen jar
#  ============================================================

android_icu4j_srcgen = java_library_host {
    name = "android_icu4j_srcgen";
    srcs = ["src/**/*.java"];
    static_libs = [
        "currysrc"
        "icu4j"
    ];
};

android_icu4j_srcgen_binary = java_binary_host {
    name = "android_icu4j_srcgen_binary";
    manifest = "src/manifest.txt";
    static_libs = [
        "android_icu4j_srcgen"
        "currysrc"
    ];
};

generate_android_icu4j_script = filegroup {
    name = "generate_android_icu4j_script";
    srcs = ["generate_android_icu4j.sh"];
};

in { inherit android_icu4j_srcgen android_icu4j_srcgen_binary generate_android_icu4j_script; }
