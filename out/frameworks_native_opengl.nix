{ cc_library_headers, llndk_library, ndk_headers }:
let

#  Copyright (C) 2016 The Android Open Source Project
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

libEGL_headers = ndk_headers {
    name = "libEGL_headers";
    from = "include";
    to = "";
    srcs = ["include/EGL/**/*.h"];
    license = "include/EGL/NOTICE";
};

libGLESv1_CM_headers = ndk_headers {
    name = "libGLESv1_CM_headers";
    from = "include";
    to = "";
    srcs = ["include/GLES/**/*.h"];
    license = "include/GLES/NOTICE";
};

libGLESv2_headers = ndk_headers {
    name = "libGLESv2_headers";
    from = "include";
    to = "";
    srcs = ["include/GLES2/**/*.h"];
    license = "include/GLES2/NOTICE";
};

libGLESv3_headers = ndk_headers {
    name = "libGLESv3_headers";
    from = "include";
    to = "";
    srcs = ["include/GLES3/**/*.h"];
    license = "include/GLES3/NOTICE";
};

khr_headers = ndk_headers {
    name = "khr_headers";
    from = "include";
    to = "";
    srcs = ["include/KHR/**/*.h"];
    license = "include/KHR/NOTICE";
};

libEGL = llndk_library {
    name = "libEGL";
    symbol_file = "libs/libEGL.map.txt";
    export_include_dirs = ["include"];
};

libGLESv1_CM = llndk_library {
    name = "libGLESv1_CM";
    symbol_file = "libs/libGLESv1_CM.map.txt";
    export_include_dirs = ["include"];
};

libGLESv2 = llndk_library {
    name = "libGLESv2";
    symbol_file = "libs/libGLESv2.map.txt";
    export_include_dirs = ["include"];
};

libGLESv3 = llndk_library {
    name = "libGLESv3";
    symbol_file = "libs/libGLESv3.map.txt";
    export_include_dirs = ["include"];
};

gl_headers = cc_library_headers {
    name = "gl_headers";
    vendor_available = true;
    export_include_dirs = ["include"];
};

subdirs = [
    "*"
];

in { inherit gl_headers khr_headers libEGL libEGL_headers libGLESv1_CM libGLESv1_CM_headers libGLESv2 libGLESv2_headers libGLESv3 libGLESv3_headers; }
