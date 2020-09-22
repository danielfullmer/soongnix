{ filegroup }:
let

BluetoothOsSources_linux_generic = filegroup {
    name = "BluetoothOsSources_linux_generic";
    srcs = [
        "linux_generic/alarm.cc"
        "linux_generic/handler.cc"
        "linux_generic/reactor.cc"
        "linux_generic/repeating_alarm.cc"
        "linux_generic/reactive_semaphore.cc"
        "linux_generic/thread.cc"
    ];
};

BluetoothOsTestSources_linux_generic = filegroup {
    name = "BluetoothOsTestSources_linux_generic";
    srcs = [
        "linux_generic/alarm_unittest.cc"
        "linux_generic/handler_unittest.cc"
        "linux_generic/queue_unittest.cc"
        "linux_generic/reactor_unittest.cc"
        "linux_generic/repeating_alarm_unittest.cc"
        "linux_generic/thread_unittest.cc"
    ];
};

BluetoothOsBenchmarkSources = filegroup {
    name = "BluetoothOsBenchmarkSources";
    srcs = [
        "alarm_benchmark.cc"
        "thread_benchmark.cc"
        "queue_benchmark.cc"
    ];
};

in { inherit BluetoothOsBenchmarkSources BluetoothOsSources_linux_generic BluetoothOsTestSources_linux_generic; }
