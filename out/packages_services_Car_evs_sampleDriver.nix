{ cc_binary, cc_library, prebuilt_etc }:
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
"android.hardware.automotive.evs@1.1-sample" = cc_binary {
    name = "android.hardware.automotive.evs@1.1-sample";

    vendor = true;

    srcs = [
        "service.cpp"
        "EvsEnumerator.cpp"
        "EvsV4lCamera.cpp"
        "EvsGlDisplay.cpp"
        "GlWrapper.cpp"
        "VideoCapture.cpp"
        "bufferCopy.cpp"
        "ConfigManager.cpp"
        "ConfigManagerUtil.cpp"
    ];

    shared_libs = [
        "android.hardware.automotive.evs@1.0"
        "android.hardware.automotive.evs@1.1"
        "android.hardware.camera.device@3.2"
        "libui"
        "libEGL"
        "libGLESv2"
        "libbase"
        "libbinder"
        "libcutils"
        "libhardware"
        "libhidlbase"
        "libutils"
        "libhardware_legacy"
        "libcamera_metadata"
        "libtinyxml2"
        "libbufferqueueconverter"
        "android.hidl.token@1.0-utils"
        "android.frameworks.automotive.display@1.0"
        "android.hardware.graphics.bufferqueue@1.0"
        "android.hardware.graphics.bufferqueue@2.0"
    ];

    init_rc = ["android.hardware.automotive.evs@1.1-sample.rc"];

    cflags = ["-DLOG_TAG=\"EvsSampleDriver\""] ++ [
        "-DGL_GLEXT_PROTOTYPES"
        "-DEGL_EGLEXT_PROTOTYPES"
    ] ++ [
        "-Wall"
        "-Werror"
        "-Wunused"
        "-Wunreachable-code"
    ];

    required = [
        "evs_configuration.dtd"
        "evs_sample_configuration.xml"
    ];

    include_dirs = [
        "frameworks/native/include/"
    ];

    product_variables = {
        debuggable = {
            cflags = [
                "-DEVS_DEBUG"
            ];
        };
    };

    vintf_fragments = [
        "manifest_android.hardware.automotive.evs@1.1.xml"
    ];
};

libevsconfigmanager = cc_library {
    name = "libevsconfigmanager";
    vendor = true;
    srcs = [
        "ConfigManager.cpp"
        "ConfigManagerUtil.cpp"
    ];
    shared_libs = [
        "android.hardware.automotive.evs@1.0"
        "android.hardware.automotive.evs@1.1"
        "android.hardware.camera.device@3.2"
        "libbase"
        "libcamera_metadata"
        "libcutils"
        "libhardware"
        "libtinyxml2"
        "libutils"
    ];
};

"evs_configuration.dtd" = prebuilt_etc {
    name = "evs_configuration.dtd";
    soc_specific = true;
    src = "resources/evs_configuration.dtd";
    sub_dir = "automotive/evs";
};

"evs_sample_configuration.xml" = prebuilt_etc {
    name = "evs_sample_configuration.xml";
    soc_specific = true;
    src = "resources/evs_sample_configuration.xml";
    sub_dir = "automotive/evs";
};

in { inherit "android.hardware.automotive.evs@1.1-sample" "evs_configuration.dtd" "evs_sample_configuration.xml" libevsconfigmanager; }
