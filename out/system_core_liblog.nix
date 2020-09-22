{ cc_library, cc_library_headers }:
let

#
#  Copyright (C) 2008-2014 The Android Open Source Project
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

liblog_sources = [
    "log_event_list.cpp"
    "log_event_write.cpp"
    "logger_name.cpp"
    "logger_read.cpp"
    "logger_write.cpp"
    "logprint.cpp"
    "properties.cpp"
];
liblog_target_sources = [
    "event_tag_map.cpp"
    "log_time.cpp"
    "pmsg_reader.cpp"
    "pmsg_writer.cpp"
    "logd_reader.cpp"
    "logd_writer.cpp"
];

liblog_headers = cc_library_headers {
    name = "liblog_headers";
    host_supported = true;
    vendor_available = true;
    ramdisk_available = true;
    recovery_available = true;
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "29";
    native_bridge_supported = true;
    export_include_dirs = ["include"];
    system_shared_libs = [];
    stl = "none";
    target = {
        windows = {
            enabled = true;
        };
        linux_bionic = {
            enabled = true;
        };
        vendor = {
            override_export_include_dirs = ["include_vndk"];
        };
    };
};

#  Shared and static library for host and device
#  ========================================================
liblog = cc_library {
    name = "liblog";
    host_supported = true;
    ramdisk_available = true;
    recovery_available = true;
    native_bridge_supported = true;
    srcs = liblog_sources;

    target = {
        android = {
            version_script = "liblog.map.txt";
            srcs = liblog_target_sources;
            #  AddressSanitizer runtime library depends on liblog.
            sanitize = {
                address = false;
            };
        };
        android_arm = {
            #  TODO: This is to work around b/24465209. Remove after root cause is fixed
            pack_relocations = false;
            ldflags = ["-Wl,--hash-style=both"];
        };
        windows = {
            enabled = true;
        };
        not_windows = {
            srcs = ["event_tag_map.cpp"];
        };
        linux_bionic = {
            enabled = true;
        };
    };

    header_libs = [
        "libbase_headers"
        "liblog_headers"
    ];
    export_header_lib_headers = ["liblog_headers"];

    stubs = {
        symbol_file = "liblog.map.txt";
        versions = [
            "29"
            "30"
        ];
    };

    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
        #  This is what we want to do:
        #   liblog_cflags := $(shell \
        #    sed -n \
        #        's/^\([0-9]*\)[ \t]*liblog[ \t].*/-DLIBLOG_LOG_TAG=\1/p' \
        #        $(LOCAL_PATH)/event.logtags)
        #  so make sure we do not regret hard-coding it as follows:
        "-DLIBLOG_LOG_TAG=1006"
        "-DSNET_EVENT_LOG_TAG=1397638484"
    ];
    logtags = ["event.logtags"];
    compile_multilib = "both";
    apex_available = [
        "//apex_available:platform"
        #  liblog is exceptionally available to the runtime APEX
        #  because the dynamic linker has to use it statically.
        #  See b/151051671
        "com.android.runtime"
        #  DO NOT add more apex names here
    ];
};

in { inherit liblog liblog_headers; }
