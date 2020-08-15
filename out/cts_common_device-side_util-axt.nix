{ java_library_static }:
let

#  Copyright (C) 2018 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

#  temporary compatibility-device-util variant that brings in androidx.test transitively, instead
#  of android.support.test target. Will be removed after androidx.test CTS conversion is complete.
compatibility-device-util-axt = java_library_static {
    name = "compatibility-device-util-axt";
    sdk_version = "test_current";

    srcs = [
        "src/com/android/compatibility/common/util/ActivitiesWatcher.java"
        "src/com/android/compatibility/common/util/ActivityLauncher.java"
        "src/com/android/compatibility/common/util/AdoptShellPermissionsRule.java"
        "src/com/android/compatibility/common/util/AmUtils.java"
        "src/com/android/compatibility/common/util/ApiLevelUtil.java"
        "src/com/android/compatibility/common/util/AppOpsUtils.java"
        "src/com/android/compatibility/common/util/AppStandbyUtils.java"
        "src/com/android/compatibility/common/util/BatteryUtils.java"
        "src/com/android/compatibility/common/util/BeforeAfterRule.java"
        "src/com/android/compatibility/common/util/BitmapUtils.java"
        "src/com/android/compatibility/common/util/BlockedNumberService.java"
        "src/com/android/compatibility/common/util/BlockedNumberUtil.java"
        "src/com/android/compatibility/common/util/BlockingBroadcastReceiver.java"
        "src/com/android/compatibility/common/util/BroadcastRpcBase.java"
        "src/com/android/compatibility/common/util/BroadcastTestBase.java"
        "src/com/android/compatibility/common/util/BroadcastTestStartActivity.java"
        "src/com/android/compatibility/common/util/BroadcastUtils.java"
        "src/com/android/compatibility/common/util/BundleUtils.java"
        "src/com/android/compatibility/common/util/BusinessLogicDeviceExecutor.java"
        "src/com/android/compatibility/common/util/BusinessLogicTestCase.java"
        "src/com/android/compatibility/common/util/CTSResult.java"
        "src/com/android/compatibility/common/util/CallbackAsserter.java"
        "src/com/android/compatibility/common/util/ColorUtils.java"
        "src/com/android/compatibility/common/util/ConnectivityUtils.java"
        "src/com/android/compatibility/common/util/CpuFeatures.java"
        "src/com/android/compatibility/common/util/CtsAndroidTestCase.java"
        "src/com/android/compatibility/common/util/CtsKeyEventUtil.java"
        "src/com/android/compatibility/common/util/CtsMockitoUtils.java"
        "src/com/android/compatibility/common/util/CtsMouseUtil.java"
        "src/com/android/compatibility/common/util/CtsTouchUtils.java"
        "src/com/android/compatibility/common/util/DeviceConfigStateChangerRule.java"
        "src/com/android/compatibility/common/util/DeviceConfigStateKeeperRule.java"
        "src/com/android/compatibility/common/util/DeviceConfigStateManager.java"
        "src/com/android/compatibility/common/util/DeviceInfoStore.java"
        "src/com/android/compatibility/common/util/DeviceReportLog.java"
        "src/com/android/compatibility/common/util/DoubleVisitor.java"
        "src/com/android/compatibility/common/util/DummyActivity.java"
        "src/com/android/compatibility/common/util/DynamicConfigDeviceSide.java"
        "src/com/android/compatibility/common/util/FakeKeys.java"
        "src/com/android/compatibility/common/util/FeatureUtil.java"
        "src/com/android/compatibility/common/util/FileCopyHelper.java"
        "src/com/android/compatibility/common/util/FileUtils.java"
        "src/com/android/compatibility/common/util/IBinderParcelable.java"
        "src/com/android/compatibility/common/util/ImeAwareEditText.java"
        "src/com/android/compatibility/common/util/LocationUtils.java"
        "src/com/android/compatibility/common/util/MediaPerfUtils.java"
        "src/com/android/compatibility/common/util/MediaUtils.java"
        "src/com/android/compatibility/common/util/MoreMatchers.java"
        "src/com/android/compatibility/common/util/NullWebViewUtils.java"
        "src/com/android/compatibility/common/util/OnFailureRule.java"
        "src/com/android/compatibility/common/util/OneTimeDeviceConfigListener.java"
        "src/com/android/compatibility/common/util/OneTimeSettingsListener.java"
        "src/com/android/compatibility/common/util/PackageUtil.java"
        "src/com/android/compatibility/common/util/ParcelUtils.java"
        "src/com/android/compatibility/common/util/PollingCheck.java"
        "src/com/android/compatibility/common/util/PropertyUtil.java"
        "src/com/android/compatibility/common/util/ReadElf.java"
        "src/com/android/compatibility/common/util/ReportLogDeviceInfoStore.java"
        "src/com/android/compatibility/common/util/RequiredFeatureRule.java"
        "src/com/android/compatibility/common/util/RequiredServiceRule.java"
        "src/com/android/compatibility/common/util/RequiredSystemResourceRule.java"
        "src/com/android/compatibility/common/util/Result.java"
        "src/com/android/compatibility/common/util/RetryRule.java"
        "src/com/android/compatibility/common/util/RetryableException.java"
        "src/com/android/compatibility/common/util/SafeCleanerRule.java"
        "src/com/android/compatibility/common/util/SettingsStateChangerRule.java"
        "src/com/android/compatibility/common/util/SettingsStateKeeperRule.java"
        "src/com/android/compatibility/common/util/SettingsStateManager.java"
        "src/com/android/compatibility/common/util/SettingsUtils.java"
        "src/com/android/compatibility/common/util/ShellIdentityUtils.java"
        "src/com/android/compatibility/common/util/ShellUtils.java"
        "src/com/android/compatibility/common/util/StateChangerRule.java"
        "src/com/android/compatibility/common/util/StateKeeperRule.java"
        "src/com/android/compatibility/common/util/StateManager.java"
        "src/com/android/compatibility/common/util/SystemUtil.java"
        "src/com/android/compatibility/common/util/TestNameUtils.java"
        "src/com/android/compatibility/common/util/TestThread.java"
        "src/com/android/compatibility/common/util/TestUtils.java"
        "src/com/android/compatibility/common/util/TextUtils.java"
        "src/com/android/compatibility/common/util/ThermalUtils.java"
        "src/com/android/compatibility/common/util/ThreadUtils.java"
        "src/com/android/compatibility/common/util/ThrowingRunnable.java"
        "src/com/android/compatibility/common/util/Timeout.java"
        "src/com/android/compatibility/common/util/Visitor.java"
        "src/com/android/compatibility/common/util/WatchDog.java"
        "src/com/android/compatibility/common/util/WidgetTestUtils.java"
        "src/com/android/compatibility/common/util/WifiConfigCreator.java"
        "src/com/android/compatibility/common/util/Within.java"
        "src/com/android/compatibility/common/util/devicepolicy/provisioning/SilentProvisioningTestManager.java"
        "src/com/android/compatibility/common/util/devicepolicy/provisioning/StartProvisioningActivity.java"
        "src/com/android/compatibility/common/util/mainline/MainlineModule.java"
        "src/com/android/compatibility/common/util/mainline/ModuleDetector.java"
        "src/com/android/compatibility/common/util/mainline/ModuleType.java"
        "src/com/android/compatibility/common/util/transition/TargetTracking.java"
        "src/com/android/compatibility/common/util/transition/TrackingTransition.java"
        "src/com/android/compatibility/common/util/transition/TrackingVisibility.java"
        "src/com/android/compatibility/common/util/devicepolicy/provisioning/IBooleanCallback.aidl"
    ];

    static_libs = [
        "compatibility-common-util-devicesidelib"
        "androidx.test.rules"
        "ub-uiautomator"
        "mockito-target-minus-junit4"
        "androidx.annotation_annotation"
        "truth-prebuilt"
    ];

    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];

    jarjar_rules = "protobuf-jarjar-rules.txt";
};

in { inherit compatibility-device-util-axt; }
