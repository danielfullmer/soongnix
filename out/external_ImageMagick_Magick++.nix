{ cc_library_static }:
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

"Magick++" = cc_library_static {
    name = "Magick++";

    srcs = [
        "lib/Blob.cpp"
        "lib/BlobRef.cpp"
        "lib/CoderInfo.cpp"
        "lib/Color.cpp"
        "lib/Drawable.cpp"
        "lib/Exception.cpp"
        "lib/Functions.cpp"
        "lib/Geometry.cpp"
        "lib/Image.cpp"
        "lib/ImageRef.cpp"
        "lib/Montage.cpp"
        "lib/Options.cpp"
        "lib/Pixels.cpp"
        "lib/ResourceLimits.cpp"
        "lib/STL.cpp"
        "lib/SecurityPolicy.cpp"
        "lib/Statistic.cpp"
        "lib/Thread.cpp"
        "lib/TypeMetric.cpp"
    ];

    cflags = [
        "-DHAVE_CONFIG_H"
        "-Wall"
        "-Werror"
        "-Wno-deprecated-register"
        "-Wno-unused-private-field"
    ];
    cppflags = ["-fexceptions"];

    header_libs = ["Magick_headers"];
    export_header_lib_headers = ["Magick_headers"];
    export_include_dirs = ["lib"];
    sdk_version = "24";
    stl = "c++_static";
    visibility = ["//vendor:__subpackages__"];
};

in { inherit "Magick++"; }
