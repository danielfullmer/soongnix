{ android_app }:
let

#  Copyright (C) 2016 The Android Open Source Project
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
DevCamera = android_app {
    name = "DevCamera";
    sdk_version = "current";
    min_sdk_version = "21";
    srcs = [
        "src/com/android/devcamera/Api2Camera.java"
        "src/com/android/devcamera/BitmapUtility.java"
        "src/com/android/devcamera/CameraDeviceReport.java"
        "src/com/android/devcamera/CameraInfoCache.java"
        "src/com/android/devcamera/CameraInterface.java"
        "src/com/android/devcamera/CameraTimer.java"
        "src/com/android/devcamera/DevCameraActivity.java"
        "src/com/android/devcamera/GyroListener.java"
        "src/com/android/devcamera/GyroOperations.java"
        "src/com/android/devcamera/LoggingCallbacks.java"
        "src/com/android/devcamera/MediaSaver.java"
        "src/com/android/devcamera/NormalizedFace.java"
        "src/com/android/devcamera/PreviewOverlay.java"
    ];
};

in { inherit DevCamera; }
