{ java_library_host, java_library_static }:
let

#
#  Copyright (C) 2018 The Android Open Source Project
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

apkzlib_zip = java_library_static {
    name = "apkzlib_zip";
    sdk_version = "24";
    srcs = [
        "src/main/java/com/android/tools/build/apkzlib/utils/**/*.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/**/*.java"
    ];
    static_libs = ["guava"];
};

apkzlib = java_library_host {
    name = "apkzlib";
    srcs = [
        "src/main/java/com/android/tools/build/apkzlib/**/*.java"
    ];
    static_libs = [
        "guava"
        "apksig"
    ];
};

in { inherit apkzlib apkzlib_zip; }
