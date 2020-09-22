{ android_test_helper_app, genrule, java_test_host, prebuilt_apex }:
let

#  Copyright (C) 2019 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

CtsStagedInstallHostTestCases = java_test_host {
    name = "CtsStagedInstallHostTestCases";
    defaults = ["cts_defaults"];

    srcs = [
        "src/com/android/tests/stagedinstall/host/ApexShimValidationTest.java"
        "src/com/android/tests/stagedinstall/host/StagedInstallTest.java"
    ];

    libs = [
        "cts-tradefed"
        "tradefed"
        "truth-prebuilt"
        "hamcrest"
        "hamcrest-library"
    ];

    data = [
        ":StagedInstallTest"
        ":deapexer.zip"
    ];

    test_suites = [
        "cts"
        "general-tests"
        "mts"
    ];
};

StagedInstallTest = android_test_helper_app {
    name = "StagedInstallTest";

    srcs = [
        "app/src/com/android/tests/stagedinstall/ApexShimValidationTest.java"
        "app/src/com/android/tests/stagedinstall/LauncherActivity.java"
        "app/src/com/android/tests/stagedinstall/PackageInstallerSessionInfoSubject.java"
        "app/src/com/android/tests/stagedinstall/SessionUpdateBroadcastReceiver.java"
        "app/src/com/android/tests/stagedinstall/StagedInstallTest.java"
    ];

    manifest = "app/AndroidManifest.xml";

    java_resources = [
        ":ApexKeyRotationTestV2_SignedBob"
        ":ApexKeyRotationTestV2_SignedBobRot"
        ":ApexKeyRotationTestV2_SignedBobRotRollback"
        ":ApexKeyRotationTestV3_SignedBob"
        ":ApexKeyRotationTestV3_SignedBobRot"
        ":StagedInstallTestApexV1_NotPreInstalled"
        ":StagedInstallTestApexV2_AdditionalFile"
        ":StagedInstallTestApexV2_AdditionalFolder"
        ":StagedInstallTestApexV2_DifferentCertificate"
        ":StagedInstallTestApexV2_DifferentPackageName"
        ":StagedInstallTestApexV2_NoHashtree"
        ":StagedInstallTestApexV2_WithPostInstallHook"
        ":StagedInstallTestApexV2_WithPreInstallHook"
        ":StagedInstallTestApexV2_WrongSha"
        ":StagedInstallTestApexV2_WithoutApkInApex"
        ":StagedInstallTestAppSamePackageNameAsApex"
        ":StagedInstallTestApexV2_SdkTargetP"
        ":StagedInstallTestApexV2_ApkInApexSdkTargetP"
        ":StagedInstallTestCorruptedApex_b146895998"
        ":StagedInstallTestApexV2_NoApkSignature"
        ":StagedInstallTestApexV2_UnsignedPayload"
    ];
    static_libs = [
        "androidx.test.runner"
        "androidx.test.core"
        "truth-prebuilt"
        "cts-install-lib"
    ];
    sdk_version = "test_current";
    test_suites = ["device-tests"];

};

StagedInstallTestAppSamePackageNameAsApex = android_test_helper_app {
    name = "StagedInstallTestAppSamePackageNameAsApex";

    srcs = ["testdata/apk/src/com/android/tests/stagedinstall/testapp/MainActivity.java"];

    manifest = "testdata/apk/StagedInstallTestAppSamePackageNameAsApex.xml";
};

ApexKeyRotationTestV2_SignedBob = prebuilt_apex {
    name = "ApexKeyRotationTestV2_SignedBob";
    arch = {
        arm = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2_signed_bob.apex";
        };
        arm64 = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2_signed_bob.apex";
        };
        x86 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2_signed_bob.apex";
        };
        x86_64 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2_signed_bob.apex";
        };
    };
    filename = "com.android.apex.cts.shim.v2_signed_bob.apex";
    installable = false;
};

ApexKeyRotationTestV2_SignedBobRot = prebuilt_apex {
    name = "ApexKeyRotationTestV2_SignedBobRot";
    arch = {
        arm = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2_signed_bob_rot.apex";
        };
        arm64 = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2_signed_bob_rot.apex";
        };
        x86 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2_signed_bob_rot.apex";
        };
        x86_64 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2_signed_bob_rot.apex";
        };
    };
    filename = "com.android.apex.cts.shim.v2_signed_bob_rot.apex";
    installable = false;
};

ApexKeyRotationTestV2_SignedBobRotRollback = prebuilt_apex {
    name = "ApexKeyRotationTestV2_SignedBobRotRollback";
    arch = {
        arm = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2_signed_bob_rot_rollback.apex";
        };
        arm64 = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2_signed_bob_rot_rollback.apex";
        };
        x86 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2_signed_bob_rot_rollback.apex";
        };
        x86_64 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2_signed_bob_rot_rollback.apex";
        };
    };
    filename = "com.android.apex.cts.shim.v2_signed_bob_rot_rollback.apex";
    installable = false;
};

ApexKeyRotationTestV3_SignedBob = prebuilt_apex {
    name = "ApexKeyRotationTestV3_SignedBob";
    arch = {
        arm = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v3_signed_bob.apex";
        };
        arm64 = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v3_signed_bob.apex";
        };
        x86 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v3_signed_bob.apex";
        };
        x86_64 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v3_signed_bob.apex";
        };
    };
    filename = "com.android.apex.cts.shim.v3_signed_bob.apex";
    installable = false;
};

ApexKeyRotationTestV3_SignedBobRot = prebuilt_apex {
    name = "ApexKeyRotationTestV3_SignedBobRot";
    arch = {
        arm = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v3_signed_bob_rot.apex";
        };
        arm64 = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v3_signed_bob_rot.apex";
        };
        x86 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v3_signed_bob_rot.apex";
        };
        x86_64 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v3_signed_bob_rot.apex";
        };
    };
    filename = "com.android.apex.cts.shim.v3_signed_bob_rot.apex";
    installable = false;
};

StagedInstallTestApexV1 = prebuilt_apex {
    name = "StagedInstallTestApexV1";
    arch = {
        arm = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v1.apex";
        };
        arm64 = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v1.apex";
        };
        x86 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v1.apex";
        };
        x86_64 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v1.apex";
        };
    };
    filename = "com.android.apex.cts.shim.v1.apex";
    installable = false;
};

StagedInstallTestApexV2 = prebuilt_apex {
    name = "StagedInstallTestApexV2";
    arch = {
        arm = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2.apex";
        };
        arm64 = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2.apex";
        };
        x86 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2.apex";
        };
        x86_64 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2.apex";
        };
    };
    filename = "com.android.apex.cts.shim.v2.apex";
    installable = false;
};

StagedInstallTestApexV3 = prebuilt_apex {
    name = "StagedInstallTestApexV3";
    arch = {
        arm = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v3.apex";
        };
        arm64 = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v3.apex";
        };
        x86 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v3.apex";
        };
        x86_64 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v3.apex";
        };
    };
    filename = "com.android.apex.cts.shim.v3.apex";
    installable = false;
};

StagedInstallTestApexV2_AdditionalFile = prebuilt_apex {
    name = "StagedInstallTestApexV2_AdditionalFile";
    arch = {
        arm = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2_additional_file.apex";
        };
        arm64 = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2_additional_file.apex";
        };
        x86 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2_additional_file.apex";
        };
        x86_64 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2_additional_file.apex";
        };
    };
    filename = "com.android.apex.cts.shim.v2_additional_file.apex";
    installable = false;
};

StagedInstallTestApexV2_AdditionalFolder = prebuilt_apex {
    name = "StagedInstallTestApexV2_AdditionalFolder";
    arch = {
        arm = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2_additional_folder.apex";
        };
        arm64 = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2_additional_folder.apex";
        };
        x86 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2_additional_folder.apex";
        };
        x86_64 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2_additional_folder.apex";
        };
    };
    filename = "com.android.apex.cts.shim.v2_additional_folder.apex";
    installable = false;
};

StagedInstallTestApexV2_WithPostInstallHook = prebuilt_apex {
    name = "StagedInstallTestApexV2_WithPostInstallHook";
    arch = {
        arm = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2_with_post_install_hook.apex";
        };
        arm64 = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2_with_post_install_hook.apex";
        };
        x86 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2_with_post_install_hook.apex";
        };
        x86_64 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2_with_post_install_hook.apex";
        };
    };
    filename = "com.android.apex.cts.shim.v2_with_post_install_hook.apex";
    installable = false;
};

StagedInstallTestApexV2_WithPreInstallHook = prebuilt_apex {
    name = "StagedInstallTestApexV2_WithPreInstallHook";
    arch = {
        arm = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2_with_pre_install_hook.apex";
        };
        arm64 = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2_with_pre_install_hook.apex";
        };
        x86 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2_with_pre_install_hook.apex";
        };
        x86_64 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2_with_pre_install_hook.apex";
        };
    };
    filename = "com.android.apex.cts.shim.v2_with_pre_install_hook.apex";
    installable = false;
};

StagedInstallTestApexV2_WrongSha = prebuilt_apex {
    name = "StagedInstallTestApexV2_WrongSha";
    arch = {
        arm = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2_wrong_sha.apex";
        };
        arm64 = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2_wrong_sha.apex";
        };
        x86 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2_wrong_sha.apex";
        };
        x86_64 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2_wrong_sha.apex";
        };
    };
    filename = "com.android.apex.cts.shim.v2_wrong_sha.apex";
    installable = false;
};

StagedInstallTestApexV2_WithoutApkInApex = prebuilt_apex {
    name = "StagedInstallTestApexV2_WithoutApkInApex";
    arch = {
        arm = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2_without_apk_in_apex.apex";
        };
        arm64 = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2_without_apk_in_apex.apex";
        };
        x86 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2_without_apk_in_apex.apex";
        };
        x86_64 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2_without_apk_in_apex.apex";
        };
    };
    filename = "com.android.apex.cts.shim.v2_without_apk_in_apex.apex";
    installable = false;
};

StagedInstallTestApexV1_NotPreInstalled = prebuilt_apex {
    name = "StagedInstallTestApexV1_NotPreInstalled";
    arch = {
        arm = {
            src = "testdata/apex/arm/com.android.apex.cts.shim_not_pre_installed.apex";
        };
        arm64 = {
            src = "testdata/apex/arm/com.android.apex.cts.shim_not_pre_installed.apex";
        };
        x86 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim_not_pre_installed.apex";
        };
        x86_64 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim_not_pre_installed.apex";
        };
    };
    filename = "com.android.apex.cts.shim_not_pre_installed.apex";
    installable = false;
};

StagedInstallTestApexV2_DifferentCertificate = prebuilt_apex {
    name = "StagedInstallTestApexV2_DifferentCertificate";
    arch = {
        arm = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2_different_certificate.apex";
        };
        arm64 = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2_different_certificate.apex";
        };
        x86 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2_different_certificate.apex";
        };
        x86_64 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2_different_certificate.apex";
        };
    };
    filename = "com.android.apex.cts.shim.v2_different_certificate.apex";
    installable = false;
};

StagedInstallTestApexV2_DifferentPackageName = prebuilt_apex {
    name = "StagedInstallTestApexV2_DifferentPackageName";
    arch = {
        arm = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2_different_package_name.apex";
        };
        arm64 = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2_different_package_name.apex";
        };
        x86 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2_different_package_name.apex";
        };
        x86_64 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2_different_package_name.apex";
        };
    };
    filename = "com.android.apex.cts.shim.v2_different_package_name.apex";
    installable = false;
};

StagedInstallTestApexV2_NoHashtree = prebuilt_apex {
    name = "StagedInstallTestApexV2_NoHashtree";
    arch = {
        arm = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2_no_hashtree.apex";
        };
        arm64 = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2_no_hashtree.apex";
        };
        x86 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2_no_hashtree.apex";
        };
        x86_64 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2_no_hashtree.apex";
        };
    };
    filename = "com.android.apex.cts.shim.v2_no_hashtree.apex";
    installable = false;
};

StagedInstallTestApexV2_SdkTargetP = prebuilt_apex {
    name = "StagedInstallTestApexV2_SdkTargetP";
    arch = {
        arm = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2_sdk_target_p.apex";
        };
        arm64 = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2_sdk_target_p.apex";
        };
        x86 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2_sdk_target_p.apex";
        };
        x86_64 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2_sdk_target_p.apex";
        };
    };
    filename = "com.android.apex.cts.shim.v2_sdk_target_p.apex";
    installable = false;
};

StagedInstallTestApexV2_ApkInApexSdkTargetP = prebuilt_apex {
    name = "StagedInstallTestApexV2_ApkInApexSdkTargetP";
    arch = {
        arm = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2_apk_in_apex_sdk_target_p.apex";
        };
        arm64 = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2_apk_in_apex_sdk_target_p.apex";
        };
        x86 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2_apk_in_apex_sdk_target_p.apex";
        };
        x86_64 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2_apk_in_apex_sdk_target_p.apex";
        };
    };
    filename = "com.android.apex.cts.shim.v2_apk_in_apex_sdk_target_p.apex";
    installable = false;
};

StagedInstallTestCorruptedApex_b146895998 = prebuilt_apex {
    name = "StagedInstallTestCorruptedApex_b146895998";
    src = "testdata/apex/corrupted_b146895998.apex";
    filename = "corrupted_b146895998.apex";
    installable = false;
};

StagedInstallTestApexV2_NoApkSignature = prebuilt_apex {
    name = "StagedInstallTestApexV2_NoApkSignature";
    arch = {
        arm = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2_unsigned_apk_container.apex";
        };
        arm64 = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2_unsigned_apk_container.apex";
        };
        x86 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2_unsigned_apk_container.apex";
        };
        x86_64 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2_unsigned_apk_container.apex";
        };
    };
    filename = "com.android.apex.cts.shim.v2_unsigned_apk_container.apex";
    installable = false;
};

StagedInstallTestApexV2_UnsignedPayload = prebuilt_apex {
    name = "StagedInstallTestApexV2_UnsignedPayload";
    arch = {
        arm = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2_unsigned_payload.apex";
        };
        arm64 = {
            src = "testdata/apex/arm/com.android.apex.cts.shim.v2_unsigned_payload.apex";
        };
        x86 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2_unsigned_payload.apex";
        };
        x86_64 = {
            src = "testdata/apex/x86/com.android.apex.cts.shim.v2_unsigned_payload.apex";
        };
    };
    filename = "com.android.apex.cts.shim.v2_unsigned_payload.apex";
    installable = false;
};

#  collects deapexer and its dependency modules (libc++ and debugfs_static) to the zip file.
"deapexer.zip" = genrule {
    name = "deapexer.zip";
    tools = [
        "deapexer"
        "debugfs_static"
        "soong_zip"
    ];
    cmd = "rm -rf mkdir $(genDir)/deapexer && mkdir $(genDir)/deapexer && " +
        "cp $(location deapexer) $(genDir)/deapexer && " +
        "cp $(location debugfs_static) $(genDir)/deapexer && " +
        "HOST_OUT_SHARED_LIBRARIES=$$(dirname $(location deapexer))/../lib64 && " +
        "cp $\${HOST_OUT_SHARED_LIBRARIES}/libc++.* $(genDir)/deapexer && " +
        "$(location soong_zip) -o $(out) -C $(genDir)/deapexer -D $(genDir)/deapexer";
    out = ["deapexer.zip"];
};

in { inherit "deapexer.zip" ApexKeyRotationTestV2_SignedBob ApexKeyRotationTestV2_SignedBobRot ApexKeyRotationTestV2_SignedBobRotRollback ApexKeyRotationTestV3_SignedBob ApexKeyRotationTestV3_SignedBobRot CtsStagedInstallHostTestCases StagedInstallTest StagedInstallTestApexV1 StagedInstallTestApexV1_NotPreInstalled StagedInstallTestApexV2 StagedInstallTestApexV2_AdditionalFile StagedInstallTestApexV2_AdditionalFolder StagedInstallTestApexV2_ApkInApexSdkTargetP StagedInstallTestApexV2_DifferentCertificate StagedInstallTestApexV2_DifferentPackageName StagedInstallTestApexV2_NoApkSignature StagedInstallTestApexV2_NoHashtree StagedInstallTestApexV2_SdkTargetP StagedInstallTestApexV2_UnsignedPayload StagedInstallTestApexV2_WithPostInstallHook StagedInstallTestApexV2_WithPreInstallHook StagedInstallTestApexV2_WithoutApkInApex StagedInstallTestApexV2_WrongSha StagedInstallTestApexV3 StagedInstallTestAppSamePackageNameAsApex StagedInstallTestCorruptedApex_b146895998; }
