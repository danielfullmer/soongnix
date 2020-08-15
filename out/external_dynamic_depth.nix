{ cc_defaults, cc_library, cc_library_headers, cc_library_static }:
let

libdynamic_depth-defaults = cc_defaults {
    name = "libdynamic_depth-defaults";
    cflags = [
        "-DUNIX_ENV=1"
        "-Werror"
        "-Wno-reorder"
        "-Wno-unused-parameter"
        "-Wno-ignored-qualifiers"
        "-Wno-macro-redefined"
    ];
    rtti = true;
    cppflags = ["-fno-exceptions"];
    clang = true;
    sanitize = {
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
    };
    target = {
        darwin = {
            enabled = false;
        };
    };
};

libdynamic_depth-public_headers = cc_library_headers {
    name = "libdynamic_depth-public_headers";
    export_include_dirs = ["includes"];
};

libdynamic_depth-internal_headers = cc_library_headers {
    name = "libdynamic_depth-internal_headers";
    export_include_dirs = ["internal"];
};

libdynamic_depth = cc_library {
    name = "libdynamic_depth";
    defaults = ["libdynamic_depth-defaults"];
    vendor_available = false;
    header_libs = [
        "libdynamic_depth-public_headers"
        "libdynamic_depth-internal_headers"
    ];
    srcs = [
        "internal/dynamic_depth/app_info.cc"
        "internal/dynamic_depth/camera.cc"
        "internal/dynamic_depth/cameras.cc"
        "internal/dynamic_depth/const.cc"
        "internal/dynamic_depth/container.cc"
        "internal/dynamic_depth/depth_jpeg.cc"
        "internal/dynamic_depth/depth_map.cc"
        "internal/dynamic_depth/device.cc"
        "internal/dynamic_depth/dynamic_depth.cc"
        "internal/dynamic_depth/earth_pose.cc"
        "internal/dynamic_depth/image.cc"
        "internal/dynamic_depth/imaging_model.cc"
        "internal/dynamic_depth/item.cc"
        "internal/dynamic_depth/light_estimate.cc"
        "internal/dynamic_depth/plane.cc"
        "internal/dynamic_depth/planes.cc"
        "internal/dynamic_depth/point_cloud.cc"
        "internal/dynamic_depth/pose.cc"
        "internal/dynamic_depth/profile.cc"
        "internal/dynamic_depth/profiles.cc"
        "internal/dynamic_depth/vendor_info.cc"
        "internal/strings/ascii_ctype.cc"
        "internal/strings/case.cc"
        "internal/strings/escaping.cc"
        "internal/strings/numbers.cc"
        "internal/xmpmeta/base64.cc"
        "internal/xmpmeta/file.cc"
        "internal/xmpmeta/jpeg_io.cc"
        "internal/xmpmeta/md5.cc"
        "internal/xmpmeta/xmp_const.cc"
        "internal/xmpmeta/xmp_data.cc"
        "internal/xmpmeta/xmp_parser.cc"
        "internal/xmpmeta/xmp_writer.cc"
        "internal/xmpmeta/xml/const.cc"
        "internal/xmpmeta/xml/deserializer_impl.cc"
        "internal/xmpmeta/xml/search.cc"
        "internal/xmpmeta/xml/serializer_impl.cc"
        "internal/xmpmeta/xml/utils.cc"
    ];
    shared_libs = [
        "libbase"
        "libimage_io"
        "libxml2"
    ];
};

libdynamic_depth_ndk = cc_library_static {
    name = "libdynamic_depth_ndk";
    defaults = ["libdynamic_depth-defaults"];
    vendor_available = false;
    export_include_dirs = [
        "includes"
        "internal"
    ];
    srcs = [
        "internal/dynamic_depth/app_info.cc"
        "internal/dynamic_depth/camera.cc"
        "internal/dynamic_depth/cameras.cc"
        "internal/dynamic_depth/const.cc"
        "internal/dynamic_depth/container.cc"
        "internal/dynamic_depth/depth_jpeg.cc"
        "internal/dynamic_depth/depth_map.cc"
        "internal/dynamic_depth/device.cc"
        "internal/dynamic_depth/dynamic_depth.cc"
        "internal/dynamic_depth/earth_pose.cc"
        "internal/dynamic_depth/image.cc"
        "internal/dynamic_depth/imaging_model.cc"
        "internal/dynamic_depth/item.cc"
        "internal/dynamic_depth/light_estimate.cc"
        "internal/dynamic_depth/plane.cc"
        "internal/dynamic_depth/planes.cc"
        "internal/dynamic_depth/point_cloud.cc"
        "internal/dynamic_depth/pose.cc"
        "internal/dynamic_depth/profile.cc"
        "internal/dynamic_depth/profiles.cc"
        "internal/dynamic_depth/vendor_info.cc"
        "internal/strings/ascii_ctype.cc"
        "internal/strings/case.cc"
        "internal/strings/escaping.cc"
        "internal/strings/numbers.cc"
        "internal/xmpmeta/base64.cc"
        "internal/xmpmeta/file.cc"
        "internal/xmpmeta/jpeg_io.cc"
        "internal/xmpmeta/md5.cc"
        "internal/xmpmeta/xmp_const.cc"
        "internal/xmpmeta/xmp_data.cc"
        "internal/xmpmeta/xmp_parser.cc"
        "internal/xmpmeta/xmp_writer.cc"
        "internal/xmpmeta/xml/const.cc"
        "internal/xmpmeta/xml/deserializer_impl.cc"
        "internal/xmpmeta/xml/search.cc"
        "internal/xmpmeta/xml/serializer_impl.cc"
        "internal/xmpmeta/xml/utils.cc"
    ];
    shared_libs = [
        "liblog"
    ];
    static_libs = [
        "libimage_io_ndk"
        "libbase_ndk"
        "libxml2_ndk"
    ];
    cflags = [
        "-fvisibility=hidden"
        "-DSTATIC_LIBXML=1"
    ];
    sdk_version = "current";
    stl = "c++_static";
};

in { inherit libdynamic_depth libdynamic_depth-defaults libdynamic_depth-internal_headers libdynamic_depth-public_headers libdynamic_depth_ndk; }
