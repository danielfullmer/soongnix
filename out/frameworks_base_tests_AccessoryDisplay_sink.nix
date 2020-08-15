{ android_test }:
let

#  Copyright (C) 2013 The Android Open Source Project
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

#  Build the application.
AccessoryDisplaySink = android_test {
    name = "AccessoryDisplaySink";
    sdk_version = "current";
    srcs = [
        "src/com/android/accessorydisplay/sink/DisplaySinkService.java"
        "src/com/android/accessorydisplay/sink/SinkActivity.java"
        "src/com/android/accessorydisplay/sink/UsbAccessoryBulkTransport.java"
        "src/com/android/accessorydisplay/sink/UsbAccessoryConstants.java"
        "src/com/android/accessorydisplay/sink/UsbHid.java"
    ];
    resource_dirs = ["res"];
    static_libs = ["AccessoryDisplayCommon"];
};

in { inherit AccessoryDisplaySink; }
