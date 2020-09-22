{ cc_library, cc_library_headers }:
let

libprocessgroup_headers = cc_library_headers {
    name = "libprocessgroup_headers";
    vendor_available = true;
    recovery_available = true;
    host_supported = true;
    native_bridge_supported = true;
    export_include_dirs = ["include"];
    target = {
        linux_bionic = {
            enabled = true;
        };
        windows = {
            enabled = true;
        };
    };
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "29";
};

libprocessgroup = cc_library {
    srcs = [
        "cgroup_map.cpp"
        "processgroup.cpp"
        "sched_policy.cpp"
        "task_profiles.cpp"
    ];
    name = "libprocessgroup";
    host_supported = true;
    native_bridge_supported = true;
    recovery_available = true;
    vendor_available = true;
    vndk = {
        enabled = true;
        support_system_process = true;
    };
    shared_libs = [
        "libbase"
        "libcgrouprc"
    ];
    static_libs = [
        "libjsoncpp"
    ];
    #  for cutils/android_filesystem_config.h
    header_libs = [
        "libcutils_headers"
        "libprocessgroup_headers"
    ];
    export_include_dirs = ["include"];
    export_header_lib_headers = [
        "libprocessgroup_headers"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wexit-time-destructors"
    ];
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "29";
};

in { inherit libprocessgroup libprocessgroup_headers; }
