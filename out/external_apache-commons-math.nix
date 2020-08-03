{ java_library, java_library_host }:
let

#
#  Copyright (C) 2011 The Android Open Source Project
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

apache-commons-math = java_library {
    name = "apache-commons-math";
    host_supported = true;
    java_version = "1.7";

    srcs = ["src/main/java/**/*.java"];
    sdk_version = "current";
    errorprone = {
        javacflags = ["-Xep:MissingOverride:OFF"];
    };
};

apache-commons-math-host = java_library_host {
    name = "apache-commons-math-host";
    static_libs = ["apache-commons-math"];
};

in { inherit apache-commons-math apache-commons-math-host; }
