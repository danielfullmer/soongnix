{ cc_library_static }:
let

libFraunhoferAAC = cc_library_static {
    name = "libFraunhoferAAC";
    vendor_available = true;
    srcs = [
        "libAACdec/src/*.cpp"
        "libAACenc/src/*.cpp"
        "libPCMutils/src/*.cpp"
        "libFDK/src/*.cpp"
        "libSYS/src/*.cpp"
        "libMpegTPDec/src/*.cpp"
        "libMpegTPEnc/src/*.cpp"
        "libSBRdec/src/*.cpp"
        "libSBRenc/src/*.cpp"
        "libArithCoding/src/*.cpp"
        "libDRCdec/src/*.cpp"
        "libSACdec/src/*.cpp"
        "libSACenc/src/*.cpp"
    ];
    cflags = [
        "-Werror"
        "-Wno-unused-parameter"
        "-Wno-#warnings"
        "-Wuninitialized"
        "-Wno-self-assign"
        "-Wno-implicit-fallthrough"
    ];
    sanitize = {
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
            "bounds"
        ];
        #  Enable CFI if this becomes a shared library.
        #  cfi: true,
    };
    shared_libs = [
        "liblog"
    ];
    export_include_dirs = [
        "libAACdec/include"
        "libAACenc/include"
        "libPCMutils/include"
        "libFDK/include"
        "libSYS/include"
        "libMpegTPDec/include"
        "libMpegTPEnc/include"
        "libSBRdec/include"
        "libSBRenc/include"
        "libArithCoding/include"
        "libDRCdec/include"
        "libSACdec/include"
        "libSACenc/include"
    ];
};

in { inherit libFraunhoferAAC; }
