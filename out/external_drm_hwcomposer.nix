{ cc_defaults, cc_library_shared, cc_library_static, filegroup }:
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

#  =====================
#  libdrmhwc_utils.a
#  =====================
libdrmhwc_utils = cc_library_static {
    name = "libdrmhwc_utils";

    srcs = ["worker.cpp"];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    vendor = true;

};

#  =====================
#  hwcomposer.drm.so
#  =====================
"hwcomposer.drm_defaults" = cc_defaults {
    name = "hwcomposer.drm_defaults";

    shared_libs = [
        "libcutils"
        "libdrm"
        "libhardware"
        "liblog"
        "libsync"
        "libui"
        "libutils"
    ];

    static_libs = ["libdrmhwc_utils"];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    cppflags = [
        "-DHWC2_USE_CPP11"
        "-DHWC2_INCLUDE_STRINGIFICATION"
    ];

    relative_install_path = "hw";
    vendor = true;
};

drm_hwcomposer = cc_library_static {
    name = "drm_hwcomposer";
    defaults = ["hwcomposer.drm_defaults"];
    srcs = [
        "autolock.cpp"
        "resourcemanager.cpp"
        "drmdevice.cpp"
        "drmconnector.cpp"
        "drmcrtc.cpp"
        "drmdisplaycomposition.cpp"
        "drmdisplaycompositor.cpp"
        "drmencoder.cpp"
        "drmeventlistener.cpp"
        "drmhwctwo.cpp"
        "drmmode.cpp"
        "drmplane.cpp"
        "drmproperty.cpp"
        "hwcutils.cpp"
        "platform.cpp"
        "vsyncworker.cpp"
    ];
};

"hwcomposer.drm" = cc_library_shared {
    name = "hwcomposer.drm";
    defaults = ["hwcomposer.drm_defaults"];
    whole_static_libs = ["drm_hwcomposer"];
    srcs = ["platformdrmgeneric.cpp"];
    cppflags = ["-DUSE_DRM_GENERIC_IMPORTER"];
};

"hwcomposer.drm_minigbm" = cc_library_shared {
    name = "hwcomposer.drm_minigbm";
    defaults = ["hwcomposer.drm_defaults"];
    whole_static_libs = ["drm_hwcomposer"];
    srcs = [
        "platformdrmgeneric.cpp"
        "platformminigbm.cpp"
    ];
    include_dirs = ["external/minigbm/cros_gralloc"];
};

#  Used by hwcomposer.drm_hikey and hwcomposer.drm_hikey960
drm_hwcomposer_platformhisi = filegroup {
    name = "drm_hwcomposer_platformhisi";
    srcs = [
        "platformdrmgeneric.cpp"
        "platformhisi.cpp"
    ];
};

in { inherit "hwcomposer.drm" "hwcomposer.drm_defaults" "hwcomposer.drm_minigbm" drm_hwcomposer drm_hwcomposer_platformhisi libdrmhwc_utils; }
