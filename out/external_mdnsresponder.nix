{ cc_binary, cc_defaults, cc_library }:
let

commonLibs = [
    "libcutils"
    "liblog"
];

mdnsresponder_default_cflags = cc_defaults {
    name = "mdnsresponder_default_cflags";

    cflags = [
        "-O2"
        "-g"
        "-fno-strict-aliasing"
        "-fwrapv"
        "-D_GNU_SOURCE"
        "-DHAVE_IPV6"
        "-DNOT_HAVE_SA_LEN"
        "-DPLATFORM_NO_RLIMIT"
        "-DMDNS_DEBUGMSGS=0"
        "-DMDNS_UDS_SERVERPATH=\\\"/dev/socket/mdnsd\\\""
        "-DMDNS_USERNAME=\\\"mdnsr\\\""
        "-W"
        "-Wall"
        "-Wextra"
        "-Wno-address-of-packed-member"
        "-Wno-array-bounds"
        "-Wno-pointer-sign"
        "-Wno-unused"
        #"-Wno-unused-but-set-variable"
        "-Wno-unused-parameter"
        "-Werror=implicit-function-declaration"
    ];
    target = {
        linux = {
            cflags = [
                "-DTARGET_OS_LINUX"
                "-DHAVE_LINUX"
                "-DUSES_NETLINK"
                "-Werror"
            ];
        };
        darwin = {
            cflags = [
                "-DTARGET_OS_MAC"
                "-Wno-error"
            ];
        };
        windows = {
            enabled = true;
            cflags = [
                "-DTARGET_OS_WINDOWS"
                "-DWIN32"
                "-DNDEBUG"
                "-D_WIN32_LEAN_AND_MEAN"
                "-DUSE_TCP_LOOPBACK"
                "-D_CRT_SECURE_NO_DEPRECATE"
                "-D_CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES=1"
                "-Wno-error"
                "-Wno-sign-compare"
                "-include stdint.h"
                "-include winsock2.h"
                "-include ws2ipdef.h"
                "-include wincrypt.h"
                "-include netioapi.h"
            ];
            local_include_dirs = [
                "mDNSWindows"
                "android/caseMapping"
            ];
        };
    };
};

mdnsd = cc_binary {
    name = "mdnsd";
    defaults = ["mdnsresponder_default_cflags"];
    host_supported = true;
    srcs = [
        "mDNSCore/mDNS.c"
        "mDNSCore/DNSDigest.c"
        "mDNSCore/uDNS.c"
        "mDNSCore/DNSCommon.c"
        "mDNSShared/uds_daemon.c"
        "mDNSShared/mDNSDebug.c"
        "mDNSShared/dnssd_ipc.c"
        "mDNSShared/GenLinkedList.c"
    ];

    local_include_dirs = [
        "mDNSCore"
        "mDNSShared"
    ];
    init_rc = ["mdnsd.rc"];

    cflags = ["-DMDNS_VERSIONSTR_NODTS=1"];

    target = {
        android = {
            static_executable = true;
            local_include_dirs = ["mDNSPosix"];
            srcs = [
                "mDNSShared/PlatformCommon.c"
                "mDNSPosix/PosixDaemon.c"
                "mDNSPosix/mDNSPosix.c"
                "mDNSPosix/mDNSUNP.c"
            ];
        };
        not_windows = {
            local_include_dirs = ["mDNSPosix"];
            srcs = [
                "mDNSShared/PlatformCommon.c"
                "mDNSPosix/PosixDaemon.c"
                "mDNSPosix/mDNSPosix.c"
                "mDNSPosix/mDNSUNP.c"
            ];
        };
        windows = {
            cflags = [
                "-DTARGET_OS_WIN32"
                "-D_CONSOLE"
                "-DPLATFORM_NO_STRSEP"
                "-DPLATFORM_NO_EPIPE"
                "-DPLATFORM_NO_RLIMIT"
                "-DPID_FILE=\"\""
                "-DUNICODE"
                "-D_UNICODE"
                "-D_LEGACY_NAT_TRAVERSAL"
                "-Wno-empty-body"
            ];

            ldflags = ["-municode"];
            host_ldlibs = [
                "-lws2_32"
                "-liphlpapi"
                "-lpowrprof"
                "-lnetapi32"
            ];

            srcs = [
                "mDNSWindows/SystemService/main.c"
                "mDNSWindows/SystemService/Service.c"
                "mDNSWindows/SystemService/EventLog.mc"
                "mDNSWindows/Secret.c"
                "mDNSWindows/mDNSWin32.c"
                "mDNSShared/DebugServices.c"
                "android/windows_firewall_dummy.c"
            ];

            local_include_dirs = [
                "mDNSWindows/SystemService"
            ];
        };
    };

    static_libs = commonLibs;
};

# #########################

libmdnssd = cc_library {
    name = "libmdnssd";
    defaults = ["mdnsresponder_default_cflags"];
    host_supported = true;
    recovery_available = true;
    srcs = [
        "mDNSShared/dnssd_clientlib.c"
        "mDNSShared/dnssd_clientstub.c"
        "mDNSShared/dnssd_ipc.c"
    ];

    target = {
        host = {
            shared = {
                enabled = false;
            };
        };
        windows = {
            srcs = ["mDNSWindows/DLL/dllmain.c"];

            cflags = [
                "-D_WINDOWS"
                "-D_USERDLL"
                "-D_MDNS_DEBUGMSGS=0"
                "-D_SSIZE_T"
                "-DNOT_HAVE_SA_LENGTH"
                "-Wno-unknown-pragmas"
                "-Wno-overflow"
                "-include iphlpapi.h"
                "-include stdlib.h"
                "-include stdio.h"
            ];
        };
    };

    export_include_dirs = ["mDNSShared"];

    static_libs = commonLibs;
};

# ###########################

dnssd = cc_binary {
    name = "dnssd";
    defaults = ["mdnsresponder_default_cflags"];
    srcs = [
        "Clients/dns-sd.c"
        "Clients/ClientCommon.c"
    ];

    system_shared_libs = [
        "libc"
        "libdl"
    ];
    shared_libs = [
        "libmdnssd"
        "libcutils"
        "liblog"
    ];
};

in { inherit dnssd libmdnssd mdnsd mdnsresponder_default_cflags; }
