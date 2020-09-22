{ android_app, filegroup }:
let

#
#  Copyright (C) 2010 The Android Open Source Project
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

PacProcessor = android_app {
    name = "PacProcessor";
    srcs = [
        "src/com/android/pacprocessor/LibpacInterface.java"
        "src/com/android/pacprocessor/PacNative.java"
        "src/com/android/pacprocessor/PacService.java"
        "src/com/android/pacprocessor/PacWebView.java"
    ];
    platform_apis = true;
    certificate = "platform";
    jni_libs = ["libjni_pacprocessor"];
};

PacProcessor-aidl-sources = filegroup {
    name = "PacProcessor-aidl-sources";
    srcs = ["src/com/android/net/IProxyService.aidl"];
    path = "src";
};

in { inherit PacProcessor PacProcessor-aidl-sources; }
