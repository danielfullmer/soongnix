{ android_test }:
let

#  Copyright (C) 2008 The Android Open Source Project
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

CtsSpeechTestCases = android_test {
    name = "CtsSpeechTestCases";
    defaults = ["cts_defaults"];
    static_libs = [
        "ctstestrunner-axt"
        "androidx.test.rules"
    ];
    libs = ["android.test.base.stubs"];
    srcs = [
        "src/android/speech/tts/cts/StubTextToSpeechService.java"
        "src/android/speech/tts/cts/TextToSpeechServiceTest.java"
        "src/android/speech/tts/cts/TextToSpeechWrapper.java"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    #  Needed for testing O API
    # sdk_version: "test_current",
    platform_apis = true;
};

in { inherit CtsSpeechTestCases; }