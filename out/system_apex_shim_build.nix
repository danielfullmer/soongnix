{ android_app_certificate, apex, apex_key, genrule, override_apex, prebuilt_etc }:
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

#  Build rules to build shim apexes.

"com.android.apex.cts.shim.pem" = genrule {
    name = "com.android.apex.cts.shim.pem";
    out = ["com.android.apex.cts.shim.pem"];
    cmd = "openssl genrsa -out $(out) 4096";
};

"com.android.apex.cts.shim.pubkey" = genrule {
    name = "com.android.apex.cts.shim.pubkey";
    srcs = [":com.android.apex.cts.shim.pem"];
    out = ["com.android.apex.cts.shim.pubkey"];
    tools = ["avbtool"];
    cmd = "$(location avbtool) extract_public_key --key $(in) --output $(out)";
};

"com.android.apex.cts.shim.key" = apex_key {
    name = "com.android.apex.cts.shim.key";
    private_key = ":com.android.apex.cts.shim.pem";
    public_key = ":com.android.apex.cts.shim.pubkey";
    installable = false;
};

generate_hash_of_dev_null = genrule {
    name = "generate_hash_of_dev_null";
    out = ["hash.txt"];
    cmd = "sha512sum -b /dev/null | cut -d' ' -f1 | tee $(out)";
};

hash_of_dev_null = prebuilt_etc {
    name = "hash_of_dev_null";
    src = ":generate_hash_of_dev_null";
    filename = "hash.txt";
    installable = false;
};

"com.android.apex.cts.shim.v3" = apex {
    name = "com.android.apex.cts.shim.v3";
    manifest = "manifest_v3.json";
    androidManifest = "AndroidManifest.xml";
    file_contexts = ":apex.test-file_contexts";
    key = "com.android.apex.cts.shim.key";
    prebuilts = ["hash_of_dev_null"];
    apps = [
        "CtsShim"
        "CtsShimPriv"
    ];
    installable = false;
    allowed_files = "default_shim_allowed_list.txt";
};

"com.android.apex.cts.shim.v2" = apex {
    name = "com.android.apex.cts.shim.v2";
    manifest = "manifest_v2.json";
    androidManifest = "AndroidManifest.xml";
    file_contexts = ":apex.test-file_contexts";
    key = "com.android.apex.cts.shim.key";
    prebuilts = ["hash_of_dev_null"];
    apps = [
        "CtsShim"
        "CtsShimPriv"
    ];
    installable = false;
    allowed_files = "default_shim_allowed_list.txt";
};

"com.android.apex.cts.shim.v2_without_apk_in_apex" = apex {
    name = "com.android.apex.cts.shim.v2_without_apk_in_apex";
    manifest = "manifest_v2.json";
    androidManifest = "AndroidManifest.xml";
    file_contexts = ":apex.test-file_contexts";
    key = "com.android.apex.cts.shim.key";
    prebuilts = ["hash_of_dev_null"];
    installable = false;
    allowed_files = "default_shim_allowed_list.txt";
};

"com.android.apex.cts.shim.v2_no_hashtree" = apex {
    name = "com.android.apex.cts.shim.v2_no_hashtree";
    manifest = "manifest_v2.json";
    androidManifest = "AndroidManifest.xml";
    file_contexts = ":apex.test-file_contexts";
    key = "com.android.apex.cts.shim.key";
    prebuilts = ["hash_of_dev_null"];
    apps = [
        "CtsShim"
        "CtsShimPriv"
    ];
    installable = false;
    allowed_files = "default_shim_allowed_list.txt";
    test_only_no_hashtree = true;
};

"com.android.apex.cts.shim.v2_unsigned_payload" = apex {
    name = "com.android.apex.cts.shim.v2_unsigned_payload";
    manifest = "manifest_v2.json";
    androidManifest = "AndroidManifest.xml";
    file_contexts = ":apex.test-file_contexts";
    key = "com.android.apex.cts.shim.key";
    prebuilts = ["hash_of_dev_null"];
    apps = [
        "CtsShim"
        "CtsShimPriv"
    ];
    installable = false;
    allowed_files = "default_shim_allowed_list.txt";
    test_only_unsigned_payload = true;
};

"com.android.apex.cts.shim.v2_different_package_name" = override_apex {
    name = "com.android.apex.cts.shim.v2_different_package_name";
    package_name = "com.android.apex.cts.shim.different";
    base = "com.android.apex.cts.shim.v2";
};

generate_empty_hash = genrule {
    name = "generate_empty_hash";
    out = ["hash.txt"];
    cmd = "touch $(out)";
};

empty_hash = prebuilt_etc {
    name = "empty_hash";
    src = ":generate_empty_hash";
    filename = "hash.txt";
    installable = false;
};

#  Use empty hash.txt to make sure that this apex has wrong SHA512, hence trying
#  to stage it should fail.
"com.android.apex.cts.shim.v2_wrong_sha" = apex {
    name = "com.android.apex.cts.shim.v2_wrong_sha";
    manifest = "manifest_v2.json";
    androidManifest = "AndroidManifest.xml";
    file_contexts = ":apex.test-file_contexts";
    key = "com.android.apex.cts.shim.key";
    prebuilts = ["empty_hash"];
    installable = false;
};

apex_shim_additional_file = prebuilt_etc {
    name = "apex_shim_additional_file";
    src = "additional_file";
    filename = "additional_file";
    installable = false;
};

"com.android.apex.cts.shim.v2_additional_file" = apex {
    name = "com.android.apex.cts.shim.v2_additional_file";
    manifest = "manifest_v2.json";
    androidManifest = "AndroidManifest.xml";
    file_contexts = ":apex.test-file_contexts";
    key = "com.android.apex.cts.shim.key";
    prebuilts = [
        "hash_of_dev_null"
        "apex_shim_additional_file"
    ];
    installable = false;
};

apex_shim_additional_folder = prebuilt_etc {
    name = "apex_shim_additional_folder";
    src = "additional_file";
    filename = "additional_file";
    sub_dir = "additional_folder";
    installable = false;
};

"com.android.apex.cts.shim.v2_additional_folder" = apex {
    name = "com.android.apex.cts.shim.v2_additional_folder";
    manifest = "manifest_v2.json";
    androidManifest = "AndroidManifest.xml";
    file_contexts = ":apex.test-file_contexts";
    key = "com.android.apex.cts.shim.key";
    prebuilts = [
        "hash_of_dev_null"
        "apex_shim_additional_folder"
    ];
    installable = false;
};

"com.android.apex.cts.shim.v2_with_pre_install_hook" = apex {
    name = "com.android.apex.cts.shim.v2_with_pre_install_hook";
    manifest = "manifest_v2_with_pre_install_hook.json";
    androidManifest = "AndroidManifest.xml";
    file_contexts = ":apex.test-file_contexts";
    key = "com.android.apex.cts.shim.key";
    prebuilts = ["hash_of_dev_null"];
    installable = false;
};

"com.android.apex.cts.shim.v2_with_post_install_hook" = apex {
    name = "com.android.apex.cts.shim.v2_with_post_install_hook";
    manifest = "manifest_v2_with_post_install_hook.json";
    androidManifest = "AndroidManifest.xml";
    file_contexts = ":apex.test-file_contexts";
    key = "com.android.apex.cts.shim.key";
    prebuilts = ["hash_of_dev_null"];
    installable = false;
};

generate_hash_v1 = genrule {
    name = "generate_hash_v1";
    srcs = [
        ":com.android.apex.cts.shim.v2"
        ":com.android.apex.cts.shim.v2_without_apk_in_apex"
        ":com.android.apex.cts.shim.v2_additional_file"
        ":com.android.apex.cts.shim.v2_additional_folder"
        ":com.android.apex.cts.shim.v2_different_certificate"
        ":com.android.apex.cts.shim.v2_different_package_name"
        ":com.android.apex.cts.shim.v2_no_hashtree"
        ":com.android.apex.cts.shim.v2_signed_bob"
        ":com.android.apex.cts.shim.v2_signed_bob_rot"
        ":com.android.apex.cts.shim.v2_signed_bob_rot_rollback"
        ":com.android.apex.cts.shim.v2_with_pre_install_hook"
        ":com.android.apex.cts.shim.v2_with_post_install_hook"
        ":com.android.apex.cts.shim.v2_sdk_target_p"
        ":com.android.apex.cts.shim.v2_apk_in_apex_sdk_target_p"
        ":com.android.apex.cts.shim.v3"
        ":com.android.apex.cts.shim.v3_signed_bob"
        ":com.android.apex.cts.shim.v3_signed_bob_rot"
    ];
    out = ["hash.txt"];
    cmd = "sha512sum -b $(in) | cut -d' ' -f1 | tee $(out)";
};

hash_v1 = prebuilt_etc {
    name = "hash_v1";
    src = ":generate_hash_v1";
    filename = "hash.txt";
    installable = false;
};

"com.android.apex.cts.shim.v1" = apex {
    name = "com.android.apex.cts.shim.v1";
    manifest = "manifest.json";
    androidManifest = "AndroidManifest.xml";
    file_contexts = ":apex.test-file_contexts";
    key = "com.android.apex.cts.shim.key";
    prebuilts = ["hash_v1"];
    apps = [
        "CtsShim"
        "CtsShimPriv"
    ];
    allowed_files = "default_shim_allowed_list.txt";
};

#  This is to install the flattened version of com.android.apex.cts.shim.
#  Because com.android.apex.cts.shim is provided as prebuilt and the build system
#  doesn't support install "flattened" version from "prebult" yet, GSI, which should
#  have both "flatttened" and "unflattened" APEXes, is missing the flattened version
#  of com.android.apex.cts.shim.
#  TODO(b/159426728):  When the build system can install "flattened" from "prebuilts",
#  this can be removed.
"com.android.apex.cts.shim.v1_with_prebuilts" = override_apex {
    name = "com.android.apex.cts.shim.v1_with_prebuilts";
    base = "com.android.apex.cts.shim.v1";
    apps = [
        "CtsShimPrebuilt"
        "CtsShimPrivPrebuilt"
    ];
    allowed_files = "prebuilts_shim_allowed_list.txt";
};

"com.android.apex.cts.shim_not_pre_installed.pem" = genrule {
    name = "com.android.apex.cts.shim_not_pre_installed.pem";
    out = ["com.android.apex.cts.shim_not_pre_installed.pem"];
    cmd = "openssl genrsa -out $(out) 4096";
};

"com.android.apex.cts.shim_not_pre_installed.pubkey" = genrule {
    name = "com.android.apex.cts.shim_not_pre_installed.pubkey";
    srcs = [":com.android.apex.cts.shim_not_pre_installed.pem"];
    out = ["com.android.apex.cts.shim_not_pre_installed.pubkey"];
    tools = ["avbtool"];
    cmd = "$(location avbtool) extract_public_key --key $(in) --output $(out)";
};

"com.android.apex.cts.shim_not_pre_installed.key" = apex_key {
    name = "com.android.apex.cts.shim_not_pre_installed.key";
    private_key = ":com.android.apex.cts.shim_not_pre_installed.pem";
    public_key = ":com.android.apex.cts.shim_not_pre_installed.pubkey";
    installable = false;
};

"com.android.apex.cts.shim_not_pre_installed" = apex {
    name = "com.android.apex.cts.shim_not_pre_installed";
    manifest = "manifest_not_pre_installed.json";
    file_contexts = ":apex.test-file_contexts";
    key = "com.android.apex.cts.shim_not_pre_installed.key";
    prebuilts = ["hash_of_dev_null"];
    installable = false;
};

"com.android.apex.cts.shim.v2_different_certificate" = apex {
    name = "com.android.apex.cts.shim.v2_different_certificate";
    manifest = "manifest_v2.json";
    androidManifest = "AndroidManifest.xml";
    file_contexts = ":apex.test-file_contexts";
    key = "com.android.apex.cts.shim.key";
    prebuilts = ["hash_of_dev_null"];
    installable = false;
    certificate = ":com.android.apex.cts.shim.debug.cert";
};

"com.android.apex.cts.shim.debug.cert" = android_app_certificate {
    name = "com.android.apex.cts.shim.debug.cert";
    certificate = "com.android.apex.cts.shim.debug.cert";
};

#  Build rules to build shim apex with rotated keys

#  We name the original key used to sign cts.shim.v1 package as alice.
#  We then create a second key called bob. The second key bob is used to rotate the
#  original key alice.

#  Create private key bob in pem format
"com.android.apex.rotation.key.bob.pem" = genrule {
    name = "com.android.apex.rotation.key.bob.pem";
    out = ["bob.pem"];
    cmd = "openssl req -x509 -newkey rsa:4096 -nodes -days 999999 -subj '/DN=/EMAILADDRESS=android@android.com/CN=Android/OU=Android/O=Android/L=Mountain View/ST=California/C=US' -keyout $(out)";
};

#  Converts bob's private key to pk8 format
"com.android.apex.rotation.key.bob.pk8" = genrule {
    name = "com.android.apex.rotation.key.bob.pk8";
    srcs = [":com.android.apex.rotation.key.bob.pem"];
    out = ["bob.pk8"];
    cmd = "openssl pkcs8 -topk8 -inform PEM -outform DER -in $(in) -out $(out) -nocrypt";
};

#  Extract bob's public key from its private key
"com.android.apex.rotation.key.bob.x509.pem" = genrule {
    name = "com.android.apex.rotation.key.bob.x509.pem";
    srcs = [":com.android.apex.rotation.key.bob.pem"];
    out = ["bob.x509.pem"];
    cmd = "openssl req -x509 -key $(in) -newkey rsa:4096 -nodes -days 999999 -subj '/DN=/EMAILADDRESS=android@android.com/CN=Android/OU=Android/O=Android/L=Mountain View/ST=California/C=US' -out $(out)";
};

#  Create lineage file for rotating alice to bob
"com.android.apex.rotation.key.bob.rot" = genrule {
    name = "com.android.apex.rotation.key.bob.rot";
    srcs = [
        "alice.pk8"
        "alice.x509.pem"
        ":com.android.apex.rotation.key.bob.pk8"
        ":com.android.apex.rotation.key.bob.x509.pem"
    ];
    out = ["bob.rot"];
    tools = [":apksigner"];
    cmd = "$(location :apksigner) rotate --out $(out) --old-signer --key $(location alice.pk8) --cert $(location alice.x509.pem) --new-signer --key $(location :com.android.apex.rotation.key.bob.pk8) --cert $(location :com.android.apex.rotation.key.bob.x509.pem)";
};

#  Create lineage file for rotating alice to bob with rollback capability
"com.android.apex.rotation.key.bob.rot.rollback" = genrule {
    name = "com.android.apex.rotation.key.bob.rot.rollback";
    srcs = [
        "alice.pk8"
        "alice.x509.pem"
        ":com.android.apex.rotation.key.bob.pk8"
        ":com.android.apex.rotation.key.bob.x509.pem"
    ];
    out = ["bob.rot"];
    tools = [":apksigner"];
    cmd = "$(location :apksigner) rotate --out $(out) --old-signer --key $(location alice.pk8) --cert $(location alice.x509.pem) --set-rollback true --new-signer --key $(location :com.android.apex.rotation.key.bob.pk8) --cert $(location :com.android.apex.rotation.key.bob.x509.pem)";
};

#  v2 cts shim package signed by bob, without lineage
"com.android.apex.cts.shim.v2_signed_bob" = genrule {
    name = "com.android.apex.cts.shim.v2_signed_bob";
    out = ["com.android.apex.cts.shim.v2_signed_bob"];
    tools = [":apksigner"];
    srcs = [
        ":com.android.apex.cts.shim.v2"
        ":com.android.apex.rotation.key.bob.x509.pem"
        ":com.android.apex.rotation.key.bob.pk8"
    ];
    dist = {
        targets = ["com.android.apex.cts.shim.v2_signed_bob"];
        dest = "com.android.apex.cts.shim.v2_signed_bob.apex";
    };
    cmd = "$(location :apksigner) sign --v1-signing-enabled false --v2-signing-enabled false --key $(location :com.android.apex.rotation.key.bob.pk8) --cert $(location :com.android.apex.rotation.key.bob.x509.pem) --out $(out) $(location :com.android.apex.cts.shim.v2)";
};

#  v2 cts shim package signed by bob + lineage
"com.android.apex.cts.shim.v2_signed_bob_rot" = genrule {
    name = "com.android.apex.cts.shim.v2_signed_bob_rot";
    out = ["com.android.apex.cts.shim.v2_signed_bob_rot"];
    tools = [":apksigner"];
    srcs = [
        ":com.android.apex.cts.shim.v2"
        ":com.android.apex.rotation.key.bob.x509.pem"
        ":com.android.apex.rotation.key.bob.pk8"
        ":com.android.apex.rotation.key.bob.rot"
    ];
    dist = {
        targets = ["com.android.apex.cts.shim.v2_signed_bob_rot"];
        dest = "com.android.apex.cts.shim.v2_signed_bob_rot.apex";
    };
    cmd = "$(location :apksigner) sign --v1-signing-enabled false --v2-signing-enabled false --key $(location :com.android.apex.rotation.key.bob.pk8) --cert $(location :com.android.apex.rotation.key.bob.x509.pem) --lineage $(location :com.android.apex.rotation.key.bob.rot) --out $(out) $(location :com.android.apex.cts.shim.v2)";
};

#  v2 cts shim package signed by bob + lineage + rollback capability
"com.android.apex.cts.shim.v2_signed_bob_rot_rollback" = genrule {
    name = "com.android.apex.cts.shim.v2_signed_bob_rot_rollback";
    out = ["com.android.apex.cts.shim.v2_signed_bob_rot_rollback"];
    tools = [":apksigner"];
    srcs = [
        ":com.android.apex.cts.shim.v2"
        ":com.android.apex.rotation.key.bob.x509.pem"
        ":com.android.apex.rotation.key.bob.pk8"
        ":com.android.apex.rotation.key.bob.rot.rollback"
    ];
    dist = {
        targets = ["com.android.apex.cts.shim.v2_signed_bob_rot_rollback"];
        dest = "com.android.apex.cts.shim.v2_signed_bob_rot_rollback.apex";
    };
    cmd = "$(location :apksigner) sign --v1-signing-enabled false --v2-signing-enabled false --key $(location :com.android.apex.rotation.key.bob.pk8) --cert $(location :com.android.apex.rotation.key.bob.x509.pem) --lineage $(location :com.android.apex.rotation.key.bob.rot.rollback) --out $(out) $(location :com.android.apex.cts.shim.v2)";
};

#  v3 cts shim package signed by bob
"com.android.apex.cts.shim.v3_signed_bob" = genrule {
    name = "com.android.apex.cts.shim.v3_signed_bob";
    out = ["com.android.apex.cts.shim.v3_signed_bob"];
    tools = [":apksigner"];
    srcs = [
        ":com.android.apex.cts.shim.v3"
        ":com.android.apex.rotation.key.bob.x509.pem"
        ":com.android.apex.rotation.key.bob.pk8"
    ];
    dist = {
        targets = ["com.android.apex.cts.shim.v3_signed_bob"];
        dest = "com.android.apex.cts.shim.v3_signed_bob.apex";
    };
    cmd = "$(location :apksigner) sign --v1-signing-enabled false --v2-signing-enabled false --key $(location :com.android.apex.rotation.key.bob.pk8) --cert $(location :com.android.apex.rotation.key.bob.x509.pem) --out $(out) $(location :com.android.apex.cts.shim.v3)";
};

#  v3 cts shim package signed by bob + lineage
"com.android.apex.cts.shim.v3_signed_bob_rot" = genrule {
    name = "com.android.apex.cts.shim.v3_signed_bob_rot";
    out = ["com.android.apex.cts.shim.v3_signed_bob_rot"];
    tools = [":apksigner"];
    srcs = [
        ":com.android.apex.cts.shim.v3"
        ":com.android.apex.rotation.key.bob.x509.pem"
        ":com.android.apex.rotation.key.bob.pk8"
        ":com.android.apex.rotation.key.bob.rot"
    ];
    dist = {
        targets = ["com.android.apex.cts.shim.v3_signed_bob_rot"];
        dest = "com.android.apex.cts.shim.v3_signed_bob_rot.apex";
    };
    cmd = "$(location :apksigner) sign --v1-signing-enabled false --v2-signing-enabled false --key $(location :com.android.apex.rotation.key.bob.pk8) --cert $(location :com.android.apex.rotation.key.bob.x509.pem) --lineage $(location :com.android.apex.rotation.key.bob.rot) --out $(out) $(location :com.android.apex.cts.shim.v3)";
};

#  This one is only used in ApexdHostTest and not meant to be installed
#  and hence shouldn't be allowed in hash.txt of v1 shim APEX.
"com.android.apex.cts.shim.v2_legacy" = apex {
    name = "com.android.apex.cts.shim.v2_legacy";
    manifest = "manifest_v2.json";
    androidManifest = "AndroidManifest.xml";
    file_contexts = ":apex.test-file_contexts";
    key = "com.android.apex.cts.shim.key";
    prebuilts = ["hash_of_dev_null"];
    apps = [
        "CtsShim"
        "CtsShimPriv"
    ];
    installable = false;
    min_sdk_version = "29";
};

"com.android.apex.cts.shim.v2_no_pb" = genrule {
    name = "com.android.apex.cts.shim.v2_no_pb";
    srcs = [":com.android.apex.cts.shim.v2_legacy"];
    out = ["com.android.apex.cts.shim.v2_no_pb.apex"];
    tools = ["zip2zip"];
    cmd = "$(location zip2zip) -i $(in) -x apex_manifest.pb -o $(out)";
};

#  Apex shim that targets an old sdk (P)
"com.android.apex.cts.shim.v2_sdk_target_p" = apex {
    name = "com.android.apex.cts.shim.v2_sdk_target_p";
    manifest = "manifest_v2.json";
    androidManifest = "AndroidManifestSdkTargetP.xml";
    file_contexts = ":apex.test-file_contexts";
    key = "com.android.apex.cts.shim.key";
    prebuilts = ["hash_of_dev_null"];
    installable = false;
    apps = [
        "CtsShim"
        "CtsShimPriv"
    ];
};

#  Apex shim with apk-in-apex that targets sdk P
"com.android.apex.cts.shim.v2_apk_in_apex_sdk_target_p" = apex {
    name = "com.android.apex.cts.shim.v2_apk_in_apex_sdk_target_p";
    manifest = "manifest_v2.json";
    androidManifest = "AndroidManifest.xml";
    file_contexts = ":apex.test-file_contexts";
    key = "com.android.apex.cts.shim.key";
    prebuilts = ["hash_of_dev_null"];
    apps = ["CtsShimTargetPSdk"];
    installable = false;
};

#  Apex shim with unsigned apk
"com.android.apex.cts.shim.v2_unsigned_apk_container" = genrule {
    name = "com.android.apex.cts.shim.v2_unsigned_apk_container";
    srcs = [":com.android.apex.cts.shim.v2"];
    out = ["com.android.apex.cts.shim.v2_unsigned_apk_container.apex"];
    cmd = "cp -v $(in) $(out) && zip -d $(out) META-INF*";
    dist = {
        targets = ["apps_only"];
    };
};

in { inherit "com.android.apex.cts.shim.debug.cert" "com.android.apex.cts.shim.key" "com.android.apex.cts.shim.pem" "com.android.apex.cts.shim.pubkey" "com.android.apex.cts.shim.v1" "com.android.apex.cts.shim.v1_with_prebuilts" "com.android.apex.cts.shim.v2" "com.android.apex.cts.shim.v2_additional_file" "com.android.apex.cts.shim.v2_additional_folder" "com.android.apex.cts.shim.v2_apk_in_apex_sdk_target_p" "com.android.apex.cts.shim.v2_different_certificate" "com.android.apex.cts.shim.v2_different_package_name" "com.android.apex.cts.shim.v2_legacy" "com.android.apex.cts.shim.v2_no_hashtree" "com.android.apex.cts.shim.v2_no_pb" "com.android.apex.cts.shim.v2_sdk_target_p" "com.android.apex.cts.shim.v2_signed_bob" "com.android.apex.cts.shim.v2_signed_bob_rot" "com.android.apex.cts.shim.v2_signed_bob_rot_rollback" "com.android.apex.cts.shim.v2_unsigned_apk_container" "com.android.apex.cts.shim.v2_unsigned_payload" "com.android.apex.cts.shim.v2_with_post_install_hook" "com.android.apex.cts.shim.v2_with_pre_install_hook" "com.android.apex.cts.shim.v2_without_apk_in_apex" "com.android.apex.cts.shim.v2_wrong_sha" "com.android.apex.cts.shim.v3" "com.android.apex.cts.shim.v3_signed_bob" "com.android.apex.cts.shim.v3_signed_bob_rot" "com.android.apex.cts.shim_not_pre_installed" "com.android.apex.cts.shim_not_pre_installed.key" "com.android.apex.cts.shim_not_pre_installed.pem" "com.android.apex.cts.shim_not_pre_installed.pubkey" "com.android.apex.rotation.key.bob.pem" "com.android.apex.rotation.key.bob.pk8" "com.android.apex.rotation.key.bob.rot" "com.android.apex.rotation.key.bob.rot.rollback" "com.android.apex.rotation.key.bob.x509.pem" apex_shim_additional_file apex_shim_additional_folder empty_hash generate_empty_hash generate_hash_of_dev_null generate_hash_v1 hash_of_dev_null hash_v1; }
