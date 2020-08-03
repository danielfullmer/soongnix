{ android_app }:
let

# ########################################################################
#  Test end-to-end latency.
# ########################################################################
TestLatency = android_app {
    name = "TestLatency";
    sdk_version = "8";
    srcs = ["**/*.java"];
};

in { inherit TestLatency; }
