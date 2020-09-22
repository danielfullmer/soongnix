{ android_robolectric_test }:
let

# ############################################################
#  Car Dialer Robolectric test target.                       #
# ############################################################
CarDialerRoboTests = android_robolectric_test {
    name = "CarDialerRoboTests";

    srcs = [
        "src/com/android/car/dialer/CarDialerRobolectricTestRunner.java"
        "src/com/android/car/dialer/FragmentTestActivity.java"
        "src/com/android/car/dialer/LiveDataObserver.java"
        "src/com/android/car/dialer/ShadowTypeface.java"
        "src/com/android/car/dialer/TestDialerApplication.java"
        "src/com/android/car/dialer/TestFragment.java"
        "src/com/android/car/dialer/livedata/AudioRouteLiveDataTest.java"
        "src/com/android/car/dialer/livedata/BluetoothHfpStateLiveDataTest.java"
        "src/com/android/car/dialer/livedata/BluetoothPairListLiveDataTest.java"
        "src/com/android/car/dialer/livedata/BluetoothStateLiveDataTest.java"
        "src/com/android/car/dialer/livedata/CallDetailLiveDataTest.java"
        "src/com/android/car/dialer/livedata/CallStateLiveDataTest.java"
        "src/com/android/car/dialer/livedata/HeartBeatLiveDataTest.java"
        "src/com/android/car/dialer/telecom/InCallServiceImplTest.java"
        "src/com/android/car/dialer/telecom/ProjectionCallHandlerTest.java"
        "src/com/android/car/dialer/telecom/UiBluetoothMonitorTest.java"
        "src/com/android/car/dialer/telecom/UiCallManagerTest.java"
        "src/com/android/car/dialer/testutils/BroadcastReceiverVerifier.java"
        "src/com/android/car/dialer/testutils/ShadowAndroidViewModelFactory.java"
        "src/com/android/car/dialer/testutils/ShadowBluetoothAdapterForDialer.java"
        "src/com/android/car/dialer/testutils/ShadowCallLogCalls.java"
        "src/com/android/car/dialer/testutils/ShadowCar.java"
        "src/com/android/car/dialer/testutils/ShadowInMemoryPhoneBook.java"
        "src/com/android/car/dialer/testutils/ShadowServiceManagerOverride.java"
        "src/com/android/car/dialer/ui/TelecomActivityViewModelTest.java"
        "src/com/android/car/dialer/ui/activecall/InCallViewModelTest.java"
        "src/com/android/car/dialer/ui/activecall/IncomingCallFragmentTest.java"
        "src/com/android/car/dialer/ui/activecall/OnGoingCallControllerBarFragmentTest.java"
        "src/com/android/car/dialer/ui/activecall/OngoingCallFragmentTest.java"
        "src/com/android/car/dialer/ui/activecall/RingingCallControllerBarFragmentTest.java"
        "src/com/android/car/dialer/ui/calllog/CallHistoryFragmentTest.java"
        "src/com/android/car/dialer/ui/contact/ContactDetailsFragmentTest.java"
        "src/com/android/car/dialer/ui/contact/ContactListFragmentTest.java"
        "src/com/android/car/dialer/ui/contact/ContactListViewHolderTest.java"
        "src/com/android/car/dialer/ui/dialpad/DialpadFragmentTest.java"
        "src/com/android/car/dialer/ui/dialpad/InCallDialpadFragmentTest.java"
        "src/com/android/car/dialer/ui/favorite/FavoriteFragmentTest.java"
        "src/com/android/car/dialer/ui/search/ContactResultsFragmentTest.java"
        "src/com/android/car/dialer/ui/warning/NoHfpFragmentTest.java"
    ];

    java_resource_dirs = ["config"];

    #  Include the testing libraries
    libs = [
        "android.car"
    ];

    instrumentation_for = "CarDialerAppForTesting";
};

in { inherit CarDialerRoboTests; }
