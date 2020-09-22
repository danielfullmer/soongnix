{ cc_library, cc_library_headers }:
let

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

libminikin-headers-for-tests = cc_library_headers {
    name = "libminikin-headers-for-tests";
    export_include_dirs = ["."];
    shared_libs = ["libharfbuzz_ng"];
    export_shared_lib_headers = ["libharfbuzz_ng"];
};

libminikin = cc_library {
    name = "libminikin";
    host_supported = true;
    srcs = [
        "BidiUtils.cpp"
        "CmapCoverage.cpp"
        "Emoji.cpp"
        "FontCollection.cpp"
        "FontFamily.cpp"
        "FontUtils.cpp"
        "GraphemeBreak.cpp"
        "GreedyLineBreaker.cpp"
        "Hyphenator.cpp"
        "HyphenatorMap.cpp"
        "Layout.cpp"
        "LayoutCore.cpp"
        "LayoutUtils.cpp"
        "LineBreaker.cpp"
        "LineBreakerUtil.cpp"
        "Locale.cpp"
        "LocaleListCache.cpp"
        "MeasuredText.cpp"
        "Measurement.cpp"
        "MinikinInternal.cpp"
        "OptimalLineBreaker.cpp"
        "SparseBitSet.cpp"
        "SystemFonts.cpp"
        "WordBreaker.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
            "unsigned-integer-overflow"
            "bounds"
        ];
    };
    cppflags = [
        "-Werror"
        "-Wall"
        "-Wextra"
        "-Wthread-safety"
    ];
    product_variables = {
        debuggable = {
            #  Enable assertion on eng and userdebug build.
            cppflags = ["-DENABLE_ASSERTION"];
        };
    };
    shared_libs = [
        "liblog"
        "libharfbuzz_ng"
    ];
    header_libs = [
        "libbase_headers"
        "libminikin_headers"
        "libutils_headers"
    ];
    export_header_lib_headers = ["libminikin_headers"];
    whole_static_libs = ["libgtest_prod"];

    clang = true;

    target = {
        android = {
            shared_libs = [
                "libandroidicu"
            ];
            export_shared_lib_headers = [
                "libandroidicu"
            ];
        };
        host = {
            shared_libs = [
                "libicui18n"
                "libicuuc"
            ];
            export_shared_lib_headers = [
                "libicui18n"
                "libicuuc"
            ];
        };
        windows = {
            enabled = true;
            cppflags = [
                "-Wno-ignored-attributes"
                "-Wno-thread-safety"
            ];
        };
    };
};

in { inherit libminikin libminikin-headers-for-tests; }
