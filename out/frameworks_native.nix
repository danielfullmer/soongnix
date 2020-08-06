{ cc_library_headers }:
let



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

in { inherit libandroid_sensor_headers; }
