{ cc_library }:
let

#  Copyright 2017 The Android Open Source Project
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

libmediautils = cc_library {
    name = "libmediautils";

    srcs = [
        "AImageReaderUtils.cpp"
        "BatteryNotifier.cpp"
        "ISchedulingPolicyService.cpp"
        "MemoryLeakTrackUtil.cpp"
        "ProcessInfo.cpp"
        "SchedulingPolicyService.cpp"
        "ServiceUtilities.cpp"
        "TimeCheck.cpp"
    ];
    shared_libs = [
        "libbinder"
        "libcutils"
        "liblog"
        "libutils"
        "libmemunreachable"
        "libhidlbase"
        "android.hardware.graphics.bufferqueue@1.0"
        "android.hidl.token@1.0-utils"
    ];

    logtags = ["EventLogTags.logtags"];

    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];

    product_variables = {
        product_is_iot = {
            cflags = ["-DTARGET_ANDROID_THINGS"];
        };
    };

    include_dirs = [
        #  For android_mallopt definitions.
        "bionic/libc/private"
    ];
    local_include_dirs = ["include"];
    export_include_dirs = ["include"];
};

in { inherit libmediautils; }
