{ cc_test }:
let

#  Build definitions for unit tests.

CounterMetric_test = cc_test {
    name = "CounterMetric_test";
    srcs = ["CounterMetric_test.cpp"];
    shared_libs = ["libmediadrm"];
    include_dirs = ["frameworks/av/include/media"];
    cflags = [
        "-Werror"
        "-Wall"
    ];
};

DrmMetrics_test = cc_test {
    name = "DrmMetrics_test";
    srcs = ["DrmMetrics_test.cpp"];
    shared_libs = [
        "android.hardware.drm@1.0"
        "android.hardware.drm@1.1"
        "android.hardware.drm@1.2"
        "libbinder"
        "libhidlbase"
        "liblog"
        "libmediadrmmetrics_full"
        "libmediametrics"
        "libprotobuf-cpp-full"
        "libutils"
    ];
    static_libs = ["libgmock"];
    include_dirs = [
        "frameworks/av/include/media"
    ];
    cflags = [
        #  Suppress unused parameter and no error options. These cause problems
        #  when using the map type in a proto definition.
        "-Wno-unused-parameter"
    ];
};

EventMetric_test = cc_test {
    name = "EventMetric_test";
    srcs = ["EventMetric_test.cpp"];
    shared_libs = [
        "liblog"
        "libmediadrm"
        "libutils"
    ];
    include_dirs = ["frameworks/av/include/media"];
    cflags = [
        "-Werror"
        "-Wall"
    ];
};

in { inherit CounterMetric_test DrmMetrics_test EventMetric_test; }
