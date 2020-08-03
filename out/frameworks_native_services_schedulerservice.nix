{ cc_library_shared }:
let

libschedulerservicehidl = cc_library_shared {
    name = "libschedulerservicehidl";
    srcs = [
        "SchedulingPolicyService.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
        "libmediautils"
        "liblog"
        "libutils"
        "android.frameworks.schedulerservice@1.0"
    ];
    header_libs = [
        "libcutils_headers"
    ];
    export_include_dirs = [
        "include/"
    ];
    local_include_dirs = [
        "include/schedulerservice/"
    ];
};

in { inherit libschedulerservicehidl; }
