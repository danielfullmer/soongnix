{ cc_library_shared, filegroup }:
let

#  Copyright 2010 The Android Open Source Project
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

libcamera_client = cc_library_shared {
    name = "libcamera_client";

    aidl = {
        export_aidl_headers = true;
        local_include_dirs = ["aidl"];
        include_dirs = [
            "frameworks/native/aidl/gui"
        ];
    };

    srcs = [
        #  AIDL files for camera interfaces
        #  The headers for these interfaces will be available to any modules that
        #  include libcamera_client, at the path "aidl/package/path/BnFoo.h"
        ":libcamera_client_aidl"

        #  Source for camera interface parcelables, and manually-written interfaces
        "Camera.cpp"
        "CameraMetadata.cpp"
        "CameraParameters.cpp"
        "CaptureResult.cpp"
        "CameraParameters2.cpp"
        "ICamera.cpp"
        "ICameraClient.cpp"
        "ICameraRecordingProxy.cpp"
        "ICameraRecordingProxyListener.cpp"
        "camera2/CaptureRequest.cpp"
        "camera2/ConcurrentCamera.cpp"
        "camera2/OutputConfiguration.cpp"
        "camera2/SessionConfiguration.cpp"
        "camera2/SubmitInfo.cpp"
        "CameraBase.cpp"
        "CameraUtils.cpp"
        "VendorTagDescriptor.cpp"
    ];

    shared_libs = [
        "libcutils"
        "libutils"
        "liblog"
        "libbinder"
        "libgui"
        "libcamera_metadata"
        "libnativewindow"
    ];

    include_dirs = [
        "system/media/private/camera/include"
        "frameworks/native/include/media/openmax"
    ];
    export_include_dirs = [
        "include"
        "include/camera"
    ];
    export_shared_lib_headers = [
        "libcamera_metadata"
        "libnativewindow"
        "libgui"
    ];

    cflags = [
        "-Werror"
        "-Wall"
        "-Wextra"
    ];

};

#  AIDL interface between camera clients and the camera service.
libcamera_client_aidl = filegroup {
    name = "libcamera_client_aidl";
    srcs = [
        "aidl/android/hardware/ICameraService.aidl"
        "aidl/android/hardware/ICameraServiceListener.aidl"
        "aidl/android/hardware/ICameraServiceProxy.aidl"
        "aidl/android/hardware/camera2/ICameraDeviceCallbacks.aidl"
        "aidl/android/hardware/camera2/ICameraDeviceUser.aidl"
        "aidl/android/hardware/camera2/ICameraOfflineSession.aidl"
    ];
    path = "aidl";
};

#  Extra AIDL files that are used by framework.jar but not libcamera_client
#  because they have hand-written native implementations.
libcamera_client_framework_aidl = filegroup {
    name = "libcamera_client_framework_aidl";
    srcs = [
        "aidl/android/hardware/ICamera.aidl"
        "aidl/android/hardware/ICameraClient.aidl"
    ];
    path = "aidl";
};

in { inherit libcamera_client libcamera_client_aidl libcamera_client_framework_aidl; }
