{ android_test, cc_test_library }:
let

libbionic_app_jni = cc_test_library {
    name = "libbionic_app_jni";
    sdk_version = "current";
    srcs = ["bionic_app_jni.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    header_libs = ["jni_headers"];
    strip = {
        none = true;
    };
    stl = "libc++_static";
};

CtsBionicAppTestCases = android_test {
    name = "CtsBionicAppTestCases";
    defaults = ["cts_defaults"];
    static_libs = ["ctstestrunner-axt"];
    srcs = ["com/android/bionic_app/BionicAppTest.java"];
    compile_multilib = "both";
    jni_libs = ["libbionic_app_jni"];
    manifest = "AndroidManifest.xml";
    sdk_version = "current";
    test_suites = [
        "cts"
        "vts10"
    ];
    use_embedded_native_libs = true;
};

in { inherit CtsBionicAppTestCases libbionic_app_jni; }
