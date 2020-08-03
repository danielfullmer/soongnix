{ android_test, genrule }:
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

generate_compiled_layout1 = genrule {
    name = "generate_compiled_layout1";
    tools = [":viewcompiler"];
    cmd = "$(location :viewcompiler) $(in) --dex --out $(out) --package android.startop.test";
    srcs = ["res/layout/layout1.xml"];
    out = [
        "layout1.dex"
    ];
};

generate_compiled_layout2 = genrule {
    name = "generate_compiled_layout2";
    tools = [":viewcompiler"];
    cmd = "$(location :viewcompiler) $(in) --dex --out $(out) --package android.startop.test";
    srcs = ["res/layout/layout2.xml"];
    out = [
        "layout2.dex"
    ];
};

dex-builder-test = android_test {
    name = "dex-builder-test";
    srcs = [
        "src/android/startop/test/DexBuilderTest.java"
        "src/android/startop/test/LayoutCompilerTest.java"
    ];
    sdk_version = "current";
    data = [
        ":generate_dex_testcases"
        ":generate_compiled_layout1"
        ":generate_compiled_layout2"
    ];
    static_libs = [
        "androidx.test.rules"
        "guava"
    ];
    manifest = "AndroidManifest.xml";
    resource_dirs = ["res"];
    test_config = "AndroidTest.xml";
    test_suites = ["general-tests"];
};

in { inherit dex-builder-test generate_compiled_layout1 generate_compiled_layout2; }
