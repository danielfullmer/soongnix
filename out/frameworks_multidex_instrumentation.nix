{ genrule, java_library_static }:
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

android-support-multidex-instrumentation-version = genrule {
    name = "android-support-multidex-instrumentation-version";
    #  use srcs as dependencies, otherwise, this module won't be re-run
    #  during incremental build.
    srcs = [
        "src/com/android/test/runner/MultiDexTestRunner.java"
    ];
    cmd = "echo \"git.version=`cd frameworks/multidex/instrumentation; git log --format=\"%H\" -n 1 || " +
        "(echo git hash not available; exit 0)`\" > $(genDir)/android-support-multidex-instrumentation.version.txt";
    out = [
        "android-support-multidex-instrumentation.version.txt"
    ];
};

android-support-multidex-instrumentation = java_library_static {
    name = "android-support-multidex-instrumentation";
    sdk_version = "4";
    srcs = [
        "src/com/android/test/runner/MultiDexTestRunner.java"
    ];
    java_resources = [
        ":android-support-multidex-instrumentation-version"
    ];
    static_libs = [
        "android-support-multidex"
    ];
    product_variables = {
        unbundled_build = {
            #  Don't build the library in unbundled branches.
            enabled = false;
        };
    };
};

in { inherit android-support-multidex-instrumentation android-support-multidex-instrumentation-version; }
