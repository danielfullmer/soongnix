{ cc_library, cc_test }:
let

libtinyxml2 = cc_library {
    name = "libtinyxml2";
    host_supported = true;
    vendor_available = true;
    recovery_available = true;
    vndk = {
        enabled = true;
    };

    srcs = ["tinyxml2.cpp"];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-implicit-fallthrough"
        #  tinyxml2.cpp line 436, 441, 446 have -Wimplicit-fallthrough.
    ];

    shared_libs = ["liblog"];

    target = {
        android = {
            cflags = [
                #  LOG_TO_ANDROID_LOGCAT
                "-DDEBUG"
                "-DANDROID_NDK"
            ];
        };
    };

    export_include_dirs = ["."];
};

tinyxml2-tests = cc_test {
    name = "tinyxml2-tests";
    srcs = ["xmltest.cpp"];
    shared_libs = ["libtinyxml2"];
    data = [
        "resources/dream.xml"
        "resources/empty.xml"
        "resources/out/"
        "resources/utf8test.xml"
        "resources/utf8testverify.xml"
        "resources/xmltest-4636783552757760.xml"
        "resources/xmltest-5330.xml"
        "resources/xmltest-5662204197076992.xml"
        "resources/xmltest-5720541257269248.xml"
        "resources/out/readme.txt"
    ];
};

in { inherit libtinyxml2 tinyxml2-tests; }
