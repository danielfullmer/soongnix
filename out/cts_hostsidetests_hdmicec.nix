{ java_test_host }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

CtsHdmiCecHostTestCases = java_test_host {
    name = "CtsHdmiCecHostTestCases";
    defaults = ["cts_defaults"];
    srcs = [
        "src/android/hdmicec/cts/CecClientMessage.java"
        "src/android/hdmicec/cts/CecDevice.java"
        "src/android/hdmicec/cts/CecMessage.java"
        "src/android/hdmicec/cts/HdmiCecClientWrapper.java"
        "src/android/hdmicec/cts/HdmiCecConstants.java"
        "src/android/hdmicec/cts/audio/HdmiCecLogicalAddressTest.java"
        "src/android/hdmicec/cts/audio/HdmiCecRemoteControlPassThroughTest.java"
        "src/android/hdmicec/cts/audio/HdmiCecSystemAudioModeTest.java"
        "src/android/hdmicec/cts/playback/HdmiCecDeviceOsdNameTest.java"
        "src/android/hdmicec/cts/playback/HdmiCecLogicalAddressTest.java"
        "src/android/hdmicec/cts/playback/HdmiCecOneTouchPlayTest.java"
        "src/android/hdmicec/cts/playback/HdmiCecPhysicalAddressTest.java"
        "src/android/hdmicec/cts/playback/HdmiCecPowerStatusTest.java"
        "src/android/hdmicec/cts/playback/HdmiCecRemoteControlPassThroughTest.java"
        "src/android/hdmicec/cts/playback/HdmiCecRoutingControlTest.java"
        "src/android/hdmicec/cts/playback/HdmiCecSystemAudioControlTest.java"
        "src/android/hdmicec/cts/playback/HdmiCecSystemInformationTest.java"
        "src/android/hdmicec/cts/playback/HdmiCecSystemStandbyTest.java"
        "src/android/hdmicec/cts/playback/HdmiCecVendorCommandsTest.java"
    ];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    libs = [
        "cts-tradefed"
        "tradefed"
        "compatibility-host-util"
    ];
    data = [
        ":HdmiCecKeyEventCaptureApp"
    ];
};

in { inherit CtsHdmiCecHostTestCases; }
