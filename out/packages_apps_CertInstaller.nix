{ android_app }:
let

CertInstaller = android_app {
    name = "CertInstaller";
    srcs = ["src/**/*.java"];
    platform_apis = true;
    certificate = "platform";
};

in { inherit CertInstaller; }
