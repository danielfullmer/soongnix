{ java_library_host }:
let

#  Copyright 2019 The Android Open Source Project
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

tradefed-device-build-interfaces = java_library_host {
    name = "tradefed-device-build-interfaces";
    defaults = ["tradefed_defaults"];
    srcs = [
        "com/android/tradefed/build/BuildInfoKey.java"
        "com/android/tradefed/build/IBuildInfo.java"
        "com/android/tradefed/build/VersionedFile.java"
        "com/android/tradefed/device/AndroidDebugBridgeWrapper.java"
        "com/android/tradefed/device/DeviceDisconnectedException.java"
        "com/android/tradefed/device/DeviceNotAvailableException.java"
        "com/android/tradefed/device/DeviceRuntimeException.java"
        "com/android/tradefed/device/DeviceUnresponsiveException.java"
        "com/android/tradefed/device/IAndroidDebugBridge.java"
        "com/android/tradefed/device/IDeviceRecovery.java"
        "com/android/tradefed/device/IDeviceStateMonitor.java"
        "com/android/tradefed/device/IFileEntry.java"
        "com/android/tradefed/device/IManagedTestDevice.java"
        "com/android/tradefed/device/IManagedTestDeviceFactory.java"
        "com/android/tradefed/device/IMultiDeviceRecovery.java"
        "com/android/tradefed/device/INativeDevice.java"
        "com/android/tradefed/device/ITestDevice.java"
        "com/android/tradefed/device/NullDevice.java"
        "com/android/tradefed/device/PackageInfo.java"
        "com/android/tradefed/device/StubDevice.java"
        "com/android/tradefed/device/StubLocalAndroidVirtualDevice.java"
        "com/android/tradefed/device/TcpDevice.java"
        "com/android/tradefed/device/TestDeviceOptions.java"
        "com/android/tradefed/device/UserInfo.java"
        "com/android/tradefed/device/contentprovider/ContentProviderHandler.java"
        "com/android/tradefed/error/HarnessException.java"
        "com/android/tradefed/error/HarnessRuntimeException.java"
        "com/android/tradefed/error/IHarnessException.java"
        "com/android/tradefed/targetprep/BuildError.java"
        "com/android/tradefed/targetprep/TargetSetupError.java"
        "com/android/tradefed/util/Bugreport.java"
        "com/android/tradefed/util/KeyguardControllerState.java"
        "com/android/tradefed/util/ProcessInfo.java"
    ];
    libs = [
        "ddmlib-prebuilt"
        "error_prone_annotations-2.0.18"
        "guava"
        "tradefed-protos"
        "devtools-annotations-prebuilt"
        "tradefed-common-util"
        "tf-remote-client"
        "tradefed-result-interfaces"
    ];
};

in { inherit tradefed-device-build-interfaces; }
