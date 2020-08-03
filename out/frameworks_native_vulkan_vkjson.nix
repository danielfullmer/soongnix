{ cc_library_static }:
let

libvkjson = cc_library_static {
    name = "libvkjson";
    srcs = [
        "vkjson.cc"
        "vkjson_instance.cc"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wimplicit-fallthrough"
    ];
    cppflags = [
        "-Wno-sign-compare"
    ];
    export_include_dirs = [
        "."
    ];
    whole_static_libs = [
        "libjsoncpp"
    ];
    header_libs = [
        "vulkan_headers"
    ];
};

libvkjson_ndk = cc_library_static {
    name = "libvkjson_ndk";
    clang = true;
    srcs = [
        "vkjson.cc"
        "vkjson_instance.cc"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wimplicit-fallthrough"
    ];
    cppflags = [
        "-Wno-sign-compare"
    ];
    export_include_dirs = [
        "."
    ];
    whole_static_libs = [
        "libjsoncpp_ndk"
    ];
    header_libs = [
        "vulkan_headers"
    ];
    sdk_version = "24";
    stl = "libc++_static";
};

in { inherit libvkjson libvkjson_ndk; }
