{ android_test }:
let

#
#  Copyright (C) 2014 The Android Open Source Project
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

#  This makefile shows how to build a shared library and an activity that
#  bundles the shared library and calls it using JNI.

#  Build activity

PMTest_Java = android_test {
    name = "PMTest_Java";
    srcs = ["src/com/framework/shareduid/java/MainActivity.java"];
    optimize = {
        enabled = false;
    };
    sdk_version = "current";
};

in { inherit PMTest_Java; }
