{ cc_binary, cc_library_static }:
let

libregistermsext = cc_library_static {
    name = "libregistermsext";
    srcs = ["register.cpp"];

    cflags = [
        "-Werror"
        "-Wall"
    ];
};

mediaserver = cc_binary {
    name = "mediaserver";

    srcs = ["main_mediaserver.cpp"];

    shared_libs = [
        "libresourcemanagerservice"
        "liblog"
        "libmediaplayerservice"
        "libutils"
        "libbinder"
        "libandroidicu"
        "android.hardware.media.omx@1.0"
    ];

    static_libs = [
        "libregistermsext"
    ];

    include_dirs = [
        "frameworks/av/media/libmediaplayerservice"
        "frameworks/av/services/mediaresourcemanager"
    ];

    #  back to 32-bit, b/126502613
    compile_multilib = "32";

    init_rc = ["mediaserver.rc"];

    cflags = [
        "-Werror"
        "-Wall"
    ];

    vintf_fragments = ["manifest_media_c2_software.xml"];
};

in { inherit libregistermsext mediaserver; }
