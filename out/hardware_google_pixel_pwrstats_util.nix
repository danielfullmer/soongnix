{ cc_defaults, cc_library_static }:
let

#
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
libpowerstatsutil = cc_library_static {
    name = "libpowerstatsutil";
    defaults = ["pwrstatsutil_defaults"];
    export_include_dirs = ["."];
    srcs = [
        "pwrstats_util.cpp"
        "PowerStatsCollector.cpp"
        "dataproviders/PowerEntityResidencyDataProvider.cpp"
        "dataproviders/RailEnergyDataProvider.cpp"
        "dataproviders/DataProviderHelper.cpp"
        "pwrstatsutil.proto"
    ];
    proto = {
        export_proto_headers = true;
        type = "full";
    };
    shared_libs = [
        "libhidlbase"
        "android.hardware.power.stats@1.0"
    ];
};

#  Useful defaults for pwrstats_util
pwrstatsutil_defaults = cc_defaults {
    name = "pwrstatsutil_defaults";
    vendor = true;
    cflags = [
        "-Wall"

        #  Try to catch typical 32-bit assumptions that break with 64-bit pointers.
        "-Werror=pointer-to-int-cast"
        "-Werror=int-to-pointer-cast"
        "-Werror=type-limits"
        "-Werror"
        "-Wno-unused-parameter"
    ];
    tidy = true;
    tidy_checks = [
        "android-*"
        "cert-*"
        "clang-analyzer-security*"
        "google-*"
        "misc-*"
        "performance-*"
    ];
    tidy_flags = [
        ("-warnings-as-errors=" +
            "'android-*'" +
            ",'clang-analyzer-security*'" +
            ",'cert-*'" +
            ",'google-*'" +
            ",'performance-*'" +
            ",'misc-*'")
    ];
    shared_libs = [
        "libbase"
        "libutils"
        "liblog"
        "libprotobuf-cpp-full"
    ];
};

in { inherit libpowerstatsutil pwrstatsutil_defaults; }
