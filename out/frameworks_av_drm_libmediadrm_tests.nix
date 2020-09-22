{ cc_test }:
let

#  Build definitions for unit tests.

CounterMetric_test = cc_test {
    name = "CounterMetric_test";
    srcs = ["CounterMetric_test.cpp"];
    header_libs = [
        "libmedia_headers"
        "libmediametrics_headers"
    ];
    shared_libs = ["libmediadrm"];
    cflags = [
        "-Werror"
        "-Wall"
    ];
};

DrmMetrics_test = cc_test {
    name = "DrmMetrics_test";
    srcs = ["DrmMetrics_test.cpp"];
    header_libs = [
        "libmedia_headers"
    ];
    shared_libs = [
        "android.hardware.drm@1.0"
        "android.hardware.drm@1.1"
        "android.hardware.drm@1.2"
        "libbinder"
        "libhidlbase"
        "liblog"
        "libmediadrm"
        "libmediadrmmetrics_consumer"
        "libmediadrmmetrics_full"
        "libmediametrics"
        "libprotobuf-cpp-full"
        "libutils"
    ];
    static_libs = ["libgmock"];
    include_dirs = [
        "frameworks/av/drm/libmediadrm/include"
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
    header_libs = [
        "libmedia_headers"
        "libmediametrics_headers"
    ];
    shared_libs = [
        "liblog"
        "libmediadrm"
        "libutils"
    ];
    cflags = [
        "-Werror"
        "-Wall"
    ];
};

in { inherit CounterMetric_test DrmMetrics_test EventMetric_test; }
