{ cc_test }:
let

CtsNativeEncryptionTestCases = cc_test {
    name = "CtsNativeEncryptionTestCases";
    cflags = [
        "-Wall"
        "-Werror"
    ];
    srcs = [
        "FileBasedEncryptionPolicyTest.cpp"
    ];
    shared_libs = [
        "libbase"
        "libcutils"
    ];
    multilib = {
        lib32 = {
            suffix = "32";
        };
        lib64 = {
            suffix = "64";
        };
    };
    test_suites = [
        "cts"
    ];
};

in { inherit CtsNativeEncryptionTestCases; }
