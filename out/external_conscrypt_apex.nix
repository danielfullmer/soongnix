{ android_app_certificate, apex, apex_defaults, apex_key, filegroup, prebuilt_etc }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

#  Defaults shared between real and test versions of the APEX.
"com.android.conscrypt-defaults" = apex_defaults {
    name = "com.android.conscrypt-defaults";
    updatable = true;
    androidManifest = ":com.android.conscrypt-androidManifest";
    compile_multilib = "both";
    java_libs = ["conscrypt"];
    native_shared_libs = ["libjavacrypto"];
    multilib = {
        both = {
            binaries = ["boringssl_self_test"];
        };
    };
    key = "apex.conscrypt.key";
    certificate = ":com.android.conscrypt.certificate";

    #  IMPORTANT: For the APEX to be installed on Android 10,
    #  min_sdk_version should be 29. This enables the build system to make
    #  sure the package compatible to Android 10 in two ways:
    #  - build the APEX package compatible to Android 10
    #    so that the package can be installed.
    #  - build artifacts (lib/javalib/bin) against Android 10 SDK
    #    so that the artifacts can run.
    min_sdk_version = "29";
};

"com.android.conscrypt-androidManifest" = filegroup {
    name = "com.android.conscrypt-androidManifest";
    srcs = ["AndroidManifest.xml"];
};

"apex.conscrypt.key" = apex_key {
    name = "apex.conscrypt.key";
    public_key = "com.android.conscrypt.avbpubkey";
    private_key = "com.android.conscrypt.pem";
};

"com.android.conscrypt.certificate" = android_app_certificate {
    name = "com.android.conscrypt.certificate";
    certificate = "com.android.conscrypt";
};

"com.android.conscrypt.ld.config.txt" = prebuilt_etc {
    name = "com.android.conscrypt.ld.config.txt";
    src = "ld.config.txt";
    filename = "ld.config.txt";
    installable = false;
};

#  Production APEX
"com.android.conscrypt" = apex {
    name = "com.android.conscrypt";
    visibility = [
        "//vendor:__subpackages__"
    ];
    defaults = ["com.android.conscrypt-defaults"];
    manifest = "apex_manifest.json";
    binaries = ["boringssl_self_test"];
    prebuilts = ["com.android.conscrypt.ld.config.txt"];
};

in { inherit "apex.conscrypt.key" "com.android.conscrypt" "com.android.conscrypt-androidManifest" "com.android.conscrypt-defaults" "com.android.conscrypt.certificate" "com.android.conscrypt.ld.config.txt"; }
