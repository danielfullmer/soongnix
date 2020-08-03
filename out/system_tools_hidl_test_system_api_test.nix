{ java_library }:
let

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

#  hidl-generated libs should only depend on @SystemApi
hidl_system_api_test = java_library {
    name = "hidl_system_api_test";
    sdk_version = "system_current";

    static_libs = [
        "android.hidl.base-V1.0-java"
        "android.hidl.manager-V1.0-java"
        "android.hardware.tests.baz-V1.0-java"
    ];
};

in { inherit hidl_system_api_test; }
