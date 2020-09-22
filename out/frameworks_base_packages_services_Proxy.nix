{ android_app, filegroup }:
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

ProxyHandler-aidl-sources = filegroup {
    name = "ProxyHandler-aidl-sources";
    srcs = [
        "src/com/android/net/IProxyCallback.aidl"
        "src/com/android/net/IProxyPortListener.aidl"
    ];
    path = "src";
};

in { inherit ProxyHandler ProxyHandler-aidl-sources; }
