{ cc_binary, prebuilt_etc }:
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
#
#

# #################################
evs_app = cc_binary {
    name = "evs_app";

    srcs = [
        "evs_app.cpp"
        "EvsStateControl.cpp"
        "RenderBase.cpp"
        "RenderDirectView.cpp"
        "RenderTopView.cpp"
        "ConfigManager.cpp"
        "glError.cpp"
        "shader.cpp"
        "TexWrapper.cpp"
        "VideoTex.cpp"
        "StreamHandler.cpp"
        "FormatConvert.cpp"
        "RenderPixelCopy.cpp"
    ];

    shared_libs = [
        "libbase"
        "libbinder"
        "libcutils"
        "libutils"
        "libui"
        "libhidlbase"
        "libEGL"
        "libGLESv2"
        "libhardware"
        "libpng"
        "libcamera_metadata"
        "android.hardware.camera.device@3.2"
        "android.hardware.automotive.evs@1.0"
        "android.hardware.automotive.evs@1.1"
        "android.hardware.automotive.vehicle@2.0"
    ];

    static_libs = [
        "libmath"
        "libjsoncpp"
    ];

    required = [
        "config.json"
        "CarFromTop.png"
        "LabeledChecker.png"
    ];

    init_rc = ["evs_app.rc"];

    cflags = ["-DLOG_TAG=\"EvsApp\""] ++ [
        "-DGL_GLEXT_PROTOTYPES"
        "-DEGL_EGLEXT_PROTOTYPES"
    ] ++ [
        "-Wall"
        "-Werror"
        "-Wunused"
        "-Wunreachable-code"
    ];

};

"config.json" = prebuilt_etc {
    name = "config.json";

    src = "config.json";
    sub_dir = "automotive/evs";

};

"CarFromTop.png" = prebuilt_etc {
    name = "CarFromTop.png";

    src = "CarFromTop.png";
    sub_dir = "automotive/evs";

};

"LabeledChecker.png" = prebuilt_etc {
    name = "LabeledChecker.png";

    src = "LabeledChecker.png";
    sub_dir = "automotive/evs";

};

in { inherit "CarFromTop.png" "LabeledChecker.png" "config.json" evs_app; }
