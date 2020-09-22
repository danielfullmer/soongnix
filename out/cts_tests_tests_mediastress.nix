{ android_test }:
let

#  Copyright (C) 2012 The Android Open Source Project
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

CtsMediaStressTestCases = android_test {
    name = "CtsMediaStressTestCases";
    defaults = ["cts_defaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
        "mts"
    ];
    #  Include both the 32 and 64 bit versions
    compile_multilib = "both";
    static_libs = [
        "ctstestrunner-axt"
        "compatibility-device-util-axt"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    jni_libs = [
        "libctsmediastress_jni"
        "libnativehelper_compat_libc++"
    ];
    srcs = [
        "src/android/mediastress/cts/CodecTest.java"
        "src/android/mediastress/cts/H263QcifLongPlayerTest.java"
        "src/android/mediastress/cts/H263QcifShortPlayerTest.java"
        "src/android/mediastress/cts/H264R1080pAacLongPlayerTest.java"
        "src/android/mediastress/cts/H264R1080pAacRepeatedPlayerTest.java"
        "src/android/mediastress/cts/H264R1080pAacShortPlayerTest.java"
        "src/android/mediastress/cts/H264R480pAacLongPlayerTest.java"
        "src/android/mediastress/cts/H264R480pAacShortPlayerTest.java"
        "src/android/mediastress/cts/H264R480x360AacShortPlayerTest.java"
        "src/android/mediastress/cts/H264R720pAacLongPlayerTest.java"
        "src/android/mediastress/cts/H264R720pAacShortPlayerTest.java"
        "src/android/mediastress/cts/HEVCR1080pAacLongPlayerTest.java"
        "src/android/mediastress/cts/HEVCR1080pAacRepeatedPlayerTest.java"
        "src/android/mediastress/cts/HEVCR1080pAacShortPlayerTest.java"
        "src/android/mediastress/cts/HEVCR480pAacLongPlayerTest.java"
        "src/android/mediastress/cts/HEVCR480pAacShortPlayerTest.java"
        "src/android/mediastress/cts/HEVCR480x360AacShortPlayerTest.java"
        "src/android/mediastress/cts/HEVCR720pAacLongPlayerTest.java"
        "src/android/mediastress/cts/HEVCR720pAacShortPlayerTest.java"
        "src/android/mediastress/cts/MediaFrameworkTest.java"
        "src/android/mediastress/cts/MediaPlayerStressTest.java"
        "src/android/mediastress/cts/MediaRecorderStressTest.java"
        "src/android/mediastress/cts/NativeMediaActivity.java"
        "src/android/mediastress/cts/NativeMediaTest.java"
        "src/android/mediastress/cts/NonMediaMainlineTest.java"
        "src/android/mediastress/cts/OnSurfaceChangedListener.java"
        "src/android/mediastress/cts/SurfaceTextureGLSurfaceView.java"
        "src/android/mediastress/cts/SurfaceTextureRenderer.java"
        "src/android/mediastress/cts/Vp8R480x360LongPlayerTest.java"
        "src/android/mediastress/cts/Vp8R480x360ShortPlayerTest.java"
        "src/android/mediastress/cts/WorkDir.java"
    ];
    host_required = ["cts-dynamic-config"];
    sdk_version = "test_current";
    min_sdk_version = "29";
    required = ["CtsMediaPreparerApp"];
};

in { inherit CtsMediaStressTestCases; }
