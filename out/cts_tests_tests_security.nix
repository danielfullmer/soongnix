{ android_app_certificate, android_test, android_test_helper_app }:
let

#  Copyright (C) 2011 The Android Open Source Project
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

CtsSecurityTestCases = android_test {
    name = "CtsSecurityTestCases";
    defaults = ["cts_defaults"];
    #  Include both the 32 and 64 bit versions
    compile_multilib = "both";
    static_libs = [
        "androidx.test.rules"
        "android-common"
        "ctstestserver"
        "ctstestrunner-axt"
        "cts-install-lib"
        "compatibility-device-util-axt"
        "compatibility-common-util-devicesidelib"
        "guava"
        "platform-test-annotations"
    ];
    libs = [
        "android.test.runner.stubs"
        "org.apache.http.legacy"
        "android.test.base.stubs"
    ];
    java_resources = [
        ":PackageInstallerTestApp"
    ];
    jni_libs = [
        "libctssecurity_jni"
        "libcts_jni"
        "libnativehelper_compat_libc++"
        "libnativehelper"
        "libcutils"
        "libcrypto"
        "libselinux"
        "libc++"
        "libpcre2"
        "libpackagelistparser"
        "libcve_2019_2213_jni"
    ];
    srcs = [
        "src/android/security/cts/ARTBootASLRTest.java"
        "src/android/security/cts/ActivityManagerTest.java"
        "src/android/security/cts/AllocatePixelRefIntOverflowTest.java"
        "src/android/security/cts/AmbiguousBundlesTest.java"
        "src/android/security/cts/AslrTest.java"
        "src/android/security/cts/AssetManagerTest.java"
        "src/android/security/cts/AudioSecurityTest.java"
        "src/android/security/cts/BannedFilesTest.java"
        "src/android/security/cts/BigRleTest.java"
        "src/android/security/cts/BinderExploitTest.java"
        "src/android/security/cts/BitmapFactoryDecodeStreamTest.java"
        "src/android/security/cts/BitmapFactorySecurityTests.java"
        "src/android/security/cts/BitmapTest.java"
        "src/android/security/cts/BluetoothIntentsTest.java"
        "src/android/security/cts/CertBlacklistTest.java"
        "src/android/security/cts/CertificateData.java"
        "src/android/security/cts/CertificateTest.java"
        "src/android/security/cts/ConscryptIntermediateVerificationTest.java"
        "src/android/security/cts/DecodeTest.java"
        "src/android/security/cts/DeviceIdleControllerTest.java"
        "src/android/security/cts/EffectBundleTest.java"
        "src/android/security/cts/EncryptionTest.java"
        "src/android/security/cts/FileDescriptorTest.java"
        "src/android/security/cts/FileIntegrityManagerTest.java"
        "src/android/security/cts/HwRngTest.java"
        "src/android/security/cts/IBinderExchange.java"
        "src/android/security/cts/IntentSenderRemovalTest.java"
        "src/android/security/cts/IsolatedProcessTest.java"
        "src/android/security/cts/IsolatedService.java"
        "src/android/security/cts/KernelSettingsTest.java"
        "src/android/security/cts/LinuxRngTest.java"
        "src/android/security/cts/MMapExecutableTest.java"
        "src/android/security/cts/MediaMetadataRetrieverTest.java"
        "src/android/security/cts/MediaRecorderInfoLeakTest.java"
        "src/android/security/cts/MediaServerCrashTest.java"
        "src/android/security/cts/MotionEventTest.java"
        "src/android/security/cts/MotionEventTestActivity.java"
        "src/android/security/cts/Movie33897722.java"
        "src/android/security/cts/NanoAppBundleTest.java"
        "src/android/security/cts/NativeCodeTest.java"
        "src/android/security/cts/NetdTest.java"
        "src/android/security/cts/OutputConfigurationTest.java"
        "src/android/security/cts/PackageInstallerTest.java"
        "src/android/security/cts/PackageSignatureTest.java"
        "src/android/security/cts/PackageVerificationsBroadcastReceiver.java"
        "src/android/security/cts/ParcelableExceptionTest.java"
        "src/android/security/cts/PutOverflowTest.java"
        "src/android/security/cts/RenderTarget.java"
        "src/android/security/cts/RunningAppProcessInfoTest.java"
        "src/android/security/cts/STKFrameworkTest.java"
        "src/android/security/cts/ServicePermissionsTest.java"
        "src/android/security/cts/SkiaICORecursiveDecodingTest.java"
        "src/android/security/cts/SkiaJpegDecodingActivity.java"
        "src/android/security/cts/SkiaJpegDecodingTest.java"
        "src/android/security/cts/StagefrightTest.java"
        "src/android/security/cts/VerifiedBootTest.java"
        "src/android/security/cts/VisualizerEffectTest.java"
        "src/android/security/cts/VoldExploitTest.java"
        "src/android/security/cts/X509CertChainBuildingTest.java"
        "src/android/security/cts/ZeroHeightTiffTest.java"
        "src/android/security/cts/activity/SecureRandomService.java"
        "src/android/security/cts/activity/ISecureRandomService.aidl"
        "aidl/android/security/cts/IIsolatedService.aidl"
    ];
    # sdk_version: "current",
    platform_apis = true;
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
        "sts"
    ];
    certificate = ":security_cts_test_certificate";
};

PackageInstallerTestApp = android_test_helper_app {
    name = "PackageInstallerTestApp";
    srcs = ["testdata/src/android/security/cts/packageinstallertestapp/MainActivity.java"];
    manifest = "testdata/packageinstallertestapp.xml";
};

security_cts_test_certificate = android_app_certificate {
    name = "security_cts_test_certificate";
    certificate = "security_cts_test_cert";
};

in { inherit CtsSecurityTestCases PackageInstallerTestApp security_cts_test_certificate; }
