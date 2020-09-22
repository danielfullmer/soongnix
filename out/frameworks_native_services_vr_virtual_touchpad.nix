{ cc_binary, cc_library, cc_test, filegroup }:
let



#  Touchpad implementation.

src = [
    "EvdevInjector.cpp"
    "VirtualTouchpadEvdev.cpp"
];

shared_libs = [
    "libbase"
    "liblog"
    "libutils"
];

header_libraries = [
    "libdvr_headers"
];

libvirtualtouchpad = cc_library {
    srcs = src;
    export_include_dirs = ["include"];
    shared_libs = shared_libs;
    header_libs = header_libraries;
    cflags = [
        "-DLOG_TAG=\"VrVirtualTouchpad\""
        "-Wall"
        "-Werror"
    ];
    name = "libvirtualtouchpad";
};

#  Touchpad unit tests.

test_static_libs = [
    "libcutils"
    "libvirtualtouchpad"
    "libbase"
    "liblog"
    "libutils"
];

test_src_files = ["tests/VirtualTouchpad_test.cpp"];

VirtualTouchpad_test = cc_test {
    srcs = test_src_files;
    static_libs = test_static_libs;
    header_libs = header_libraries;
    cflags = [
        "-Wall"
        "-Werror"
    ];
    host_ldlibs = [
        "-llog"
    ];
    name = "VirtualTouchpad_test";
    stl = "libc++_static";
};

#  Service.

service_src = [
    "main.cpp"
    "VirtualTouchpadService.cpp"
    ":virtualtouchpad_aidl"
];

service_static_libs = [
    "libcutils"
    "libvirtualtouchpad"
];

service_shared_libs = [
    "libbase"
    "libbinder"
    "liblog"
    "libutils"
];

virtual_touchpad = cc_binary {
    srcs = service_src;
    static_libs = service_static_libs;
    shared_libs = service_shared_libs;
    header_libs = header_libraries;
    cflags = [
        "-DLOG_TAG=\"VrVirtualTouchpad\""
        "-Wall"
        "-Werror"
    ];
    host_ldlibs = ["-llog"];
    name = "virtual_touchpad";
    init_rc = ["virtual_touchpad.rc"];
    compile_multilib = "64";
    stl = "libc++_static";
};

#  Touchpad client library.

client_src = [
    "VirtualTouchpadClient.cpp"
    "DvrVirtualTouchpadClient.cpp"
    ":virtualtouchpad_aidl"
];

client_shared_libs = [
    "libbase"
    "libbinder"
    "liblog"
    "libutils"
];

libvirtualtouchpadclient = cc_library {
    srcs = client_src;
    shared_libs = client_shared_libs;
    header_libs = header_libraries;
    cflags = [
        "-DLOG_TAG=\"VirtualTouchpadClient\""
        "-Wall"
        "-Werror"
    ];
    host_ldlibs = ["-llog"];
    name = "libvirtualtouchpadclient";
    export_include_dirs = ["include"];
};

virtualtouchpad_aidl = filegroup {
    name = "virtualtouchpad_aidl";
    srcs = ["aidl/android/dvr/IVirtualTouchpadService.aidl"];
    path = "aidl";
};

in { inherit VirtualTouchpad_test libvirtualtouchpad libvirtualtouchpadclient virtual_touchpad virtualtouchpad_aidl; }
