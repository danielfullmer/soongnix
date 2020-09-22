{ android_app, genrule }:
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

#  Build rules to build shim apks.

# ##########################################################
#  Variant: Privileged app upgrade

CtsShimPrivUpgrade = android_app {
    name = "CtsShimPrivUpgrade";
    #  this needs to be a privileged application
    privileged = true;

    sdk_version = "current";
    optimize = {
        enabled = false;
    };
    dex_preopt = {
        enabled = false;
    };

    manifest = "shim_priv_upgrade/AndroidManifest.xml";

    compile_multilib = "both";
    jni_libs = ["libshim_jni"];
};

generate_priv_manifest = genrule {
    name = "generate_priv_manifest";
    srcs = [
        "shim_priv/AndroidManifest.xml"
        ":CtsShimPrivUpgrade"
    ];
    out = ["AndroidManifest.xml"];
    cmd = "sed -e s/__HASH__/`sha512sum -b $(location :CtsShimPrivUpgrade) | cut -d' ' -f1`/ $(location shim_priv/AndroidManifest.xml) > $(out)";
};

# ##########################################################
#  Variant: Privileged app

CtsShimPriv = android_app {
    name = "CtsShimPriv";
    #  this needs to be a privileged application
    privileged = true;

    sdk_version = "current";
    optimize = {
        enabled = false;
    };
    dex_preopt = {
        enabled = false;
    };

    manifest = ":generate_priv_manifest";

    compile_multilib = "both";
    jni_libs = ["libshim_jni"];
    #  Explicitly uncompress native libs rather than letting the build system doing it and destroy the
    #  v2/v3 signature.
    use_embedded_native_libs = true;
    apex_available = [
        "//apex_available:platform"
        "com.android.apex.cts.shim.v1"
        "com.android.apex.cts.shim.v2"
        "com.android.apex.cts.shim.v2_no_hashtree"
        "com.android.apex.cts.shim.v2_legacy"
        "com.android.apex.cts.shim.v2_sdk_target_p"
        "com.android.apex.cts.shim.v2_unsigned_payload"
        "com.android.apex.cts.shim.v3"
    ];
    min_sdk_version = "24";
};

# ##########################################################
#  Variant: Privileged app upgrade w/ the wrong SHA

CtsShimPrivUpgradeWrongSHA = android_app {
    name = "CtsShimPrivUpgradeWrongSHA";
    #  this needs to be a privileged application
    privileged = true;

    sdk_version = "current";
    optimize = {
        enabled = false;
    };
    dex_preopt = {
        enabled = false;
    };
    #  anything to make this package's SHA different from CtsShimPrivUpgrade
    aaptflags = [
        "--version-name"
        "WrongSHA"
    ];

    manifest = "shim_priv_upgrade/AndroidManifest.xml";

    compile_multilib = "both";
    jni_libs = ["libshim_jni"];

};

# ##########################################################
#  Variant: Non Privileged app upgrade which is malformed
CtsShimTargetPSdk = android_app {
    name = "CtsShimTargetPSdk";
    sdk_version = "current";
    optimize = {
        enabled = false;
    };
    dex_preopt = {
        enabled = false;
    };
    manifest = "shim/AndroidManifestTargetPSdk.xml";
    apex_available = [
        "//apex_available:platform"
        "com.android.apex.cts.shim.v2_apk_in_apex_sdk_target_p"
    ];
};

# ##########################################################
#  Variant: System app

CtsShim = android_app {
    name = "CtsShim";

    sdk_version = "current";
    optimize = {
        enabled = false;
    };
    dex_preopt = {
        enabled = false;
    };

    manifest = "shim/AndroidManifest.xml";
    apex_available = [
        "//apex_available:platform"
        "com.android.apex.cts.shim.v1"
        "com.android.apex.cts.shim.v2"
        "com.android.apex.cts.shim.v2_no_hashtree"
        "com.android.apex.cts.shim.v2_legacy"
        "com.android.apex.cts.shim.v2_sdk_target_p"
        "com.android.apex.cts.shim.v2_unsigned_payload"
        "com.android.apex.cts.shim.v3"
    ];
    min_sdk_version = "24";
};

in { inherit CtsShim CtsShimPriv CtsShimPrivUpgrade CtsShimPrivUpgradeWrongSHA CtsShimTargetPSdk generate_priv_manifest; }
