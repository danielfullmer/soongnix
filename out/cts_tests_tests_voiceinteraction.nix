{ android_test }:
let

#  Copyright (C) 2015 The Android Open Source Project
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

CtsVoiceInteractionTestCases = android_test {
    name = "CtsVoiceInteractionTestCases";
    defaults = ["cts_defaults"];
    static_libs = [
        "CtsVoiceInteractionCommon"
        "ctstestrunner-axt"
        "compatibility-device-util-axt"
        "androidx.test.ext.junit"
    ];
    srcs = [
        "src/android/voiceinteraction/cts/AbstractVoiceInteractionTestCase.java"
        "src/android/voiceinteraction/cts/DirectActionsTest.java"
        "src/android/voiceinteraction/cts/LocalVoiceInteractionTest.java"
        "src/android/voiceinteraction/cts/TestLocalInteractionActivity.java"
        "src/android/voiceinteraction/cts/TestStartActivity.java"
        "src/android/voiceinteraction/cts/VoiceInteractionTest.java"
        "src/android/voiceinteraction/cts/VoiceInteractionTestReceiver.java"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
};

in { inherit CtsVoiceInteractionTestCases; }
