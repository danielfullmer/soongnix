{ bootstrap_go_package }:
let

soong-rust = bootstrap_go_package {
    name = "soong-rust";
    pkgPath = "android/soong/rust";
    deps = [
        "soong"
        "soong-android"
        "soong-cc"
        "soong-rust-config"
    ];
    srcs = [
        "androidmk.go"
        "compiler.go"
        "binary.go"
        "builder.go"
        "library.go"
        "prebuilt.go"
        "proc_macro.go"
        "rust.go"
        "test.go"
        "testing.go"
    ];
    testSrcs = [
        "binary_test.go"
        "compiler_test.go"
        "library_test.go"
        "rust_test.go"
        "test_test.go"
    ];
    pluginFor = ["soong_build"];
};

in { inherit soong-rust; }