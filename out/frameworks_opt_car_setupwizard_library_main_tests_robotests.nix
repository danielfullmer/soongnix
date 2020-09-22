{ android_app, android_robolectric_test }:
let

# ##############################################################
#  CarSetupWizardLib app just for Robolectric test target.     #
# ##############################################################
CarSetupWizardLib = android_app {
    name = "CarSetupWizardLib";

    resource_dirs = ["res"];

    platform_apis = true;

    privileged = true;

    libs = ["android.car"];

    static_libs = ["car-setup-wizard-lib"];
};

# ##############################################################
#  CarSetupWizardLib Robolectric test target.                  #
# ##############################################################
CarSetupWizardLibRoboTests = android_robolectric_test {
    name = "CarSetupWizardLibRoboTests";

    srcs = [
        "src/com/android/car/setupwizardlib/BaseCompatActivityTest.java"
        "src/com/android/car/setupwizardlib/BaseDesignActivityTest.java"
        "src/com/android/car/setupwizardlib/CarSetupWizardCompatLayoutTest.java"
        "src/com/android/car/setupwizardlib/CarSetupWizardDesignLayoutTest.java"
        "src/com/android/car/setupwizardlib/CarSetupWizardLayoutAlternativeActivity.java"
        "src/com/android/car/setupwizardlib/CarSetupWizardLayoutTestActivity.java"
        "src/com/android/car/setupwizardlib/partner/ExternalResources.java"
        "src/com/android/car/setupwizardlib/partner/FakeOverrideContentProvider.java"
        "src/com/android/car/setupwizardlib/partner/PartnerConfigHelperTest.java"
        "src/com/android/car/setupwizardlib/partner/ResourceEntryTest.java"
        "src/com/android/car/setupwizardlib/robolectric/BaseRobolectricTest.java"
        "src/com/android/car/setupwizardlib/robolectric/TestHelper.java"
        "src/com/android/car/setupwizardlib/shadows/ShadowCar.java"
        "src/com/android/car/setupwizardlib/util/CarDrivingStateMonitorTest.java"
        "src/com/android/car/setupwizardlib/util/CarSetupWizardUiUtilsTest.java"
        "src/com/android/car/setupwizardlib/util/CarWizardManagerHelperTest.java"
    ];

    java_resource_dirs = ["config"];

    libs = [
        "android.car"
    ];

    instrumentation_for = "CarSetupWizardLib";
};

in { inherit CarSetupWizardLib CarSetupWizardLibRoboTests; }
