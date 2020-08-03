{ java_library_host, java_library_static }:
let

#  Copyright (C) 2010 The Android Open Source Project
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

jsr305 = java_library_static {
    name = "jsr305";
    host_supported = true;
    hostdex = true;
    sdk_version = "core_current";
    srcs = ["ri/src/main/java/**/*.java"];
};

#  Compatibility name
jsr305lib = java_library_host {
    name = "jsr305lib";
    static_libs = ["jsr305"];
};

in { inherit jsr305 jsr305lib; }
