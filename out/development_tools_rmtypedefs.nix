{ java_binary_host }:
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

rmtypedefs = java_binary_host {
    name = "rmtypedefs";
    srcs = ["src/com/android/tools/rmtypedefs/RmTypeDefs.java"];
    manifest = "etc/manifest.txt";
    wrapper = "etc/rmtypedefs";
    static_libs = [
        "asm-5.2"
        "guava-21.0"
    ];
};

in { inherit rmtypedefs; }
