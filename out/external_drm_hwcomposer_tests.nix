{ cc_test }:
let



hwc-drm-tests = cc_test {
    name = "hwc-drm-tests";

    srcs = ["worker_test.cpp"];

    vendor = true;
    header_libs = ["libhardware_headers"];
    static_libs = ["libdrmhwc_utils"];
    shared_libs = ["hwcomposer.drm"];
    include_dirs = ["external/drm_hwcomposer"];
};

in { inherit hwc-drm-tests; }
