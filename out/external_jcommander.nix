{ java_library_static }:
let

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

#
#  Build support for jcommander within the Android Open Source Project
#  See https://source.android.com/source/building.html for more information
#

jcommander = java_library_static {
    name = "jcommander";
    host_supported = true;
    hostdex = true;
    sdk_version = "core_current";

    srcs = ["src/main/**/*.java"];
    target = {
        android = {
            #  Filter out PathConverter since android is missing java.nio.file APIs.
            exclude_srcs = ["src/main/**/PathConverter.java"];
        };
    };

    errorprone = {
        javacflags = [
            "-Xep:CollectionIncompatibleType:WARN" #  b/74215153
        ];
    };
};

in { inherit jcommander; }
