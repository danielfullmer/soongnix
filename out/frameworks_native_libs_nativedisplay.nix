{ cc_library_headers, cc_library_shared }:
let

#  Copyright 2019 The Android Open Source Project
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

libnativedisplay_headers = cc_library_headers {
    name = "libnativedisplay_headers";
    export_include_dirs = ["include"];
};

libnativedisplay = cc_library_shared {
    name = "libnativedisplay";
    export_include_dirs = [
        "include"
        "include-private"
    ];

    clang = true;

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-enum-compare"
        "-Wno-unused-function"
    ];

    version_script = "libnativedisplay.map.txt";

    srcs = [
        "AChoreographer.cpp"
        "ADisplay.cpp"
        "surfacetexture/surface_texture.cpp"
        "surfacetexture/SurfaceTexture.cpp"
        "surfacetexture/ImageConsumer.cpp"
        "surfacetexture/EGLConsumer.cpp"
    ];

    shared_libs = [
        "libgui"
        "liblog"
        "libnativewindow"
        "libui"
        "libutils"
        "libcutils"
        "libEGL"
        "libGLESv2"
        "libnativehelper"
    ];

    export_shared_lib_headers = [
        "libnativehelper"
    ];

    header_libs = [
        "libnativedisplay_headers"
    ];

};

in { inherit libnativedisplay libnativedisplay_headers; }
