{ aidl_interface, java_library }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

AppOpsUserServiceAidlNative = aidl_interface {
    name = "AppOpsUserServiceAidlNative";
    unstable = true;

    local_include_dir = "src";

    srcs = [
        "src/android/app/appops/cts/IAppOpsUserClient.aidl"
        "src/android/app/appops/cts/IAppOpsUserService.aidl"
    ];

    backend = {
        java = {
            sdk_version = "current";
        };
    };
};

AppOpsUserServiceAidl = java_library {
    name = "AppOpsUserServiceAidl";

    srcs = [
        "src/android/app/appops/cts/IAppOpsUserClient.aidl"
        "src/android/app/appops/cts/IAppOpsUserService.aidl"
    ];
};

in { inherit AppOpsUserServiceAidl AppOpsUserServiceAidlNative; }
