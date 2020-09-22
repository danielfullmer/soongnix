{ filegroup, java_test_host }:
let

#  Copyright (C) 2009 The Android Open Source Project
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

CtsAppSecurityHostTestCases = java_test_host {
    name = "CtsAppSecurityHostTestCases";
    defaults = ["cts_defaults"];

    #  Only compile source java files in this apk.
    srcs = [
        "src/android/appsecurity/cts/AccessSerialNumberTest.java"
        "src/android/appsecurity/cts/AdoptableHostTest.java"
        "src/android/appsecurity/cts/ApexSignatureVerificationTest.java"
        "src/android/appsecurity/cts/ApkVerityInstallTest.java"
        "src/android/appsecurity/cts/AppDataIsolationTests.java"
        "src/android/appsecurity/cts/AppOpsTest.java"
        "src/android/appsecurity/cts/AppSecurityPreparer.java"
        "src/android/appsecurity/cts/AppSecurityTests.java"
        "src/android/appsecurity/cts/ApplicationVisibilityTest.java"
        "src/android/appsecurity/cts/AuthBoundKeyTest.java"
        "src/android/appsecurity/cts/BaseAppSecurityTest.java"
        "src/android/appsecurity/cts/BaseInstallMultiple.java"
        "src/android/appsecurity/cts/CorruptApkTests.java"
        "src/android/appsecurity/cts/DeviceIdentifierTest.java"
        "src/android/appsecurity/cts/DirectBootHostTest.java"
        "src/android/appsecurity/cts/DocumentsTest.java"
        "src/android/appsecurity/cts/DocumentsTestCase.java"
        "src/android/appsecurity/cts/EphemeralTest.java"
        "src/android/appsecurity/cts/ExceptionUtils.java"
        "src/android/appsecurity/cts/ExternalStorageHostTest.java"
        "src/android/appsecurity/cts/InstantAppUserTest.java"
        "src/android/appsecurity/cts/InstantCookieHostTest.java"
        "src/android/appsecurity/cts/IsolatedSplitsTests.java"
        "src/android/appsecurity/cts/KeySetHostTest.java"
        "src/android/appsecurity/cts/ListeningPortsTest.java"
        "src/android/appsecurity/cts/LocationPolicyTest.java"
        "src/android/appsecurity/cts/LockScreenInspector.java"
        "src/android/appsecurity/cts/MajorVersionTest.java"
        "src/android/appsecurity/cts/MatcherUtils.java"
        "src/android/appsecurity/cts/NormalizeScreenStateRule.java"
        "src/android/appsecurity/cts/OverlayHostTest.java"
        "src/android/appsecurity/cts/PackageResolutionHostTest.java"
        "src/android/appsecurity/cts/PackageVisibilityTest.java"
        "src/android/appsecurity/cts/PkgInstallSignatureVerificationTest.java"
        "src/android/appsecurity/cts/PrivilegedUpdateTests.java"
        "src/android/appsecurity/cts/ResumeOnRebootHostTest.java"
        "src/android/appsecurity/cts/ScopedDirectoryAccessTest.java"
        "src/android/appsecurity/cts/SessionReferrerUriTest.java"
        "src/android/appsecurity/cts/SharedUserIdTest.java"
        "src/android/appsecurity/cts/SplitTests.java"
        "src/android/appsecurity/cts/StorageHostTest.java"
        "src/android/appsecurity/cts/ThrowingRunnable.java"
        "src/android/appsecurity/cts/UseEmbeddedDexTest.java"
        "src/android/appsecurity/cts/UseProcessTest.java"
        "src/android/appsecurity/cts/Utils.java"
        "src/android/appsecurity/cts/PackageSetInstallerTest.kt"
    ];

    libs = [
        "cts-tradefed"
        "tradefed"
        "compatibility-host-util"
        "truth-prebuilt"
        "hamcrest-library"
    ];

    static_libs = [
        "CompatChangeGatingTestBase"
        "CtsPkgInstallerConstants"
        "cts-host-utils"
    ];

    java_resource_dirs = ["res"];

    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
        "mts"
        "sts"
    ];

    required = [
        "CtsCorruptApkTests_b71360999"
        "CtsCorruptApkTests_b71361168"
        "CtsCorruptApkTests_b79488511"
        "CtsCorruptApkTests_Compressed_Q"
        "CtsCorruptApkTests_Compressed_R"
        "CtsCorruptApkTests_Unaligned_Q"
        "CtsCorruptApkTests_Unaligned_R"
    ];

    #  Prebuilts of all ABIs.
    data = [":CtsApkVerityTestPrebuiltFiles"];
};

CtsHostsideTestsAppSecurityUtil = filegroup {
    name = "CtsHostsideTestsAppSecurityUtil";
    srcs = ["src/android/appsecurity/cts/Utils.java"];
};

in { inherit CtsAppSecurityHostTestCases CtsHostsideTestsAppSecurityUtil; }
