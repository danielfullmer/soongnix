{ apex_test, dex_import, filegroup, genrule, java_library, prebuilt_etc }:
let

#  Copyright (C) 2019 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

"test_com.android.sdkext" = apex_test {
    name = "test_com.android.sdkext";
    visibility = ["//system/apex/tests/sdkextensions"];
    defaults = ["com.android.sdkext-defaults"];
    java_libs = ["test_framework-sdkextensions"];
    manifest = "test_manifest.json";
    prebuilts = ["sdkinfo_45"];
    file_contexts = ":com.android.sdkext-file_contexts";
    installable = false; #  Should never be installed on the systemimage
    multilib = {
        prefer32 = {
            binaries = ["derive_sdk_prefer32"];
        };
    };
    #  The automated test infra ends up building this apex for 64+32-bit and
    #  then installs it on a 32-bit-only device. Work around this weirdness
    #  by preferring 32-bit.
    compile_multilib = "prefer32";
};

sdkinfo_45_src = genrule {
    name = "sdkinfo_45_src";
    out = ["sdkinfo.binarypb"];
    tools = ["gen_sdkinfo"];
    cmd = "$(location) -v 45 -o $(out)";
};

sdkinfo_45 = prebuilt_etc {
    name = "sdkinfo_45";
    src = ":sdkinfo_45_src";
    filename = "sdkinfo.binarypb";
    installable = false;
    visibility = [
        ":__pkg__"
        "//frameworks/av/apex/testing"
    ];
};

test_framework-sdkextensions-sources = filegroup {
    name = "test_framework-sdkextensions-sources";
    srcs = ["impl-src/android/os/ext/test/Test.java"];
    path = "impl-src";
};

test_framework-sdkextensions = dex_import {
    name = "test_framework-sdkextensions";
    jars = ["test_framework-sdkextensions.jar"];
    stem = "framework-sdkextensions";
    apex_available = ["test_com.android.sdkext"];
};

#  It isn't currently possible to build this from source because of limitations
#  in the build + hiddenapi generation.
# java_library {
#     name: "test_framework-sdkextensions",
#     srcs: ["impl-src/**/*.java"],
#     static_libs: ["framework-sdkextensions.impl"],
#     libs: ["framework-annotations-lib"],
#     stem: "framework-sdkextensions",
#     sdk_version: "module_current",
#     installable: true,
#     hostdex: true, // for hiddenapi check
# }

test_framework-sdkextensions-stubs = java_library {
    name = "test_framework-sdkextensions-stubs";
    srcs = ["stub-src/android/os/ext/test/Test.java"];
    sdk_version = "current";
    visibility = ["//system/apex/tests/sdkextensions"];
};

in { inherit "test_com.android.sdkext" sdkinfo_45 sdkinfo_45_src test_framework-sdkextensions test_framework-sdkextensions-sources test_framework-sdkextensions-stubs; }
