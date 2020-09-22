{ cc_defaults, cc_library_static }:
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

libmediabenchmark_common = cc_library_static {
    name = "libmediabenchmark_common";
    defaults = [
        "libmediabenchmark-defaults"
        "libmediabenchmark_soft_sanitize_all-defaults"
    ];

    srcs = [
        "BenchmarkCommon.cpp"
        "Stats.cpp"
        "utils/Timers.cpp"
    ];

    export_include_dirs = ["."];

    ldflags = ["-Wl,-Bsymbolic"];
};

libmediabenchmark_common-defaults = cc_defaults {
    name = "libmediabenchmark_common-defaults";

    defaults = [
        "libmediabenchmark-defaults"
    ];

    static_libs = [
        "libmediabenchmark_common"
    ];
};

libmediabenchmark-defaults = cc_defaults {
    name = "libmediabenchmark-defaults";
    sdk_version = "current";
    stl = "c++_shared";

    shared_libs = [
        "libmediandk"
        "liblog"
    ];

    cflags = [
        "-Wall"
        "-Werror"
    ];
};

libmediabenchmark_codec2_common = cc_library_static {
    name = "libmediabenchmark_codec2_common";
    defaults = [
        "libmediabenchmark_codec2_common-defaults"
    ];

    srcs = [
        "BenchmarkC2Common.cpp"
        "BenchmarkCommon.cpp"
        "Stats.cpp"
        "utils/Timers.cpp"
    ];

    export_include_dirs = ["."];

    ldflags = ["-Wl,-Bsymbolic"];
};

libmediabenchmark_codec2_common-defaults = cc_defaults {
    name = "libmediabenchmark_codec2_common-defaults";

    defaults = [
        "libcodec2-hidl-client-defaults"
        "libmediabenchmark_soft_sanitize_all-defaults"
    ];

    include_dirs = [
        "frameworks/av/media/codec2/hidl/client/include"
    ];

    shared_libs = [
        "libcodec2_client"
        "libmediandk"
        "liblog"
    ];

    cflags = [
        "-Wall"
        "-Werror"
    ];
};

#  public dependency for native implementation
#  to be used by code under media/benchmark/* only
libmediabenchmark_soft_sanitize_all-defaults = cc_defaults {
    name = "libmediabenchmark_soft_sanitize_all-defaults";

    sanitize = {
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
        cfi = true;
    };
};

in { inherit libmediabenchmark-defaults libmediabenchmark_codec2_common libmediabenchmark_codec2_common-defaults libmediabenchmark_common libmediabenchmark_common-defaults libmediabenchmark_soft_sanitize_all-defaults; }
