{ cc_test }:
let

TfliteGeneratedNnapiTest = cc_test {
    name = "TfliteGeneratedNnapiTest";
    sdk_version = "current";
    srcs = [
        "generated_examples_zip_test.cc"
        "parse_testdata.cc"
        "tflite_driver.cc"
        "split.cc"
        "message.cc"
        "tokenize.cc"
    ];
    data = [
        "models.tar"
        "test_manifest.txt"
    ];
    include_dirs = [
        "external/flatbuffers/include"
        "external/tensorflow"
    ];
    cflags = [
        "-DPLATFORM_POSIX_ANDROID"
        "-Wall"
        "-Werror"
        "-Wextra"
        "-Wno-extern-c-compat"
        "-Wno-sign-compare"
        "-Wno-unused-parameter"
        "-Wno-unused-private-field"
    ];
    stl = "libc++_static";
    static_libs = [
        "libtflite_static"
        "libgmock_ndk"
    ];
    shared_libs = [
        "liblog"
    ];
};

in { inherit TfliteGeneratedNnapiTest; }
