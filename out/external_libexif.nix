{ cc_library_shared }:
let

#
#  Copyright (C) 2013 The Android Open Source Project
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

#  WARNING: this makefile builds a shared library. Do not ever make it build
#  a static library or otherwise statically link libexif with your code.
libexif = cc_library_shared {
    name = "libexif";
    vendor_available = true;
    vndk = {
        enabled = true;
    };

    srcs = [
        "libexif/exif-byte-order.c"
        "libexif/exif-content.c"
        "libexif/exif-data.c"
        "libexif/exif-entry.c"
        "libexif/exif-format.c"
        "libexif/exif-ifd.c"
        "libexif/exif-loader.c"
        "libexif/exif-log.c"
        "libexif/exif-mem.c"
        "libexif/exif-mnote-data.c"
        "libexif/exif-tag.c"
        "libexif/exif-utils.c"
        "libexif/canon/exif-mnote-data-canon.c"
        "libexif/canon/mnote-canon-entry.c"
        "libexif/canon/mnote-canon-tag.c"
        "libexif/olympus/exif-mnote-data-olympus.c"
        "libexif/olympus/mnote-olympus-tag.c"
        "libexif/olympus/mnote-olympus-entry.c"
        "libexif/fuji/exif-mnote-data-fuji.c"
        "libexif/fuji/mnote-fuji-entry.c"
        "libexif/fuji/mnote-fuji-tag.c"
        "libexif/pentax/exif-mnote-data-pentax.c"
        "libexif/pentax/mnote-pentax-entry.c"
        "libexif/pentax/mnote-pentax-tag.c"
    ];

    export_include_dirs = ["."];

    cflags = [
        "-ftrapv"

        #  TODO(b/27347470): Disable the following warnings.
        "-Wno-conversion"
        "-Wno-unused-parameter"
        "-Wno-missing-field-initializers"
        "-Wno-switch"
        "-Wno-absolute-value"
        "-Werror"
    ];

    sanitize = {
        integer_overflow = true;
        blacklist = "libexif_blacklist.txt";
    };
};

#  WARNING: this makefile builds a shared library. Do not ever make it build
#  a static library or otherwise statically link libexif with your code.

in { inherit libexif; }
