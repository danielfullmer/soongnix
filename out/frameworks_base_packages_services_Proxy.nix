{ android_app }:
let

ProxyHandler = android_app {
    name = "ProxyHandler";
    srcs = ["src/**/*.java"];
    platform_apis = true;
    certificate = "platform";
    privileged = true;
};

in { inherit ProxyHandler; }
