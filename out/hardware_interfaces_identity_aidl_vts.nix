{ cc_test }:
let

VtsHalIdentityTargetTest = cc_test {
    name = "VtsHalIdentityTargetTest";
    defaults = [
        "VtsHalTargetTestDefaults"
        "use_libaidlvintf_gtest_helper_static"
    ];
    srcs = [
        "VtsHalIdentityEndToEndTest.cpp"
        "VtsIWritableIdentityCredentialTests.cpp"
        "VtsIdentityTestUtils.cpp"
        "VtsAttestationTests.cpp"
        "VtsAttestationParserSupport.cpp"
        "UserAuthTests.cpp"
        "ReaderAuthTests.cpp"
    ];
    shared_libs = [
        "libbinder"
        "libcrypto"
    ];
    static_libs = [
        "libcppbor"
        "libkeymaster_portable"
        "libsoft_attestation_cert"
        "libpuresoftkeymasterdevice"
        "android.hardware.keymaster@4.0"
        "android.hardware.identity-support-lib"
        "android.hardware.identity-cpp"
        "android.hardware.keymaster-cpp"
        "android.hardware.keymaster-ndk_platform"
    ];
    test_suites = [
        "general-tests"
        "vts"
    ];
};

in { inherit VtsHalIdentityTargetTest; }
