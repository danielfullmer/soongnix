{ android_test }:
let

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

CtsOpenGlPerfTestCases = android_test {
    name = "CtsOpenGlPerfTestCases";
    defaults = ["cts_defaults"];
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
        "libctsopenglperf_jni"
        "libnativehelper_compat_libc++"
    ];
    srcs = [
        "src/android/openglperf/cts/GLSurfaceViewCustom.java"
        "src/android/openglperf/cts/GlAppSwitchTest.java"
        "src/android/openglperf/cts/GlPlanetsActivity.java"
        "src/android/openglperf/cts/GlTextureCoordTest.java"
        "src/android/openglperf/cts/GlVboPerfTest.java"
        "src/android/openglperf/cts/OpenGlPerfNative.java"
        "src/android/openglperf/cts/PlanetsRenderer.java"
        "src/android/openglperf/cts/PlanetsRenderingParam.java"
        "src/android/openglperf/cts/PlanetsSurfaceView.java"
        "src/android/openglperf/cts/RenderCompletionListener.java"
        "src/android/openglperf/cts/Sphere.java"
        "src/android/openglperf/cts/TextureTestActivity.java"
        "src/android/openglperf/cts/TextureTestRenderer.java"
    ];
    instrumentation_for = "com.replica.replicaisland";
    sdk_version = "test_current";
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsOpenGlPerfTestCases; }
