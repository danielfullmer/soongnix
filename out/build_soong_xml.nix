{ bootstrap_go_package }:
let

soong-xml = bootstrap_go_package {
    name = "soong-xml";
    pkgPath = "android/soong/xml";
    deps = [
        "blueprint"
        "blueprint-pathtools"
        "soong"
        "soong-android"
        "soong-etc"
    ];
    srcs = [
        "xml.go"
    ];
    testSrcs = [
        "xml_test.go"
    ];
    pluginFor = ["soong_build"];
};

in { inherit soong-xml; }
