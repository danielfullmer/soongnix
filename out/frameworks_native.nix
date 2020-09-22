{ cc_library_headers, filegroup }:
let



subdirs = [
    "adbd_auth"
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

framework_native_aidl_binder = filegroup {
    name = "framework_native_aidl_binder";
    srcs = ["aidl/binder/android/os/PersistableBundle.aidl"];
    path = "aidl/binder";
    visibility = ["//frameworks/native"];
};

framework_native_aidl_gui = filegroup {
    name = "framework_native_aidl_gui";
    srcs = [
        "aidl/gui/android/view/LayerMetadataKey.aidl"
        "aidl/gui/android/view/Surface.aidl"
    ];
    path = "aidl/gui";
    visibility = ["//frameworks/native"];
};

framework_native_aidl = filegroup {
    name = "framework_native_aidl";
    srcs = [
        ":framework_native_aidl_binder"
        ":framework_native_aidl_gui"
    ];
};

in { inherit framework_native_aidl framework_native_aidl_binder framework_native_aidl_gui libandroid_sensor_headers; }
