{ cc_binary_host, cc_defaults, cc_library }:
let

common_CFLAGS = [
    #  Persistently stored patterns (pcre2) are architecture dependent.
    #  In particular paterns built on amd64 can not run on devices with armv7
    #  (32bit). Therefore, this feature stays off for now.
    "-DNO_PERSISTENTLY_STORED_PATTERNS"
    "-DDISABLE_SETRANS"
    "-DDISABLE_BOOL"
    "-D_GNU_SOURCE"
    "-DNO_MEDIA_BACKEND"
    "-DNO_X_BACKEND"
    "-DNO_DB_BACKEND"
    "-Wall"
    "-Werror"
    "-Wno-error=missing-noreturn"
    "-Wno-error=unused-function"
    "-Wno-error=unused-variable"
];

libselinux_defaults = cc_defaults {
    name = "libselinux_defaults";

    cflags = common_CFLAGS;

    srcs = [
        "src/booleans.c"
        "src/callbacks.c"
        "src/freecon.c"
        "src/label_backends_android.c"
        "src/label.c"
        "src/label_support.c"
        "src/matchpathcon.c"
        "src/setrans_client.c"
        "src/sha1.c"
    ];

    target = {
        host = {
            cflags = [
                "-DBUILD_HOST"
            ];
        };

        android = {
            srcs = [
                "src/android/android.c"
                "src/avc.c"
                "src/avc_internal.c"
                "src/avc_sidtab.c"
                "src/canonicalize_context.c"
                "src/checkAccess.c"
                "src/check_context.c"
                "src/compute_av.c"
                "src/compute_create.c"
                "src/compute_member.c"
                "src/context.c"
                "src/deny_unknown.c"
                "src/disable.c"
                "src/enabled.c"
                "src/fgetfilecon.c"
                "src/fsetfilecon.c"
                "src/getenforce.c"
                "src/getfilecon.c"
                "src/get_initial_context.c"
                "src/getpeercon.c"
                "src/init.c"
                "src/lgetfilecon.c"
                "src/load_policy.c"
                "src/lsetfilecon.c"
                "src/mapping.c"
                "src/policyvers.c"
                "src/procattr.c"
                "src/reject_unknown.c"
                "src/sestatus.c"
                "src/setenforce.c"
                "src/setfilecon.c"
                "src/stringrep.c"
            ];

            shared_libs = [
                "liblog"
            ];

            local_include_dirs = ["src"];

            #  1003 corresponds to auditd, from system/core/logd/event.logtags
            cflags = [
                "-DAUDITD_LOG_TAG=1003"
            ];
        };
    };

    local_include_dirs = ["include"];
    export_include_dirs = ["include"];

    stl = "none";
    system_shared_libs = ["libc"];
};

libselinux = cc_library {
    name = "libselinux";
    defaults = ["libselinux_defaults"];

    recovery_available = true;

    host_supported = true;
    cflags = ["-DUSE_PCRE2"];

    srcs = [
        "src/label_file.c"
        "src/regex.c"
    ];

    target = {
        linux_glibc = {
            srcs = [
                "src/android/android_host.c"
                "src/avc.c"
                "src/avc_internal.c"
                "src/avc_sidtab.c"
                "src/compute_av.c"
                "src/compute_create.c"
                "src/compute_member.c"
                "src/context.c"
                "src/deny_unknown.c"
                "src/enabled.c"
                "src/fgetfilecon.c"
                "src/getenforce.c"
                "src/getfilecon.c"
                "src/get_initial_context.c"
                "src/init.c"
                "src/lgetfilecon.c"
                "src/load_policy.c"
                "src/lsetfilecon.c"
                "src/mapping.c"
                "src/procattr.c"
                "src/reject_unknown.c"
                "src/setenforce.c"
                "src/setexecfilecon.c"
                "src/setfilecon.c"
                "src/stringrep.c"
            ];
        };
        linux_bionic = {
            enabled = true;
            srcs = [
                "src/android/android_host.c"
                "src/avc.c"
                "src/avc_internal.c"
                "src/avc_sidtab.c"
                "src/compute_av.c"
                "src/compute_create.c"
                "src/compute_member.c"
                "src/context.c"
                "src/deny_unknown.c"
                "src/enabled.c"
                "src/getenforce.c"
                "src/getfilecon.c"
                "src/get_initial_context.c"
                "src/init.c"
                "src/load_policy.c"
                "src/mapping.c"
                "src/procattr.c"
                "src/reject_unknown.c"
                "src/setexecfilecon.c"
                "src/stringrep.c"
            ];
        };

        android = {
            srcs = [
                "src/android/android_platform.c"
            ];

            static = {
                whole_static_libs = ["libpackagelistparser"];
            };

            shared = {
                shared_libs = ["libpackagelistparser"];
            };

            version_script = "exported.map";
        };

        vendor = {
            exclude_srcs = [
                "src/android/android_platform.c"
            ];
            srcs = [
                "src/android/android_vendor.c"
            ];
            cflags = ["-DNO_FILE_BACKEND"];
            exclude_shared_libs = ["libpackagelistparser"];
            exclude_static_libs = ["libpackagelistparser"];
            version_script = "exported_vendor.map";
        };
    };

    static = {
        whole_static_libs = ["libpcre2"];
    };
    shared = {
        shared_libs = ["libpcre2"];
    };

    stubs = {
        symbol_file = "exported.map";
        versions = ["30"];
    };
};

sefcontext_compile = cc_binary_host {
    name = "sefcontext_compile";
    defaults = ["libselinux_defaults"];
    cflags = ["-DUSE_PCRE2"];
    srcs = ["utils/sefcontext_compile.c"];

    static_libs = [
        "libselinux"
        "libsepol"
    ];
    whole_static_libs = ["libpcre2"];
};

in { inherit libselinux libselinux_defaults sefcontext_compile; }
