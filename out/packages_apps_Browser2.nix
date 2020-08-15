{ android_app }:
let

Browser2 = android_app {
    name = "Browser2";
    sdk_version = "current";
    srcs = [
        "src/org/chromium/webview_shell/JankActivity.java"
        "src/org/chromium/webview_shell/StartupTimeActivity.java"
        "src/org/chromium/webview_shell/TelemetryActivity.java"
        "src/org/chromium/webview_shell/TelemetryMemoryPressureActivity.java"
        "src/org/chromium/webview_shell/WebViewAnimationTestActivity.java"
        "src/org/chromium/webview_shell/WebViewBrowserActivity.java"
    ];
    product_specific = true;
};

in { inherit Browser2; }
