{ cc_test }:
let

/*
 * Copyright (C) 2019 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

ExtractorUnitTest = cc_test {
    name = "ExtractorUnitTest";
    gtest = true;

    srcs = ["ExtractorUnitTest.cpp"];

    static_libs = [
        "libaacextractor"
        "libamrextractor"
        "libmp3extractor"
        "libwavextractor"
        "liboggextractor"
        "libflacextractor"
        "libmidiextractor"
        "libmkvextractor"
        "libmpeg2extractor"
        "libmp4extractor"
        "libaudioutils"
        "libdatasource"
        "libwatchdog"

        "libstagefright"
        "libstagefright_id3"
        "libstagefright_flacdec"
        "libstagefright_esds"
        "libstagefright_mpeg2support"
        "libstagefright_mpeg2extractor"
        "libstagefright_foundation"
        "libstagefright_metadatautils"

        "libmedia_midiiowrapper"
        "libsonivoxwithoutjet"
        "libvorbisidec"
        "libwebm"
        "libFLAC"
    ];

    shared_libs = [
        "android.hardware.cas@1.0"
        "android.hardware.cas.native@1.0"
        "android.hidl.token@1.0-utils"
        "android.hidl.allocator@1.0"
        "libbinder"
        "libbinder_ndk"
        "libutils"
        "liblog"
        "libcutils"
        "libmediandk"
        "libmedia"
        "libcrypto"
        "libhidlmemory"
        "libhidlbase"
        "libbase"
    ];

    include_dirs = [
        "frameworks/av/media/extractors/"
        "frameworks/av/media/libstagefright/"
    ];

    compile_multilib = "first";

    cflags = [
        "-Werror"
        "-Wall"
    ];

    ldflags = [
        "-Wl"
        "-Bsymbolic"
        #  to ignore duplicate symbol: GETEXTRACTORDEF
        "-z muldefs"
    ];

    sanitize = {
        cfi = true;
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
    };
};

in { inherit ExtractorUnitTest; }
