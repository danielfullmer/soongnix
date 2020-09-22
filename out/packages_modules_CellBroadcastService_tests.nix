{ android_test }:
let

CellBroadcastServiceTests = android_test {
    name = "CellBroadcastServiceTests";
    static_libs = [
        "mockito-target"
        "compatibility-device-util-axt"
        "androidx.test.rules"
        "truth-prebuilt"
        "testables"
    ];
    libs = [
        "android.test.runner"
        "telephony-common"
        "android.test.base"
        "android.test.mock"
        "unsupportedappusage"
    ];
    srcs = [
        "src/com/android/cellbroadcastservice/tests/CbGeoUtilsTest.java"
        "src/com/android/cellbroadcastservice/tests/CdmaSmsMessageTest.java"
        "src/com/android/cellbroadcastservice/tests/CellBroadcastDatabaseHelperTest.java"
        "src/com/android/cellbroadcastservice/tests/CellBroadcastHandlerTest.java"
        "src/com/android/cellbroadcastservice/tests/CellBroadcastProviderTest.java"
        "src/com/android/cellbroadcastservice/tests/CellBroadcastProviderTestable.java"
        "src/com/android/cellbroadcastservice/tests/CellBroadcastServiceTestBase.java"
        "src/com/android/cellbroadcastservice/tests/GsmCellBroadcastHandlerTest.java"
        "src/com/android/cellbroadcastservice/tests/GsmSmsCbMessageTest.java"
        "src/com/android/cellbroadcastservice/tests/SmsHeaderTest.java"
        ":cellbroadcast-shared-srcs"
    ];
    platform_apis = true;
    test_suites = [
        "device-tests"
        "mts"
    ];
    certificate = "platform";
    instrumentation_for = "CellBroadcastServiceModule";
};

in { inherit CellBroadcastServiceTests; }
