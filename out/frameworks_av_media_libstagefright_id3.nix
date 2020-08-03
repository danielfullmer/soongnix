{ cc_library_static, cc_test }:
let

libstagefright_id3 = cc_library_static {
    name = "libstagefright_id3";

    srcs = ["ID3.cpp"];

    header_libs = [
        "media_ndk_headers"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];
    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
        ];
        cfi = true;
    };
};

# ###############################################################################

testid3 = cc_test {
    name = "testid3";
    gtest = false;

    srcs = ["testid3.cpp"];

    cflags = [
        "-Werror"
        "-Wall"
    ];

    shared_libs = [
        "libstagefright"
        "libutils"
        "liblog"
        "libbinder"
        "libstagefright_foundation"
    ];

    static_libs = ["libstagefright_id3"];

    sanitize = {
        cfi = true;
    };

};

in { inherit libstagefright_id3 testid3; }
