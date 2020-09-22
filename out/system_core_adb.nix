{ cc_binary, cc_binary_host, cc_defaults, cc_library, cc_library_host_static, cc_library_static, cc_test, cc_test_host, genrule, java_genrule, phony, python_test_host }:
let

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

adb_defaults = cc_defaults {
    name = "adb_defaults";

    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
        "-Wexit-time-destructors"
        "-Wno-unused-parameter"
        "-Wno-missing-field-initializers"
        "-Wthread-safety"
        "-Wvla"
        "-DADB_HOST=1" #  overridden by adbd_defaults
        "-DANDROID_BASE_UNIQUE_FD_DISABLE_IMPLICIT_CONVERSION=1"
    ];
    cpp_std = "experimental";

    use_version_lib = true;
    compile_multilib = "first";

    target = {
        darwin = {
            host_ldlibs = [
                "-lpthread"
                "-framework CoreFoundation"
                "-framework IOKit"
                "-lobjc"
            ];
        };

        windows = {
            cflags = [
                #  Define windows.h and tchar.h Unicode preprocessor symbols so that
                #  CreateFile(), _tfopen(), etc. map to versions that take wchar_t*, breaking the
                #  build if you accidentally pass char*. Fix by calling like:
                #    std::wstring path_wide;
                #    if (!android::base::UTF8ToWide(path_utf8, &path_wide)) { /* error handling */ }
                #    CreateFileW(path_wide.c_str());
                "-DUNICODE=1"
                "-D_UNICODE=1"

                #  Unlike on Linux, -std=gnu++ doesn't set _GNU_SOURCE on Windows.
                "-D_GNU_SOURCE"

                #  MinGW hides some things behind _POSIX_SOURCE.
                "-D_POSIX_SOURCE"

                #  libusb uses __stdcall on a variadic function, which gets ignored.
                "-Wno-ignored-attributes"

                #  Not supported yet.
                "-Wno-thread-safety"
            ];

            host_ldlibs = [
                "-lws2_32"
                "-lgdi32"
                "-luserenv"
            ];
        };
    };
};

adbd_defaults = cc_defaults {
    name = "adbd_defaults";
    defaults = ["adb_defaults"];

    cflags = [
        "-UADB_HOST"
        "-DADB_HOST=0"
    ];
};

host_adbd_supported = cc_defaults {
    name = "host_adbd_supported";

    host_supported = true;
    target = {
        linux = {
            enabled = true;
            host_ldlibs = [
                "-lresolv" #  b64_pton
                "-lutil" #  forkpty
            ];
        };
        darwin = {
            enabled = false;
        };
        windows = {
            enabled = false;
        };
    };
};

libadbd_binary_dependencies = cc_defaults {
    name = "libadbd_binary_dependencies";
    static_libs = [
        "libadb_crypto"
        "libadb_pairing_connection"
        "libadb_tls_connection"
        "libadbd"
        "libadbd_core"
        "libadbconnection_server"
        "libasyncio"
        "libbrotli"
        "libcutils_sockets"
        "libdiagnose_usb"
        "libmdnssd"
        "libbase"

        "libadb_protos"
    ];

    shared_libs = [
        "libadbd_auth"
        "libadbd_fs"
        "libcrypto"
        "libcrypto_utils"
        "liblog"
        "libselinux"
    ];

    target = {
        recovery = {
            exclude_static_libs = [
                "libadb_pairing_auth"
                "libadb_pairing_connection"
            ];
        };
    };
};

#  libadb
#  =========================================================
#  These files are compiled for both the host and the device.
libadb_srcs = [
    "adb.cpp"
    "adb_io.cpp"
    "adb_listeners.cpp"
    "adb_trace.cpp"
    "adb_unique_fd.cpp"
    "adb_utils.cpp"
    "fdevent/fdevent.cpp"
    "fdevent/fdevent_poll.cpp"
    "services.cpp"
    "sockets.cpp"
    "socket_spec.cpp"
    "sysdeps/errno.cpp"
    "transport.cpp"
    "transport_fd.cpp"
    "transport_local.cpp"
    "types.cpp"
];

libadb_posix_srcs = [
    "sysdeps_unix.cpp"
    "sysdeps/posix/network.cpp"
];

libadb_linux_srcs = [
    "fdevent/fdevent_epoll.cpp"
];

libadb_test_srcs = [
    "adb_io_test.cpp"
    "adb_listeners_test.cpp"
    "adb_utils_test.cpp"
    "fdevent/fdevent_test.cpp"
    "socket_spec_test.cpp"
    "socket_test.cpp"
    "sysdeps_test.cpp"
    "sysdeps/stat_test.cpp"
    "transport_test.cpp"
    "types_test.cpp"
];

libadb_host = cc_library_host_static {
    name = "libadb_host";
    defaults = ["adb_defaults"];

    srcs = libadb_srcs ++ [
        "client/auth.cpp"
        "client/adb_wifi.cpp"
        "client/usb_libusb.cpp"
        "client/usb_dispatch.cpp"
        "client/transport_mdns.cpp"
        "client/transport_usb.cpp"
        "client/pairing/pairing_client.cpp"
    ];

    generated_headers = ["platform_tools_version"];

    target = {
        linux = {
            srcs = ["client/usb_linux.cpp"] ++ libadb_linux_srcs;
        };
        darwin = {
            srcs = ["client/usb_osx.cpp"];
        };
        not_windows = {
            srcs = libadb_posix_srcs;
        };
        windows = {
            enabled = true;
            srcs = [
                "client/usb_windows.cpp"
                "sysdeps_win32.cpp"
                "sysdeps/win32/errno.cpp"
                "sysdeps/win32/stat.cpp"
            ];
            shared_libs = ["AdbWinApi"];
        };
    };

    static_libs = [
        "libadb_crypto"
        "libadb_protos"
        "libadb_pairing_connection"
        "libadb_tls_connection"
        "libbase"
        "libcrypto_utils"
        "libcrypto"
        "libdiagnose_usb"
        "libmdnssd"
        "libusb"
        "libutils"
        "liblog"
        "libcutils"
        "libprotobuf-cpp-lite"
    ];
};

adb_test = cc_test_host {
    name = "adb_test";
    defaults = ["adb_defaults"];
    srcs = libadb_test_srcs;
    static_libs = [
        "libadb_crypto_static"
        "libadb_host"
        "libadb_pairing_auth_static"
        "libadb_pairing_connection_static"
        "libadb_protos_static"
        "libadb_tls_connection_static"
        "libbase"
        "libcutils"
        "libcrypto_utils"
        "libcrypto"
        "liblog"
        "libmdnssd"
        "libdiagnose_usb"
        "libprotobuf-cpp-lite"
        "libssl"
        "libusb"
    ];

    target = {
        windows = {
            enabled = true;
            ldflags = ["-municode"];
            shared_libs = ["AdbWinApi"];
        };
    };
};

adb = cc_binary_host {
    name = "adb";

    stl = "libc++_static";
    defaults = ["adb_defaults"];

    srcs = [
        "client/adb_client.cpp"
        "client/bugreport.cpp"
        "client/commandline.cpp"
        "client/file_sync_client.cpp"
        "client/main.cpp"
        "client/console.cpp"
        "client/adb_install.cpp"
        "client/line_printer.cpp"
        "client/fastdeploy.cpp"
        "client/fastdeploycallbacks.cpp"
        "client/incremental.cpp"
        "client/incremental_server.cpp"
        "client/incremental_utils.cpp"
        "shell_service_protocol.cpp"
    ];

    generated_headers = [
        "bin2c_fastdeployagent"
        "bin2c_fastdeployagentscript"
    ];

    static_libs = [
        "libadb_crypto"
        "libadb_host"
        "libadb_pairing_auth"
        "libadb_pairing_connection"
        "libadb_protos"
        "libadb_tls_connection"
        "libandroidfw"
        "libbase"
        "libbrotli"
        "libcutils"
        "libcrypto_utils"
        "libcrypto"
        "libfastdeploy_host"
        "libdiagnose_usb"
        "liblog"
        "liblz4"
        "libmdnssd"
        "libprotobuf-cpp-lite"
        "libssl"
        "libusb"
        "libutils"
        "liblog"
        "libziparchive"
        "libz"
    ];

    #  Don't add anything here, we don't want additional shared dependencies
    #  on the host adb tool, and shared libraries that link against libc++
    #  will violate ODR
    shared_libs = [];

    #  Archive adb, adb.exe.
    dist = {
        targets = [
            "dist_files"
            "sdk"
            "win_sdk"
        ];
    };

    target = {
        darwin = {
            cflags = [
                "-Wno-sizeof-pointer-memaccess"
            ];
        };
        windows = {
            enabled = true;
            ldflags = ["-municode"];
            shared_libs = ["AdbWinApi"];
            required = [
                "AdbWinUsbApi"
            ];
        };
    };
};

#  libadbd_core contains the common sources to build libadbd and libadbd_services.
libadbd_core = cc_library_static {
    name = "libadbd_core";
    defaults = [
        "adbd_defaults"
        "host_adbd_supported"
    ];
    recovery_available = true;

    #  libminadbd wants both, as it's used to build native tests.
    compile_multilib = "both";

    srcs = libadb_srcs ++ libadb_linux_srcs ++ libadb_posix_srcs ++ [
        "daemon/auth.cpp"
        "daemon/jdwp_service.cpp"
        "daemon/logging.cpp"
        "daemon/adb_wifi.cpp"
    ];

    generated_headers = ["platform_tools_version"];

    static_libs = [
        "libadbconnection_server"
        "libdiagnose_usb"
    ];

    shared_libs = [
        "libadb_crypto"
        "libadb_pairing_connection"
        "libadb_protos"
        "libadb_tls_connection"
        "libadbd_auth"
        "libasyncio"
        "libbase"
        "libcrypto"
        "libcrypto_utils"
        "libcutils_sockets"
        "liblog"
    ];

    target = {
        android = {
            whole_static_libs = [
                "libqemu_pipe"
            ];
            srcs = [
                "daemon/transport_qemu.cpp"
                "daemon/usb.cpp"
                "daemon/usb_ffs.cpp"
            ];
        };
        recovery = {
            exclude_shared_libs = [
                "libadb_pairing_auth"
                "libadb_pairing_connection"
            ];
        };
    };

    apex_available = [
        "//apex_available:platform"
        "com.android.adbd"
    ];
    visibility = [
        "//bootable/recovery/minadbd"
        "//system/core/adb"
    ];
};

libadbd_services = cc_library {
    name = "libadbd_services";
    defaults = [
        "adbd_defaults"
        "host_adbd_supported"
    ];
    recovery_available = true;
    compile_multilib = "both";

    srcs = [
        "daemon/file_sync_service.cpp"
        "daemon/services.cpp"
        "daemon/shell_service.cpp"
        "shell_service_protocol.cpp"
    ];

    cflags = [
        "-D_GNU_SOURCE"
        "-Wno-deprecated-declarations"
    ];

    static_libs = [
        "libadbconnection_server"
        "libadbd_core"
        "libbrotli"
        "libdiagnose_usb"
    ];

    shared_libs = [
        "libadb_crypto"
        "libadb_pairing_connection"
        "libadb_protos"
        "libadb_tls_connection"
        "libasyncio"
        "libbase"
        "libcrypto_utils"
        "libcutils_sockets"

        #  APEX dependencies.
        "libadbd_auth"
        "libadbd_fs"
        "libcrypto"
        "liblog"
    ];

    target = {
        android = {
            srcs = [
                "daemon/abb_service.cpp"
                "daemon/framebuffer_service.cpp"
                "daemon/mdns.cpp"
                "daemon/restart_service.cpp"
            ];
            shared_libs = [
                "libmdnssd"
                "libselinux"
            ];
        };
        recovery = {
            exclude_srcs = [
                "daemon/abb_service.cpp"
            ];
            exclude_shared_libs = [
                "libadb_pairing_auth"
                "libadb_pairing_connection"
            ];
        };
    };

    apex_available = [
        "//apex_available:platform"
        "com.android.adbd"
    ];
    visibility = [
        "//system/core/adb"
    ];

};

libadbd = cc_library {
    name = "libadbd";
    defaults = [
        "adbd_defaults"
        "host_adbd_supported"
    ];
    recovery_available = true;
    apex_available = ["com.android.adbd"];

    #  avoid getting duplicate symbol of android::build::getbuildnumber().
    use_version_lib = false;

    #  libminadbd wants both, as it's used to build native tests.
    compile_multilib = "both";

    shared_libs = [
        "libadb_crypto"
        "libadb_pairing_connection"
        "libadb_tls_connection"
        "libasyncio"
        "libbase"
        "libcrypto"
        "libcrypto_utils"
        "liblog"
        "libselinux"

        #  APEX dependencies on the system image.
        "libadbd_auth"
        "libadbd_fs"
        "libadbd_services"
    ];

    target = {
        recovery = {
            exclude_shared_libs = [
                "libadb_pairing_auth"
                "libadb_pairing_connection"
            ];
        };
    };

    static_libs = [
        "libadbd_core"
        "libbrotli"
        "libcutils_sockets"
        "libdiagnose_usb"
        "libmdnssd"
    ];

    visibility = [
        "//bootable/recovery/minadbd"
        "//system/core/adb"
    ];
};

adbd = cc_binary {
    name = "adbd";
    defaults = [
        "adbd_defaults"
        "host_adbd_supported"
        "libadbd_binary_dependencies"
    ];
    recovery_available = true;
    apex_available = ["com.android.adbd"];

    srcs = [
        "daemon/main.cpp"
    ];

    cflags = [
        "-D_GNU_SOURCE"
        "-Wno-deprecated-declarations"
    ];

    strip = {
        keep_symbols = true;
    };

    static_libs = [
        "libadbd"
        "libadbd_services"
        "libasyncio"
        "libcap"
        "libminijail"
        "libssl"
    ];

    shared_libs = [
        "libadb_protos"
        "libadbd_auth"
    ];

    target = {
        recovery = {
            exclude_shared_libs = [
                "libadb_pairing_auth"
                "libadb_pairing_connection"
            ];
        };
    };
};

adbd_system_api = phony {
    #  Interface between adbd in a module and the system.
    name = "adbd_system_api";
    required = [
        "libadbd_auth"
        "libadbd_fs"
        "abb"
        "reboot"
        "set-verity-state"
    ];
};

adbd_system_api_recovery = phony {
    name = "adbd_system_api_recovery";
    required = [
        "libadbd_auth"
        "libadbd_fs"
        "reboot.recovery"
    ];
};

abb = cc_binary {
    name = "abb";

    defaults = ["adbd_defaults"];
    stl = "libc++";
    recovery_available = false;

    srcs = [
        "daemon/abb.cpp"
    ];

    cflags = [
        "-D_GNU_SOURCE"
        "-Wno-deprecated-declarations"
    ];

    strip = {
        keep_symbols = true;
    };

    static_libs = [
        "libadbd_core"
        "libadbd_services"
        "libcmd"
    ];

    shared_libs = [
        "libbase"
        "libbinder"
        "liblog"
        "libutils"
        "libselinux"
    ];
};

adbd_test = cc_test {
    name = "adbd_test";

    defaults = [
        "adbd_defaults"
        "libadbd_binary_dependencies"
    ];

    recovery_available = false;
    srcs = libadb_test_srcs ++ [
        "daemon/services.cpp"
        "daemon/shell_service.cpp"
        "daemon/shell_service_test.cpp"
        "shell_service_protocol.cpp"
        "shell_service_protocol_test.cpp"
        "mdns_test.cpp"
    ];

    test_config = "adb_test.xml";

    shared_libs = [
        "liblog"
    ];

    static_libs = [
        "libadbd"
        "libadbd_auth"
        "libbase"
        "libcrypto_utils"
        "libusb"
    ];
    test_suites = [
        "device-tests"
        "mts"
    ];
    require_root = true;
};

adb_integration_test_adb = python_test_host {
    name = "adb_integration_test_adb";
    main = "test_adb.py";
    srcs = [
        "test_adb.py"
    ];
    test_config = "adb_integration_test_adb.xml";
    test_suites = ["general-tests"];
    version = {
        py2 = {
            enabled = false;
        };
        py3 = {
            enabled = true;
        };
    };
};

adb_integration_test_device = python_test_host {
    name = "adb_integration_test_device";
    main = "test_device.py";
    srcs = [
        "test_device.py"
    ];
    libs = [
        "adb_py"
    ];
    test_config = "adb_integration_test_device.xml";
    test_suites = ["general-tests"];
    version = {
        py2 = {
            enabled = false;
        };
        py3 = {
            enabled = true;
        };
    };
};

#  Note: using pipe for xxd to control the variable name generated
#  the default name used by xxd is the path to the input file.
bin2c_fastdeployagent = java_genrule {
    name = "bin2c_fastdeployagent";
    out = ["deployagent.inc"];
    srcs = [":deployagent"];
    cmd = "(echo 'unsigned char kDeployAgent[] = {' && xxd -i <$(in) && echo '};') > $(out)";
};

bin2c_fastdeployagentscript = genrule {
    name = "bin2c_fastdeployagentscript";
    out = ["deployagentscript.inc"];
    srcs = ["fastdeploy/deployagent/deployagent.sh"];
    cmd = "(echo 'unsigned char kDeployAgentScript[] = {' && xxd -i <$(in) && echo '};') > $(out)";
};

libfastdeploy_host = cc_library_host_static {
    name = "libfastdeploy_host";
    defaults = ["adb_defaults"];
    srcs = [
        "fastdeploy/deploypatchgenerator/apk_archive.cpp"
        "fastdeploy/deploypatchgenerator/deploy_patch_generator.cpp"
        "fastdeploy/deploypatchgenerator/patch_utils.cpp"
        "fastdeploy/proto/ApkEntry.proto"
    ];
    static_libs = [
        "libadb_host"
        "libandroidfw"
        "libbase"
        "libcutils"
        "libcrypto_utils"
        "libcrypto"
        "libdiagnose_usb"
        "liblog"
        "libmdnssd"
        "libusb"
        "libutils"
        "libziparchive"
        "libz"
    ];
    proto = {
        type = "lite";
        export_proto_headers = true;
    };
    target = {
        windows = {
            enabled = true;
            shared_libs = ["AdbWinApi"];
        };
    };
};

fastdeploy_test = cc_test_host {
    name = "fastdeploy_test";
    defaults = ["adb_defaults"];
    srcs = [
        "fastdeploy/deploypatchgenerator/apk_archive_test.cpp"
        "fastdeploy/deploypatchgenerator/deploy_patch_generator_test.cpp"
        "fastdeploy/deploypatchgenerator/patch_utils_test.cpp"
    ];
    static_libs = [
        "libadb_crypto_static"
        "libadb_host"
        "libadb_pairing_auth_static"
        "libadb_pairing_connection_static"
        "libadb_protos_static"
        "libadb_tls_connection_static"
        "libandroidfw"
        "libbase"
        "libcutils"
        "libcrypto_utils"
        "libcrypto"
        "libdiagnose_usb"
        "libfastdeploy_host"
        "liblog"
        "libmdnssd"
        "libprotobuf-cpp-lite"
        "libssl"
        "libusb"
        "libutils"
        "libziparchive"
        "libz"
    ];
    target = {
        windows = {
            enabled = true;
            shared_libs = ["AdbWinApi"];
        };
    };
    data = [
        "fastdeploy/testdata/rotating_cube-metadata-release.data"
        "fastdeploy/testdata/rotating_cube-release.apk"
        "fastdeploy/testdata/sample.apk"
        "fastdeploy/testdata/sample.cd"
    ];
};

in { inherit abb adb adb_defaults adb_integration_test_adb adb_integration_test_device adb_test adbd adbd_defaults adbd_system_api adbd_system_api_recovery adbd_test bin2c_fastdeployagent bin2c_fastdeployagentscript fastdeploy_test host_adbd_supported libadb_host libadbd libadbd_binary_dependencies libadbd_core libadbd_services libfastdeploy_host; }
