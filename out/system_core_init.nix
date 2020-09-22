{ cc_benchmark, cc_binary, cc_defaults, cc_library_static, cc_test, genrule, phony }:
let

#
#  Copyright (C) 2017 The Android Open Source Project
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

init_common_sources = [
    "action.cpp"
    "action_manager.cpp"
    "action_parser.cpp"
    "capabilities.cpp"
    "epoll.cpp"
    "import_parser.cpp"
    "interface_utils.cpp"
    "keychords.cpp"
    "parser.cpp"
    "property_type.cpp"
    "rlimit_parser.cpp"
    "service.cpp"
    "service_list.cpp"
    "service_parser.cpp"
    "service_utils.cpp"
    "subcontext.cpp"
    "subcontext.proto"
    "tokenizer.cpp"
    "util.cpp"
];
init_device_sources = [
    "block_dev_initializer.cpp"
    "bootchart.cpp"
    "builtins.cpp"
    "devices.cpp"
    "firmware_handler.cpp"
    "first_stage_console.cpp"
    "first_stage_init.cpp"
    "first_stage_mount.cpp"
    "fscrypt_init_extensions.cpp"
    "init.cpp"
    "lmkd_service.cpp"
    "modalias_handler.cpp"
    "mount_handler.cpp"
    "mount_namespace.cpp"
    "persistent_properties.cpp"
    "persistent_properties.proto"
    "property_service.cpp"
    "property_service.proto"
    "reboot.cpp"
    "reboot_utils.cpp"
    "security.cpp"
    "selabel.cpp"
    "selinux.cpp"
    "sigchld_handler.cpp"
    "switch_root.cpp"
    "uevent_listener.cpp"
    "ueventd.cpp"
    "ueventd_parser.cpp"
];
init_host_sources = [
    "check_builtins.cpp"
    "host_import_parser.cpp"
    "host_init_verifier.cpp"
];

init_defaults = cc_defaults {
    name = "init_defaults";
    cpp_std = "experimental";
    sanitize = {
        misc_undefined = ["signed-integer-overflow"];
    };
    cflags = [
        "-DLOG_UEVENTS=0"
        "-Wall"
        "-Wextra"
        "-Wno-unused-parameter"
        "-Werror"
        "-Wthread-safety"
        "-DALLOW_FIRST_STAGE_CONSOLE=0"
        "-DALLOW_LOCAL_PROP_OVERRIDE=0"
        "-DALLOW_PERMISSIVE_SELINUX=0"
        "-DREBOOT_BOOTLOADER_ON_PANIC=0"
        "-DWORLD_WRITABLE_KMSG=0"
        "-DDUMP_ON_UMOUNT_FAILURE=0"
        "-DSHUTDOWN_ZERO_TIMEOUT=0"
        "-DINIT_FULL_SOURCES"
    ];
    product_variables = {
        debuggable = {
            cppflags = [
                "-UALLOW_FIRST_STAGE_CONSOLE"
                "-DALLOW_FIRST_STAGE_CONSOLE=1"
                "-UALLOW_LOCAL_PROP_OVERRIDE"
                "-DALLOW_LOCAL_PROP_OVERRIDE=1"
                "-UALLOW_PERMISSIVE_SELINUX"
                "-DALLOW_PERMISSIVE_SELINUX=1"
                "-UREBOOT_BOOTLOADER_ON_PANIC"
                "-DREBOOT_BOOTLOADER_ON_PANIC=1"
                "-UWORLD_WRITABLE_KMSG"
                "-DWORLD_WRITABLE_KMSG=1"
                "-UDUMP_ON_UMOUNT_FAILURE"
                "-DDUMP_ON_UMOUNT_FAILURE=1"
            ];
        };
        eng = {
            cppflags = [
                "-USHUTDOWN_ZERO_TIMEOUT"
                "-DSHUTDOWN_ZERO_TIMEOUT=1"
            ];
        };
        uml = {
            cppflags = ["-DUSER_MODE_LINUX"];
        };
    };
    static_libs = [
        "libavb"
        "libc++fs"
        "libcgrouprc_format"
        "liblmkd_utils"
        "libmodprobe"
        "libprotobuf-cpp-lite"
        "libpropertyinfoserializer"
        "libpropertyinfoparser"
        "libsnapshot_init"
        "lib_apex_manifest_proto_lite"
    ];
    shared_libs = [
        "libbacktrace"
        "libbase"
        "libbootloader_message"
        "libcutils"
        "libdl"
        "libext4_utils"
        "libfs_mgr"
        "libgsi"
        "libhidl-gen-utils"
        "libkeyutils"
        "liblog"
        "liblogwrap"
        "liblp"
        "libprocessgroup"
        "libprocessgroup_setup"
        "libselinux"
        "libutils"
    ];
    bootstrap = true;
    visibility = [":__subpackages__"];
};

libinit = cc_library_static {
    name = "libinit";
    recovery_available = true;
    defaults = [
        "init_defaults"
        "selinux_policy_version"
    ];
    srcs = init_common_sources ++ init_device_sources;
    whole_static_libs = [
        "libcap"
        "com.android.sysprop.apex"
        "com.android.sysprop.init"
    ];
    header_libs = ["bootimg_headers"];
    proto = {
        type = "lite";
        export_proto_headers = true;
    };

    target = {
        recovery = {
            cflags = ["-DRECOVERY"];
            exclude_shared_libs = [
                "libbinder"
                "libutils"
            ];
        };
    };
};

init = phony {
    name = "init";
    required = [
        "init_second_stage"
    ];
};

init_second_stage = cc_binary {
    name = "init_second_stage";
    recovery_available = true;
    stem = "init";
    defaults = ["init_defaults"];
    static_libs = ["libinit"];
    required = [
        "e2fsdroid"
        "init.rc"
        "mke2fs"
        "sload_f2fs"
        "make_f2fs"
        "ueventd.rc"
    ];
    srcs = ["main.cpp"];
    symlinks = ["ueventd"];
    target = {
        recovery = {
            cflags = ["-DRECOVERY"];
            exclude_shared_libs = [
                "libbinder"
                "libutils"
            ];
        };
    };
};

#  Tests
#  ------------------------------------------------------------------------------

CtsInitTestCases = cc_test {
    name = "CtsInitTestCases";
    defaults = ["init_defaults"];
    require_root = true;

    compile_multilib = "both";
    multilib = {
        lib32 = {
            suffix = "32";
        };
        lib64 = {
            suffix = "64";
        };
    };

    srcs = [
        "devices_test.cpp"
        "firmware_handler_test.cpp"
        "init_test.cpp"
        "keychords_test.cpp"
        "oneshot_on_test.cpp"
        "persistent_properties_test.cpp"
        "property_service_test.cpp"
        "property_type_test.cpp"
        "rlimit_parser_test.cpp"
        "service_test.cpp"
        "subcontext_test.cpp"
        "tokenizer_test.cpp"
        "ueventd_parser_test.cpp"
        "ueventd_test.cpp"
        "util_test.cpp"
    ];
    static_libs = ["libinit"];

    test_suites = [
        "cts"
        "device-tests"
        "vts10"
    ];
};

init_benchmarks = cc_benchmark {
    name = "init_benchmarks";
    defaults = ["init_defaults"];
    srcs = [
        "subcontext_benchmark.cpp"
    ];
    static_libs = ["libinit"];
};

libinit_test_utils_libraries_defaults = cc_defaults {
    name = "libinit_test_utils_libraries_defaults";
    shared_libs = [
        "libbase"
        "libcutils"
        "libselinux"
        "libhidl-gen-utils"
        "liblog"
        "libprocessgroup"
        "libprotobuf-cpp-lite"
    ];
};

libinit_test_utils = cc_library_static {
    name = "libinit_test_utils";
    defaults = ["libinit_test_utils_libraries_defaults"];
    cflags = [
        "-Wall"
        "-Wextra"
        "-Wno-unused-parameter"
        "-Werror"
    ];
    srcs = init_common_sources ++ [
        "test_utils/service_utils.cpp"
    ];
    whole_static_libs = [
        "libcap"
    ];
    export_include_dirs = ["test_utils/include"]; #  for tests
};

#  Host Verifier
#  ------------------------------------------------------------------------------

generated_stub_builtin_function_map = genrule {
    name = "generated_stub_builtin_function_map";
    tool_files = ["host_builtin_map.py"];
    out = ["generated_stub_builtin_function_map.h"];
    srcs = [
        "builtins.cpp"
        "check_builtins.cpp"
    ];
    cmd = "$(location host_builtin_map.py) --builtins $(location builtins.cpp) --check_builtins $(location check_builtins.cpp) > $(out)";
};

host_init_verifier = cc_binary {
    name = "host_init_verifier";
    host_supported = true;
    cpp_std = "experimental";
    cflags = [
        "-Wall"
        "-Wextra"
        "-Wno-unused-parameter"
        "-Werror"
    ];
    static_libs = [
        "libbase"
        "libselinux"
        "libpropertyinfoserializer"
        "libpropertyinfoparser"
    ];
    whole_static_libs = ["libcap"];
    shared_libs = [
        "libcutils"
        "libhidl-gen-utils"
        "libhidlmetadata"
        "liblog"
        "libprocessgroup"
        "libprotobuf-cpp-lite"
    ];
    srcs = init_common_sources ++ init_host_sources;
    proto = {
        type = "lite";
    };
    generated_headers = [
        "generated_stub_builtin_function_map"
        "generated_android_ids"
    ];
    target = {
        android = {
            enabled = false;
        };
        darwin = {
            enabled = false;
        };
    };
};

in { inherit CtsInitTestCases generated_stub_builtin_function_map host_init_verifier init init_benchmarks init_defaults init_second_stage libinit libinit_test_utils libinit_test_utils_libraries_defaults; }
