{ cc_binary, cc_defaults, cc_library_static, cc_test, filegroup }:
let

/*
 * Copyright (C) 2017 The Android Open Source Project
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

storaged_defaults = cc_defaults {
    name = "storaged_defaults";

    shared_libs = [
        "android.hardware.health@1.0"
        "android.hardware.health@2.0"
        "libbase"
        "libbinder"
        "libcutils"
        "libhidlbase"
        "liblog"
        "libprotobuf-cpp-lite"
        "libsysutils"
        "libutils"
        "libz"
    ];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
        "-Wno-unused-parameter"
    ];
};

libstoraged = cc_library_static {
    name = "libstoraged";

    defaults = ["storaged_defaults"];

    aidl = {
        export_aidl_headers = true;
        local_include_dirs = ["binder"];
        include_dirs = ["frameworks/native/aidl/binder"];
    };

    srcs = [
        "storaged.cpp"
        "storaged_diskstats.cpp"
        "storaged_info.cpp"
        "storaged_service.cpp"
        "storaged_utils.cpp"
        "storaged_uid_monitor.cpp"
        "uid_info.cpp"
        "storaged.proto"
        ":storaged_aidl"
        ":storaged_aidl_private"
    ];

    static_libs = ["libhealthhalutils"];
    header_libs = ["libbatteryservice_headers"];

    logtags = ["EventLogTags.logtags"];

    proto = {
        type = "lite";
        export_proto_headers = true;
    };

    export_include_dirs = ["include"];
};

storaged = cc_binary {
    name = "storaged";

    defaults = ["storaged_defaults"];

    init_rc = ["storaged.rc"];

    srcs = ["main.cpp"];

    static_libs = [
        "libhealthhalutils"
        "libstoraged"
    ];
};

/*
 * Run with:
 *  adb shell /data/nativetest/storaged-unit-tests/storaged-unit-tests
 */
storaged-unit-tests = cc_test {
    name = "storaged-unit-tests";

    defaults = ["storaged_defaults"];

    srcs = ["tests/storaged_test.cpp"];

    static_libs = [
        "libhealthhalutils"
        "libstoraged"
    ];
};

#  AIDL interface between storaged and framework.jar
storaged_aidl = filegroup {
    name = "storaged_aidl";
    srcs = [
        "binder/android/os/IStoraged.aidl"
    ];
    path = "binder";
};

storaged_aidl_private = filegroup {
    name = "storaged_aidl_private";
    srcs = [
        "binder/android/os/storaged/IStoragedPrivate.aidl"
    ];
    path = "binder";
};

in { inherit libstoraged storaged storaged-unit-tests storaged_aidl storaged_aidl_private storaged_defaults; }
