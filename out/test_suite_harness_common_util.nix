{ java_library_host, java_library_static }:
let

#  Copyright (C) 2018 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

#  Build the common utility library for use device-side
compatibility-common-util-devicesidelib = java_library_static {
    name = "compatibility-common-util-devicesidelib";
    sdk_version = "current";

    srcs = ["src/**/*.java"];

    static_libs = [
        "guava"
        "junit"
    ];
};

#  Build the common utility library for use host-side
compatibility-common-util-hostsidelib = java_library_host {
    name = "compatibility-common-util-hostsidelib";
    defaults = ["cts_error_prone_rules"];

    srcs = ["src/**/*.java"];

    libs = [
        "junit"
        "guava"
        "json-prebuilt"
        "platform-test-annotations"
        "kxml2-2.3.0"
    ];
};

in { inherit compatibility-common-util-devicesidelib compatibility-common-util-hostsidelib; }
