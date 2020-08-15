{ java_library_host, java_test_host }:
let

powermodel = java_library_host {
    name = "powermodel";
    srcs = [
        "src/com/android/powermodel/ActivityReport.java"
        "src/com/android/powermodel/AppActivity.java"
        "src/com/android/powermodel/AppInfo.java"
        "src/com/android/powermodel/AppList.java"
        "src/com/android/powermodel/AppPower.java"
        "src/com/android/powermodel/AttributionKey.java"
        "src/com/android/powermodel/BatteryStatsReader.java"
        "src/com/android/powermodel/Component.java"
        "src/com/android/powermodel/ComponentActivity.java"
        "src/com/android/powermodel/ComponentPower.java"
        "src/com/android/powermodel/ComponentProfile.java"
        "src/com/android/powermodel/CsvParser.java"
        "src/com/android/powermodel/ParseException.java"
        "src/com/android/powermodel/PowerProfile.java"
        "src/com/android/powermodel/PowerReport.java"
        "src/com/android/powermodel/RawBatteryStats.java"
        "src/com/android/powermodel/SpecialApp.java"
        "src/com/android/powermodel/component/AudioProfile.java"
        "src/com/android/powermodel/component/BluetoothProfile.java"
        "src/com/android/powermodel/component/CameraProfile.java"
        "src/com/android/powermodel/component/CpuProfile.java"
        "src/com/android/powermodel/component/FlashlightProfile.java"
        "src/com/android/powermodel/component/GpsProfile.java"
        "src/com/android/powermodel/component/ModemAppActivity.java"
        "src/com/android/powermodel/component/ModemAppPower.java"
        "src/com/android/powermodel/component/ModemBatteryStatsReader.java"
        "src/com/android/powermodel/component/ModemGlobalActivity.java"
        "src/com/android/powermodel/component/ModemProfile.java"
        "src/com/android/powermodel/component/ModemRemainderActivity.java"
        "src/com/android/powermodel/component/ModemRemainderPower.java"
        "src/com/android/powermodel/component/ScreenProfile.java"
        "src/com/android/powermodel/component/VideoProfile.java"
        "src/com/android/powermodel/component/WifiProfile.java"
        "src/com/android/powermodel/util/Conversion.java"
    ];
    static_libs = [
        "guava"
    ];
};

powermodel-test = java_test_host {
    name = "powermodel-test";

    test_suites = ["general-tests"];

    srcs = [
        "test/com/android/powermodel/BatteryStatsReaderTest.java"
        "test/com/android/powermodel/CsvParserTest.java"
        "test/com/android/powermodel/PowerProfileTest.java"
        "test/com/android/powermodel/PowerReportTest.java"
        "test/com/android/powermodel/RawBatteryStatsTest.java"
    ];
    java_resource_dirs = ["test-resource"];

    static_libs = [
        "powermodel"
        "junit"
        "mockito"
    ];
};

in { inherit powermodel powermodel-test; }
