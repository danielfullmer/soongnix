{ cc_library_headers, ndk_headers }:
let

libandroid_headers = ndk_headers {
    name = "libandroid_headers";
    from = "include/android";
    to = "android";
    srcs = ["include/android/**/*.h"];
    license = "NOTICE";
};

subdirs = [
    "cmds/*"
    "headers"
    "libs/*"
    "opengl"
    "services/*"
    "vulkan"
];

libandroid_sensor_headers = cc_library_headers {
    name = "libandroid_sensor_headers";
    vendor = true;
    export_include_dirs = ["include_sensor"];
};

in { inherit libandroid_headers libandroid_sensor_headers; }
