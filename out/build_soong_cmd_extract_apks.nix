{ blueprint_go_binary, bootstrap_go_package }:
let

extract_apks = blueprint_go_binary {
    name = "extract_apks";
    srcs = ["main.go"];
    deps = [
        "android-archive-zip"
        "golang-protobuf-proto"
        "soong-cmd-extract_apks-proto"
    ];
    testSrcs = ["main_test.go"];
};

soong-cmd-extract_apks-proto = bootstrap_go_package {
    name = "soong-cmd-extract_apks-proto";
    pkgPath = "android/soong/cmd/extract_apks/bundle_proto";
    deps = ["golang-protobuf-proto"];
    srcs = [
        "bundle_proto/commands.pb.go"
        "bundle_proto/config.pb.go"
        "bundle_proto/targeting.pb.go"
    ];
};

in { inherit extract_apks soong-cmd-extract_apks-proto; }
