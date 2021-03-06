{ cc_library_static }:
let

#  Copyright 2011 The Android Open Source Project

libqemu_pipe = cc_library_static {
    name = "libqemu_pipe";
    vendor_available = true;
    recovery_available = true;
    sanitize = {
        misc_undefined = ["integer"];
    };
    srcs = ["qemu_pipe.cpp"];
    local_include_dirs = ["include"];
    static_libs = ["libbase"];
    export_include_dirs = ["include"];
    cflags = ["-Werror"];
};

in { inherit libqemu_pipe; }
