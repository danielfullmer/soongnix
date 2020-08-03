{ java_library_host, java_library_static }:
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

objenesis = java_library_static {
    name = "objenesis";
    host_supported = true;
    hostdex = true;
    srcs = ["main/src/main/java/**/*.java"];
    sdk_version = "core_current";
};

#  Compatibility library for old name of host target
objenesis-host = java_library_host {
    name = "objenesis-host";
    static_libs = ["objenesis"];
};

# --------------------------------
#  Builds the Objenesis TCK as a device-targeted library

objenesis-tck = java_library_static {
    name = "objenesis-tck";
    no_framework_libs = true;
    sdk_version = "current";

    static_libs = ["objenesis"];
    srcs = ["tck/src/main/java/**/*.java"];
    java_resource_dirs = ["tck/src/main/resources"];
};

in { inherit objenesis objenesis-host objenesis-tck; }
