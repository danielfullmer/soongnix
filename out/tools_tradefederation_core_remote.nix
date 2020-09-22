{ java_library_host }:
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

tf-remote-client = java_library_host {
    name = "tf-remote-client";
    defaults = ["tradefed_defaults"];

    srcs = [
        "src/com/android/tradefed/command/remote/AddCommandFileOp.java"
        "src/com/android/tradefed/command/remote/AddCommandOp.java"
        "src/com/android/tradefed/command/remote/AllocateDeviceOp.java"
        "src/com/android/tradefed/command/remote/CloseOp.java"
        "src/com/android/tradefed/command/remote/CommandResult.java"
        "src/com/android/tradefed/command/remote/DeviceDescriptor.java"
        "src/com/android/tradefed/command/remote/ExecCommandOp.java"
        "src/com/android/tradefed/command/remote/FreeDeviceOp.java"
        "src/com/android/tradefed/command/remote/GetLastCommandResultOp.java"
        "src/com/android/tradefed/command/remote/HandoverCompleteOp.java"
        "src/com/android/tradefed/command/remote/HandoverInitCompleteOp.java"
        "src/com/android/tradefed/command/remote/ICommandResultHandler.java"
        "src/com/android/tradefed/command/remote/IRemoteClient.java"
        "src/com/android/tradefed/command/remote/ListDevicesOp.java"
        "src/com/android/tradefed/command/remote/RemoteClient.java"
        "src/com/android/tradefed/command/remote/RemoteException.java"
        "src/com/android/tradefed/command/remote/RemoteOperation.java"
        "src/com/android/tradefed/command/remote/StartHandoverOp.java"
        "src/com/android/tradefed/device/DeviceAllocationEventHandler.java"
        "src/com/android/tradefed/device/DeviceAllocationState.java"
        "src/com/android/tradefed/device/DeviceEvent.java"
        "src/com/android/tradefed/device/FreeDeviceState.java"
        "src/com/android/tradefed/device/TestDeviceState.java"
    ];

    static_libs = [
        "json-prebuilt"
        "jsr305"
        "tools-common-prebuilt"
        "sdklib-prebuilt"
        "guava"
        "ddmlib-prebuilt"
        "devtools-annotations-prebuilt"
    ];
};

in { inherit tf-remote-client; }
