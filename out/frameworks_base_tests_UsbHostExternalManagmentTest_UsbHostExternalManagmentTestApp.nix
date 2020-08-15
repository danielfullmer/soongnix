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
#
#

# #################################################

#  TODO: should this be android_helper_test_app?
UsbHostExternalManagementTestApp = android_app {
    name = "UsbHostExternalManagementTestApp";
    srcs = [
        "src/com/android/hardware/usb/externalmanagementtest/AoapInterface.java"
        "src/com/android/hardware/usb/externalmanagementtest/UsbDeviceStateController.java"
        "src/com/android/hardware/usb/externalmanagementtest/UsbHostManagementActivity.java"
        "src/com/android/hardware/usb/externalmanagementtest/UsbUtil.java"
    ];
    resource_dirs = ["res"];
    platform_apis = true;
    privileged = true;
    #  TODO remove tests tag
    # LOCAL_MODULE_TAGS := tests
    # LOCAL_MODULE_PATH := $(TARGET_OUT_DATA_APPS)
    optimize = {
        enabled = false;
    };
};

in { inherit UsbHostExternalManagementTestApp; }
