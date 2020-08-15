{ java_library }:
let

#  Copyright 2014 The Android Open Source Project
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

android-ex-camera2-portability = java_library {
    name = "android-ex-camera2-portability";
    sdk_version = "current";
    srcs = [
        "src/com/android/ex/camera2/portability/AndroidCamera2AgentImpl.java"
        "src/com/android/ex/camera2/portability/AndroidCamera2Capabilities.java"
        "src/com/android/ex/camera2/portability/AndroidCamera2Settings.java"
        "src/com/android/ex/camera2/portability/AndroidCameraAgentImpl.java"
        "src/com/android/ex/camera2/portability/AndroidCameraCapabilities.java"
        "src/com/android/ex/camera2/portability/AndroidCameraSettings.java"
        "src/com/android/ex/camera2/portability/CameraActions.java"
        "src/com/android/ex/camera2/portability/CameraAgent.java"
        "src/com/android/ex/camera2/portability/CameraAgentFactory.java"
        "src/com/android/ex/camera2/portability/CameraCapabilities.java"
        "src/com/android/ex/camera2/portability/CameraCapabilitiesFactory.java"
        "src/com/android/ex/camera2/portability/CameraDeviceInfo.java"
        "src/com/android/ex/camera2/portability/CameraExceptionHandler.java"
        "src/com/android/ex/camera2/portability/CameraSettings.java"
        "src/com/android/ex/camera2/portability/CameraStateHolder.java"
        "src/com/android/ex/camera2/portability/DispatchThread.java"
        "src/com/android/ex/camera2/portability/HistoryHandler.java"
        "src/com/android/ex/camera2/portability/Size.java"
        "src/com/android/ex/camera2/portability/debug/Log.java"
        "src/com/android/ex/camera2/portability/debug/LogHelper.java"
        "src/com/android/ex/camera2/portability/util/SystemProperties.java"
    ];
    static_libs = ["android-ex-camera2-utils"];
};

in { inherit android-ex-camera2-portability; }
