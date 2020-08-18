{ bootstrap_go_package }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

vintf-compatibility-matrix-soong-rules = bootstrap_go_package {
    name = "vintf-compatibility-matrix-soong-rules";
    pkgPath = "android/soong/vintf-compatibility-matrix";
    deps = [
        "blueprint"
        "blueprint-proptools"
        "kernel-config-soong-rules"
        "soong"
        "soong-android"
    ];
    srcs = [
        "vintf_compatibility_matrix.go"
    ];
    pluginFor = ["soong_build"];
};

in { inherit vintf-compatibility-matrix-soong-rules; }
