{ cc_library_host_static }:
let

libhostgraphics = cc_library_host_static {
    name = "libhostgraphics";

    cflags = [
        "-Wno-unused-parameter"
    ];

    srcs = [
        ":libui_host_common"
        "Fence.cpp"
        "HostBufferQueue.cpp"
        "PublicFormat.cpp"
    ];

    include_dirs = [
        #  Here we override all the headers automatically included with frameworks/native/include.
        #  When frameworks/native/include will be removed from the list of automatic includes.
        #  We will have to copy necessary headers with a pre-build step (generated headers).
        "."
        "frameworks/native/libs/nativebase/include"
        "frameworks/native/libs/nativewindow/include"
        "frameworks/native/libs/arect/include"
    ];
    export_include_dirs = ["."];

    target = {
        windows = {
            enabled = true;
        };
    };
};

in { inherit libhostgraphics; }
