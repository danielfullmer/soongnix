{ cc_test_library }:
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

#
#  This is the shared library included by the JNI test app.
#

libopengltest_jni = cc_test_library {
    name = "libopengltest_jni";
    srcs = [
        "common.cpp"
        "gl2_jni_libone.cpp"
        "attach_shader_one.cpp"
        "attach_shader_two.cpp"
        "attach_shader_three.cpp"
        "attach_shader_four.cpp"
        "attach_shader_five.cpp"
        "attach_shader_six.cpp"
        "attach_shader_seven.cpp"
        "attach_shader_eight.cpp"
        "attach_shader_nine.cpp"
        "attach_shader_ten.cpp"
        "attach_shader_eleven.cpp"
        "color_one.cpp"
    ];
    sdk_version = "current";
    stl = "none";
    shared_libs = [
        "libGLESv2"
        "liblog"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
        "-Wno-sign-compare"
        "-Wno-unused-function"
        "-Wno-unused-variable"
    ];
};

in { inherit libopengltest_jni; }
