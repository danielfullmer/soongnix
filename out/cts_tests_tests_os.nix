{ android_test }:
let

#  Copyright (C) 2008 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

CtsOsTestCases = android_test {
    name = "CtsOsTestCases";
    defaults = ["cts_defaults"];
    compile_multilib = "both";
    static_libs = [
        "android.hidl.manager-V1.0-java"
        "androidx.test.core"
        "androidx.test.ext.junit"
        "androidx.test.rules"
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "truth-prebuilt"
        "guava"
        "junit"
        "CtsMockInputMethodLib"
    ];
    jni_uses_platform_apis = true;
    jni_libs = [
        "libcts_jni"
        "libctsos_jni"
        "libnativehelper_compat_libc++"
    ];
    srcs = [
        "src/android/os/cts/AbiTest.java"
        "src/android/os/cts/ActivityTestsBase.java"
        "src/android/os/cts/AliasActivityStub.java"
        "src/android/os/cts/AsyncTaskTest.java"
        "src/android/os/cts/BadParcelableExceptionTest.java"
        "src/android/os/cts/BinderTest.java"
        "src/android/os/cts/BuildTest.java"
        "src/android/os/cts/BuildVersionTest.java"
        "src/android/os/cts/BundleTest.java"
        "src/android/os/cts/ClearTop.java"
        "src/android/os/cts/ConditionVariableTest.java"
        "src/android/os/cts/CountDownTimerTest.java"
        "src/android/os/cts/CountDownTimerTestStub.java"
        "src/android/os/cts/CpuFeaturesTest.java"
        "src/android/os/cts/CpuInstructions.java"
        "src/android/os/cts/CpuInstructionsTest.java"
        "src/android/os/cts/CrossProcessExceptionService.java"
        "src/android/os/cts/CrossProcessExceptionTest.java"
        "src/android/os/cts/CtsRemoteService.java"
        "src/android/os/cts/CustomClassLoaderTest.java"
        "src/android/os/cts/CustomDexClassLoader.java"
        "src/android/os/cts/CustomPathClassLoader.java"
        "src/android/os/cts/DeadObjectExceptionTest.java"
        "src/android/os/cts/DebugTest.java"
        "src/android/os/cts/Debug_InstructionCountTest.java"
        "src/android/os/cts/EmptyService.java"
        "src/android/os/cts/EnvironmentTest.java"
        "src/android/os/cts/ExceptionalParcelable.java"
        "src/android/os/cts/FileAccessPermissionTest.java"
        "src/android/os/cts/FileObserverTest.java"
        "src/android/os/cts/FileUtilsTest.java"
        "src/android/os/cts/HandlerTest.java"
        "src/android/os/cts/HandlerThreadTest.java"
        "src/android/os/cts/HardwareName.java"
        "src/android/os/cts/HardwareNameTest.java"
        "src/android/os/cts/HidlMemoryTest.java"
        "src/android/os/cts/HwBinderTest.java"
        "src/android/os/cts/LaunchpadActivity.java"
        "src/android/os/cts/LimitExceededExceptionTest.java"
        "src/android/os/cts/LocalDialog.java"
        "src/android/os/cts/LocalScreen.java"
        "src/android/os/cts/LocalService.java"
        "src/android/os/cts/LocaleListTest.java"
        "src/android/os/cts/LooperTest.java"
        "src/android/os/cts/MemoryFileTest.java"
        "src/android/os/cts/MessageQueueTest.java"
        "src/android/os/cts/MessageTest.java"
        "src/android/os/cts/MessengerService.java"
        "src/android/os/cts/MessengerTest.java"
        "src/android/os/cts/NoExecutePermissionTest.java"
        "src/android/os/cts/OSFeatures.java"
        "src/android/os/cts/ParcelExceptionService.java"
        "src/android/os/cts/ParcelFileDescriptorPeer.java"
        "src/android/os/cts/ParcelFileDescriptorProcessTest.java"
        "src/android/os/cts/ParcelFileDescriptorTest.java"
        "src/android/os/cts/ParcelFileDescriptor_AutoCloseInputStreamTest.java"
        "src/android/os/cts/ParcelFileDescriptor_AutoCloseOutputStreamTest.java"
        "src/android/os/cts/ParcelFormatExceptionTest.java"
        "src/android/os/cts/ParcelTest.java"
        "src/android/os/cts/PatternMatcherTest.java"
        "src/android/os/cts/PersistableBundleTest.java"
        "src/android/os/cts/PowerManagerTest.java"
        "src/android/os/cts/PowerManager_ThermalTest.java"
        "src/android/os/cts/PowerManager_WakeLockTest.java"
        "src/android/os/cts/ProcessTest.java"
        "src/android/os/cts/RecoverySystemTest.java"
        "src/android/os/cts/RemoteCallbackListTest.java"
        "src/android/os/cts/RemoteExceptionTest.java"
        "src/android/os/cts/RequiredComponentsTest.java"
        "src/android/os/cts/ResultReceiverTest.java"
        "src/android/os/cts/SPMITest.java"
        "src/android/os/cts/SeccompTest.java"
        "src/android/os/cts/SecurityFeaturesTest.java"
        "src/android/os/cts/SecurityPatchTest.java"
        "src/android/os/cts/SharedMemoryService.java"
        "src/android/os/cts/SharedMemoryTest.java"
        "src/android/os/cts/SimpleTestActivity.java"
        "src/android/os/cts/StatFsTest.java"
        "src/android/os/cts/StrictModeTest.java"
        "src/android/os/cts/SystemClockTest.java"
        "src/android/os/cts/SystemConfigTest.java"
        "src/android/os/cts/TaggedPointer.java"
        "src/android/os/cts/TaggedPointerTest.java"
        "src/android/os/cts/TestClass.java"
        "src/android/os/cts/TestedScreen.java"
        "src/android/os/cts/TokenWatcherTest.java"
        "src/android/os/cts/UsbDebuggingTest.java"
        "src/android/os/cts/VibrationAttributesTest.java"
        "src/android/os/cts/VibrationEffectTest.java"
        "src/android/os/cts/VibratorTest.java"
        "src/android/os/cts/WorkSourceTest.java"
        "src/android/os/health/cts/HealthStatsTest.java"
        "src/android/os/health/cts/SystemHealthManagerTest.java"
        "src/android/os/health/cts/TimerStatTest.java"
        "src/android/os/image/cts/DynamicSystemClientTest.java"
        "src/android/os/storage/cts/CrateInfoTest.java"
        "src/android/os/storage/cts/StorageCrateTest.java"
        "src/android/os/storage/cts/StorageManagerTest.java"
        "src/android/os/storage/cts/StorageStatsManagerTest.java"
        "src/android/os/cts/AutoRevokeTest.kt"
        "src/android/os/cts/CompanionDeviceManagerTest.kt"
        "src/android/os/cts/IParcelFileDescriptorPeer.aidl"
        "src/android/os/cts/IEmptyService.aidl"
        "src/android/os/cts/ISeccompIsolatedService.aidl"
        "src/android/os/cts/ISecondary.aidl"
        "src/android/os/cts/ISharedMemoryService.aidl"
        "src/android/os/cts/IParcelExceptionService.aidl"
    ];
    #  Set its own test config to prevent sharing with cts-platform-version-check
    test_config = "CtsOsTestCases.xml";
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    #  Do not compress minijail policy files.
    aaptflags = ["-0 .policy"];
};

in { inherit CtsOsTestCases; }
