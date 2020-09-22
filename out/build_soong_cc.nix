{ bootstrap_go_package }:
let

soong-cc = bootstrap_go_package {
    name = "soong-cc";
    pkgPath = "android/soong/cc";
    deps = [
        "blueprint"
        "blueprint-pathtools"
        "soong"
        "soong-android"
        "soong-cc-config"
        "soong-etc"
        "soong-genrule"
        "soong-tradefed"
    ];
    srcs = [
        "androidmk.go"
        "builder.go"
        "cc.go"
        "ccdeps.go"
        "check.go"
        "coverage.go"
        "gen.go"
        "linkable.go"
        "lto.go"
        "makevars.go"
        "pgo.go"
        "prebuilt.go"
        "proto.go"
        "rs.go"
        "sanitize.go"
        "sabi.go"
        "sdk.go"
        "snapshot_utils.go"
        "stl.go"
        "strip.go"
        "sysprop.go"
        "tidy.go"
        "util.go"
        "vendor_snapshot.go"
        "vndk.go"
        "vndk_prebuilt.go"

        "cflag_artifacts.go"
        "cmakelists.go"
        "compdb.go"
        "compiler.go"
        "installer.go"
        "linker.go"

        "binary.go"
        "binary_sdk_member.go"
        "fuzz.go"
        "library.go"
        "library_headers.go"
        "library_sdk_member.go"
        "object.go"
        "test.go"
        "toolchain_library.go"

        "ndk_prebuilt.go"
        "ndk_headers.go"
        "ndk_library.go"
        "ndk_sysroot.go"

        "llndk_library.go"

        "kernel_headers.go"

        "genrule.go"

        "vendor_public_library.go"

        "testing.go"
    ];
    testSrcs = [
        "cc_test.go"
        "compiler_test.go"
        "gen_test.go"
        "genrule_test.go"
        "library_headers_test.go"
        "library_test.go"
        "object_test.go"
        "prebuilt_test.go"
        "proto_test.go"
        "test_data_test.go"
    ];
    pluginFor = ["soong_build"];
};

in { inherit soong-cc; }
