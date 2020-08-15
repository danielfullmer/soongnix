{ android_app }:
let

ProxyHandler = android_app {
    name = "ProxyHandler";
    srcs = [
        "src/com/android/proxyhandler/ProxyServer.java"
        "src/com/android/proxyhandler/ProxyService.java"
        "src/com/android/proxyhandler/SocketConnect.java"
    ];
    platform_apis = true;
    certificate = "platform";
    privileged = true;
};

in { inherit ProxyHandler; }
