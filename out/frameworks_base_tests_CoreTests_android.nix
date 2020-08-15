{ android_test }:
let

LegacyCoreTests = android_test {
    name = "LegacyCoreTests";
    srcs = [
        "core/HttpConstants.java"
        "core/HttpHeaderTest.java"
        "core/LowLevelNetRunner.java"
        "core/RequestAPITest.java"
        "core/TestEventHandler.java"
        "core/TestHttpClient.java"
        "core/TestWebData.java"
        "core/TestWebServer.java"
    ];
    libs = [
        "android.test.runner.stubs"
        "org.apache.http.legacy"
        "android.test.base.stubs"
    ];
    sdk_version = "current";
    static_libs = ["junit"];
};

in { inherit LegacyCoreTests; }
