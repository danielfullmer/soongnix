{ java_library }:
let

#  Copyright 2013 The Android Open Source Project
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

ims-common = java_library {
    name = "ims-common";
    installable = true;

    aidl = {
        local_include_dirs = ["src/java"];
    };
    srcs = [
        "src/java/com/android/ims/ImsCall.java"
        "src/java/com/android/ims/ImsConnectionStateListener.java"
        "src/java/com/android/ims/ImsEcbm.java"
        "src/java/com/android/ims/ImsEcbmStateListener.java"
        "src/java/com/android/ims/ImsExternalCallStateListener.java"
        "src/java/com/android/ims/ImsManager.java"
        "src/java/com/android/ims/ImsMultiEndpoint.java"
        "src/java/com/android/ims/ImsServiceBase.java"
        "src/java/com/android/ims/ImsServiceClass.java"
        "src/java/com/android/ims/ImsUt.java"
        "src/java/com/android/ims/MmTelFeatureConnection.java"
        "src/java/com/android/ims/internal/ICall.java"
        "src/java/com/android/ims/internal/ImsStreamMediaSession.java"
        "src/java/com/android/ims/internal/ImsVideoCallProviderWrapper.java"
        "src/java/com/android/ims/internal/VideoPauseTracker.java"
    ];

};

in { inherit ims-common; }
