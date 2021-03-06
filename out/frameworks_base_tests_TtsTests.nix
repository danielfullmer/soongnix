{ android_test }:
let

#
#  Copyright (C) 2011 The Android Open Source Project
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

TtsTests = android_test {
    name = "TtsTests";
    srcs = [
        "src/com/android/speech/tts/MockableCheckVoiceData.java"
        "src/com/android/speech/tts/MockableTextToSpeechService.java"
        "src/com/android/speech/tts/TextToSpeechTests.java"
        "src/com/android/speech/tts/TtsEnginesTests.java"
    ];
    static_libs = ["mockito-target"];
    libs = [
        "android.test.runner"
        "android.test.base"
    ];
    platform_apis = true;
};

in { inherit TtsTests; }
