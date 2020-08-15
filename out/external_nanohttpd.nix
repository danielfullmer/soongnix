{ java_library }:
let

#  This module target includes just the single core file: NanoHTTPD.java, which
#  is enough for HTTP 1.1 support and nothing else.
#  ============================================================================
libnanohttpd = java_library {
    name = "libnanohttpd";
    srcs = [
        "core/src/main/java/fi/iki/elonen/NanoHTTPD.java"
        "core/src/main/java/fi/iki/elonen/util/ServerRunner.java"
    ];
    sdk_version = "current";
};

#  This module target includes SimpleWebServer that supports additional functionality
#  such as serving files from a specified location, resume of downloads, etc.
#  ============================================================================
nanohttpd-webserver = java_library {
    name = "nanohttpd-webserver";
    srcs = [
        "core/src/main/java/fi/iki/elonen/NanoHTTPD.java"
        "core/src/main/java/fi/iki/elonen/util/ServerRunner.java"
        "webserver/src/main/java/fi/iki/elonen/InternalRewrite.java"
        "webserver/src/main/java/fi/iki/elonen/SimpleWebServer.java"
        "webserver/src/main/java/fi/iki/elonen/WebServerPlugin.java"
        "webserver/src/main/java/fi/iki/elonen/WebServerPluginInfo.java"
    ];
    sdk_version = "current";
};

in { inherit libnanohttpd nanohttpd-webserver; }
