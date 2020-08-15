{ android_app }:
let

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
#  Mms service
#
MmsService = android_app {
    name = "MmsService";
    platform_apis = true;
    privileged = true;
    libs = ["telephony-common"];
    srcs = [
        "src/com/android/mms/service/ApnSettings.java"
        "src/com/android/mms/service/DownloadRequest.java"
        "src/com/android/mms/service/LogUtil.java"
        "src/com/android/mms/service/MmsConfigManager.java"
        "src/com/android/mms/service/MmsHttpClient.java"
        "src/com/android/mms/service/MmsNetworkManager.java"
        "src/com/android/mms/service/MmsRequest.java"
        "src/com/android/mms/service/MmsService.java"
        "src/com/android/mms/service/PhoneUtils.java"
        "src/com/android/mms/service/SendRequest.java"
        "src/com/android/mms/service/exception/ApnException.java"
        "src/com/android/mms/service/exception/MmsHttpException.java"
        "src/com/android/mms/service/exception/MmsNetworkException.java"
    ];
    resource_dirs = ["res"];
    aaptflags = ["--auto-add-overlay"];
    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
    certificate = "platform";
};

in { inherit MmsService; }
