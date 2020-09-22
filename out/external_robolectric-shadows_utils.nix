{ java_library_host, java_test_host }:
let

# #############################################
#  Compile Robolectric utils
# #############################################

Robolectric_utils = java_library_host {
    name = "Robolectric_utils";
    srcs = [
        "src/main/java/org/robolectric/AndroidMetadata.java"
        "src/main/java/org/robolectric/util/Clock.java"
        "src/main/java/org/robolectric/util/Consumer.java"
        "src/main/java/org/robolectric/util/Join.java"
        "src/main/java/org/robolectric/util/Logger.java"
        "src/main/java/org/robolectric/util/NamedStream.java"
        "src/main/java/org/robolectric/util/Pair.java"
        "src/main/java/org/robolectric/util/PerfStatsCollector.java"
        "src/main/java/org/robolectric/util/PerfStatsReporter.java"
        "src/main/java/org/robolectric/util/Scheduler.java"
        "src/main/java/org/robolectric/util/SimpleFuture.java"
        "src/main/java/org/robolectric/util/SoftThreadLocal.java"
        "src/main/java/org/robolectric/util/Strftime.java"
        "src/main/java/org/robolectric/util/TempDirectory.java"
        "src/main/java/org/robolectric/util/TestRunnable.java"
        "src/main/java/org/robolectric/util/TimeUtils.java"
        "src/main/java/org/robolectric/util/Util.java"
        "src/main/java/org/robolectric/util/package-info.java"
    ];
};

# #############################################
#  Compile Robolectric utils tests
# #############################################

Robolectric_utils_tests = java_test_host {
    name = "Robolectric_utils_tests";
    srcs = [
        "src/test/java/org/robolectric/util/PerfStatsCollectorTest.java"
        "src/test/java/org/robolectric/util/SchedulerTest.java"
        "src/test/java/org/robolectric/util/TempDirectoryTest.java"
    ];
    static_libs = [
        "Robolectric_utils"
        "hamcrest"
        "guava"
        "junit"
        "truth-prebuilt"
    ];
    test_suites = ["general-tests"];
};

in { inherit Robolectric_utils Robolectric_utils_tests; }
