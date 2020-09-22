{ android_test, java_defaults }:
let

#  Copyright (C) 2017 The Android Open Source Project
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

hello_world_defaults = java_defaults {
    name = "hello_world_defaults";
    defaults = ["cts_defaults"];
    sdk_version = "current";
    min_sdk_version = "24";
    static_libs = [
        "androidx.appcompat_appcompat"
        "androidx-constraintlayout_constraintlayout"
        "com.google.android.material_material"
    ];
    package_splits = [
        "mdpi-v4"
        "hdpi-v4"
        "xhdpi-v4"
        "xxhdpi-v4"
        "xxxhdpi-v4"
    ];
};

# -----------------------------------------------------------
HelloWorld5 = android_test {
    name = "HelloWorld5";
    defaults = ["hello_world_defaults"];
    srcs = ["src5/com/example/helloworld/MainActivity.java"];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    v4_signature = true;
};

# -----------------------------------------------------------
HelloWorld7 = android_test {
    name = "HelloWorld7";
    defaults = ["hello_world_defaults"];
    srcs = ["src7/com/example/helloworld/MainActivity.java"];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    v4_signature = true;
};

in { inherit HelloWorld5 HelloWorld7 hello_world_defaults; }
