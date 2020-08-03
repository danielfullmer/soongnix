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

MagickWand = cc_library_static {
    name = "MagickWand";

    sdk_version = "24";

    srcs = ["*.c"];

    cflags = [
        "-DHAVE_CONFIG_H"
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
    ];

    header_libs = ["Magick_headers"];
};

in { inherit MagickWand; }
