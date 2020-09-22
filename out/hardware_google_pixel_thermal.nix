{ cc_binary, sh_binary }:
let

"android.hardware.thermal@2.0-service.pixel" = cc_binary {
    name = "android.hardware.thermal@2.0-service.pixel";
    defaults = [
        "hidl_defaults"
    ];
    vendor = true;
    relative_install_path = "hw";
    vintf_fragments = ["android.hardware.thermal@2.0-service.pixel.xml"];
    init_rc = [
        "android.hardware.thermal@2.0-service.pixel.rc"
    ];
    srcs = [
        "service.cpp"
        "Thermal.cpp"
        "thermal-helper.cpp"
        "utils/config_parser.cpp"
        "utils/thermal_files.cpp"
        "utils/thermal_watcher.cpp"
    ];
    shared_libs = [
        "libbase"
        "libcutils"
        "libhidlbase"
        "libjsoncpp"
        "libutils"
        "android.hardware.thermal@1.0"
        "android.hardware.thermal@2.0"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
        "-Wunused"
    ];
    tidy = true;
    tidy_checks = [
        "android-*"
        "cert-*"
        "clang-analyzer-security*"
    ];
    tidy_flags = [
        "-warnings-as-errors=android-*,clang-analyzer-security*,cert-*"
    ];
};

thermal_logd = sh_binary {
    name = "thermal_logd";
    src = "init.thermal.logging.sh";
    vendor = true;
    init_rc = [
        "pixel-thermal-logd.rc"
    ];
};

in { inherit "android.hardware.thermal@2.0-service.pixel" thermal_logd; }
