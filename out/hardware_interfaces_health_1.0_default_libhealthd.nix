{ cc_library_static }:
let

#  Copyright 2016 The Android Open Source Project

"libhealthd.default" = cc_library_static {
    srcs = ["healthd_board_default.cpp"];
    name = "libhealthd.default";
    vendor_available = true;
    recovery_available = true;
    cflags = ["-Werror"];
    include_dirs = ["system/core/base/include"];
    header_libs = ["libhealthd_headers"];
};

in { inherit "libhealthd.default"; }
