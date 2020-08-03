{ filegroup }:
let

webrtc_test_testsupport_fileutils = filegroup {
    name = "webrtc_test_testsupport_fileutils";
    srcs = ["testsupport/fileutils.cc"];
};

webrtc_test_testsupport_perf_test = filegroup {
    name = "webrtc_test_testsupport_perf_test";
    srcs = ["testsupport/perf_test.cc"];
};

in { inherit webrtc_test_testsupport_fileutils webrtc_test_testsupport_perf_test; }
