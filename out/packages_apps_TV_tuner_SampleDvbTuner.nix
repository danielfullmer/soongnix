{ android_app }:
let

#
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
#

SampleDvbTuner = android_app {
    name = "SampleDvbTuner";

    srcs = [
        "src/com/android/tv/tuner/sample/dvb/app/SampleDvbTuner.java"
        "src/com/android/tv/tuner/sample/dvb/app/SampleDvbTunerComponent.java"
        "src/com/android/tv/tuner/sample/dvb/app/SampleDvbTunerModule.java"
        "src/com/android/tv/tuner/sample/dvb/setup/SampleDvbTunerSetupActivity.java"
        "src/com/android/tv/tuner/sample/dvb/singletons/SampleDvbSingletons.java"
        "src/com/android/tv/tuner/sample/dvb/tvinput/SampleDvbTunerTvInputService.java"
        "src/com/android/tv/tuner/sample/dvb/util/SampleDvbConstants.java"
    ];

    sdk_version = "system_current";
    min_sdk_version = "23"; #  M

    resource_dirs = [
        "res"
    ];

    static_libs = [
        "live-tv-tuner"
        "live-tv-tuner-proto"
        "tv-common"
        "tv-lib-dagger"
        "tv-lib-exoplayer"
        "tv-lib-exoplayer-v2-core"
        "tv-lib-exoplayer-v2-ui"
        "tv-lib-dagger-android"
        "live-channels-partner-support"
    ];

    plugins = [
        "tv-lib-dagger-android-processor"
        "tv-lib-dagger-compiler"
    ];

    jni_libs = ["libtunertvinput_jni"];

    aaptflags = [
        # TODO: soongnix
        #"--version-name"
        #version_name

        #"--version-code"
        #version_code

        "--extra-packages"
        "com.android.tv.tuner"

        "--extra-packages"
        "com.android.tv.common"
    ];
};

in { inherit SampleDvbTuner; }
