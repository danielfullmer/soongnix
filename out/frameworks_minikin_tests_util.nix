{ cc_library_static }:
let

libminikin-tests-util = cc_library_static {
    name = "libminikin-tests-util";
    srcs = [
        "FileUtils.cpp"
        "FontTestUtils.cpp"
        "FreeTypeMinikinFontForTest.cpp"
        "PathUtils.cpp"
        "UnicodeUtils.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    export_include_dirs = ["."];
    shared_libs = [
        "libxml2"
        "libft2"
    ];
    static_libs = ["libminikin"];
    header_libs = ["libminikin-headers-for-tests"];
};

in { inherit libminikin-tests-util; }
