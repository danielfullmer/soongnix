{ android_app }:
let

# ########################################################################
#  Test end-to-end latency.
# ########################################################################
TestLatency = android_app {
    name = "TestLatency";
    sdk_version = "8";
    srcs = [
        "src/com/android/testlatency/TestLatencyActivity.java"
        "src/com/android/testlatency/TestLatencyView.java"
    ];
};

in { inherit TestLatency; }
