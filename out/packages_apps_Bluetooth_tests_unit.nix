{ android_test }:
let

BluetoothInstrumentationTests = android_test {
    name = "BluetoothInstrumentationTests";

    #  We only want this apk build for tests.
    certificate = "platform";

    libs = [
        "javax.obex"
        "android.test.runner"
        "telephony-common"
        "libprotobuf-java-micro"
        "android.test.base"
        "android.test.mock"
    ];

    static_libs = [
        "androidx.test.rules"
        "mockito-target"
        "androidx.test.espresso.intents"
        "gson-prebuilt-jar"
        "androidx.room_room-migration"
        "androidx.room_room-runtime"
        "androidx.room_room-testing"
    ];

    asset_dirs = ["src/com/android/bluetooth/btservice/storage/schemas"];

    #  Include all test java files.
    srcs = [
        "src/com/android/bluetooth/FileSystemWriteTest.java"
        "src/com/android/bluetooth/StateMachineTest.java"
        "src/com/android/bluetooth/TestUtils.java"
        "src/com/android/bluetooth/a2dp/A2dpCodecConfigTest.java"
        "src/com/android/bluetooth/a2dp/A2dpServiceTest.java"
        "src/com/android/bluetooth/a2dp/A2dpStateMachineTest.java"
        "src/com/android/bluetooth/a2dpsink/A2dpSinkServiceTest.java"
        "src/com/android/bluetooth/a2dpsink/A2dpSinkStreamHandlerTest.java"
        "src/com/android/bluetooth/avrcpcontroller/AvrcpControllerServiceTest.java"
        "src/com/android/bluetooth/avrcpcontroller/AvrcpControllerStateMachineTest.java"
        "src/com/android/bluetooth/avrcpcontroller/AvrcpCoverArtStorageTest.java"
        "src/com/android/bluetooth/avrcpcontroller/AvrcpItemTest.java"
        "src/com/android/bluetooth/avrcpcontroller/bip/BipAttachmentFormatTest.java"
        "src/com/android/bluetooth/avrcpcontroller/bip/BipDatetimeTest.java"
        "src/com/android/bluetooth/avrcpcontroller/bip/BipEncodingTest.java"
        "src/com/android/bluetooth/avrcpcontroller/bip/BipImageDescriptorTest.java"
        "src/com/android/bluetooth/avrcpcontroller/bip/BipImageFormatTest.java"
        "src/com/android/bluetooth/avrcpcontroller/bip/BipImagePropertiesTest.java"
        "src/com/android/bluetooth/avrcpcontroller/bip/BipImageTest.java"
        "src/com/android/bluetooth/avrcpcontroller/bip/BipPixelTest.java"
        "src/com/android/bluetooth/avrcpcontroller/bip/BipTransformationTest.java"
        "src/com/android/bluetooth/btservice/ActiveDeviceManagerTest.java"
        "src/com/android/bluetooth/btservice/AdapterServiceTest.java"
        "src/com/android/bluetooth/btservice/BondStateMachineTest.java"
        "src/com/android/bluetooth/btservice/MetricsLoggerTest.java"
        "src/com/android/bluetooth/btservice/PhonePolicyTest.java"
        "src/com/android/bluetooth/btservice/ProfileServiceTest.java"
        "src/com/android/bluetooth/btservice/RemoteDevicesTest.java"
        "src/com/android/bluetooth/btservice/SilenceDeviceManagerTest.java"
        "src/com/android/bluetooth/btservice/bluetoothKeystore/BluetoothKeystoreServiceTest.java"
        "src/com/android/bluetooth/btservice/storage/DatabaseManagerTest.java"
        "src/com/android/bluetooth/gatt/GattServiceTest.java"
        "src/com/android/bluetooth/hearingaid/HearingAidServiceTest.java"
        "src/com/android/bluetooth/hearingaid/HearingAidStateMachineTest.java"
        "src/com/android/bluetooth/hfp/HeadsetPhoneStateTest.java"
        "src/com/android/bluetooth/hfp/HeadsetServiceAndStateMachineTest.java"
        "src/com/android/bluetooth/hfp/HeadsetServiceTest.java"
        "src/com/android/bluetooth/hfp/HeadsetStateMachineTest.java"
        "src/com/android/bluetooth/hfp/HeadsetTestUtils.java"
        "src/com/android/bluetooth/hfpclient/HeadsetClientServiceTest.java"
        "src/com/android/bluetooth/hfpclient/HeadsetClientStateMachineTest.java"
        "src/com/android/bluetooth/hid/HidDeviceTest.java"
        "src/com/android/bluetooth/hid/HidHostServiceTest.java"
        "src/com/android/bluetooth/map/BluetoothMapContentObserverTest.java"
        "src/com/android/bluetooth/map/BluetoothMapServiceTest.java"
        "src/com/android/bluetooth/map/BluetoothMapbMessageMimeTest.java"
        "src/com/android/bluetooth/mapclient/BmessageTest.java"
        "src/com/android/bluetooth/mapclient/MapClientStateMachineTest.java"
        "src/com/android/bluetooth/mapclient/MapClientTest.java"
        "src/com/android/bluetooth/mapclient/ObexTimeTest.java"
        "src/com/android/bluetooth/newavrcp/BrowserPlayerWrapperTest.java"
        "src/com/android/bluetooth/newavrcp/MediaPlayerListTest.java"
        "src/com/android/bluetooth/newavrcp/MediaPlayerWrapperTest.java"
        "src/com/android/bluetooth/opp/BluetoothOppServiceTest.java"
        "src/com/android/bluetooth/pan/PanServiceTest.java"
        "src/com/android/bluetooth/pbap/BluetoothPbapServiceTest.java"
        "src/com/android/bluetooth/pbap/PbapStateMachineTest.java"
        "src/com/android/bluetooth/pbapclient/PbapClientServiceTest.java"
        "src/com/android/bluetooth/pbapclient/PbapParserTest.java"
        "src/com/android/bluetooth/sap/SapServiceTest.java"
    ];

    platform_apis = true;

    test_suites = ["device-tests"];

    instrumentation_for = "Bluetooth";

};

in { inherit BluetoothInstrumentationTests; }
