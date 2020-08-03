{ cc_library_shared }:
let

# #####################################
#  Build shared library vendor/lib/libp61-jcop-kit.so

libp61-jcop-kit = cc_library_shared {
    name = "libp61-jcop-kit";
    proprietary = true;

    shared_libs = [
        "libcutils"
        "liblog"
        "libdl"
        "libhardware"
    ];
    cflags = [
        "-DNXP_LDR_SVC_VER_2=TRUE"
        "-Wall"
        #  "-Werror", // has multiple warnings with some asan-userdebug target
        "-Wno-format"
        "-Wno-parentheses-equality"
        "-Wno-tautological-constant-out-of-range-compare"
        "-Wno-unused-function"
        "-Wno-unused-parameter"
        "-Wno-unused-variable"
    ];
    export_include_dirs = [
        "include/"
        "inc/"
    ];
    srcs = [
        "src/AlaLib.cpp"
        "src/JcopOsDownload.cpp"
        "src/JcDnld.cpp"
        "src/Ala.cpp"
    ];

};

in { inherit libp61-jcop-kit; }
