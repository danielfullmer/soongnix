{ android_test, filegroup, java_test_helper_library }:
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

cts-opengl-util = java_test_helper_library {
    name = "cts-opengl-util";

    srcs = [
        ":cts-opengl-app-util"
    ];

    sdk_version = "test_current";
};

cts-opengl-app-util = filegroup {
    name = "cts-opengl-app-util";
    srcs = [
        "src/android/opengl/cts/Egl14Utils.java"
    ];
};

CtsOpenGLTestCases = android_test {
    name = "CtsOpenGLTestCases";
    defaults = ["cts_defaults"];
    compile_multilib = "both";
    jni_libs = ["libopengltest_jni"];
    static_libs = [
        "ctstestrunner-axt"
        "compatibility-device-util-axt"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    srcs = [
        "src/android/opengl/cts/AttachShaderTest.java"
        "src/android/opengl/cts/ByteBufferTest.java"
        "src/android/opengl/cts/ColorBufferTest.java"
        "src/android/opengl/cts/CompressedTextureCtsActivity.java"
        "src/android/opengl/cts/CompressedTextureLoader.java"
        "src/android/opengl/cts/CompressedTextureSurfaceView.java"
        "src/android/opengl/cts/CompressedTextureTest.java"
        "src/android/opengl/cts/Constants.java"
        "src/android/opengl/cts/Egl10Utils.java"
        "src/android/opengl/cts/Egl14Utils.java"
        "src/android/opengl/cts/EglConfigCtsActivity.java"
        "src/android/opengl/cts/EglConfigGLSurfaceView.java"
        "src/android/opengl/cts/EglConfigTest.java"
        "src/android/opengl/cts/EglContextTest.java"
        "src/android/opengl/cts/EglSurfacesTest.java"
        "src/android/opengl/cts/FramebufferTest.java"
        "src/android/opengl/cts/GL2JniLibOne.java"
        "src/android/opengl/cts/GLSurfaceViewCtsActivity.java"
        "src/android/opengl/cts/GLSurfaceViewTest.java"
        "src/android/opengl/cts/GlTestBase.java"
        "src/android/opengl/cts/NativeAttachShaderTest.java"
        "src/android/opengl/cts/NativeColorBufferTest.java"
        "src/android/opengl/cts/NativeRendererOneColorBufferTest.java"
        "src/android/opengl/cts/OpenGLES20ActivityOne.java"
        "src/android/opengl/cts/OpenGLES20ActivityTwo.java"
        "src/android/opengl/cts/OpenGLES20NativeActivityOne.java"
        "src/android/opengl/cts/OpenGLES20NativeActivityTwo.java"
        "src/android/opengl/cts/OpenGlEsVersionCtsActivity.java"
        "src/android/opengl/cts/OpenGlEsVersionTest.java"
        "src/android/opengl/cts/ParamsTest.java"
        "src/android/opengl/cts/ProgramTest.java"
        "src/android/opengl/cts/RendererBase.java"
        "src/android/opengl/cts/RendererEightShaderTest.java"
        "src/android/opengl/cts/RendererElevenShaderTest.java"
        "src/android/opengl/cts/RendererFiveShaderTest.java"
        "src/android/opengl/cts/RendererFourShaderTest.java"
        "src/android/opengl/cts/RendererNineShaderTest.java"
        "src/android/opengl/cts/RendererOneColorBufferTest.java"
        "src/android/opengl/cts/RendererOneProgramTest.java"
        "src/android/opengl/cts/RendererOneShaderTest.java"
        "src/android/opengl/cts/RendererSevenShaderTest.java"
        "src/android/opengl/cts/RendererSixShaderTest.java"
        "src/android/opengl/cts/RendererTenShaderTest.java"
        "src/android/opengl/cts/RendererThreeShaderTest.java"
        "src/android/opengl/cts/RendererTwelveShaderTest.java"
        "src/android/opengl/cts/RendererTwoShaderTest.java"
        "src/android/opengl/cts/Shaders.java"
        "src/android/opengl/cts/Vertex.java"
        "src/android/opengl/cts/WrapperTest.java"
    ];
    #  Using EGL_RECORDABLE_ANDROID requires latest
    sdk_version = "test_current";
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsOpenGLTestCases cts-opengl-app-util cts-opengl-util; }
