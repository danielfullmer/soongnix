{ cc_library_shared }:
let



libresourcemanagerservice = cc_library_shared {
    name = "libresourcemanagerservice";

    srcs = [
        "ResourceManagerService.cpp"
        "ServiceLog.cpp"
    ];

    shared_libs = [
        "libmedia"
        "libmediautils"
        "libbinder"
        "libbinder_ndk"
        "libutils"
        "liblog"
    ];

    include_dirs = ["frameworks/av/include"];

    cflags = [
        "-Werror"
        "-Wall"
    ];

    export_include_dirs = ["."];

};

in { inherit libresourcemanagerservice; }
