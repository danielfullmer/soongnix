{ cc_test }:
let

#
#  Copyright (C) 2014 The Android Open Source Project
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
#  ----------------------------------------------------------------
#  Builds ClearKey Drm Tests
#

ClearKeyDrmUnitTest = cc_test {
    name = "ClearKeyDrmUnitTest";
    vendor = true;

    cflags = [
        "-Wall"
        "-Werror"
    ];

    srcs = [
        "AesCtrDecryptorUnittest.cpp"
        "InitDataParserUnittest.cpp"
        "JsonWebKeyUnittest.cpp"
    ];

    static_libs = ["libclearkeycommon"];

    shared_libs = [
        "libcrypto"
        "libdrmclearkeyplugin"
        "liblog"
        "libstagefright_foundation"
        "libutils"
    ];
    header_libs = ["media_plugin_headers"];
};

in { inherit ClearKeyDrmUnitTest; }
