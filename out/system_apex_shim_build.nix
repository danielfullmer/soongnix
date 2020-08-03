{ apex, apex_key, genrule, prebuilt_etc }:
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
    file_contexts = "apex.test";
    key = "com.android.apex.cts.shim.key";
    prebuilts = ["hash_of_dev_null"];
    installable = false;
};

"com.android.apex.cts.shim.v2" = apex {
    name = "com.android.apex.cts.shim.v2";
    manifest = "manifest_v2.json";
    file_contexts = "apex.test";
    key = "com.android.apex.cts.shim.key";
    prebuilts = ["hash_of_dev_null"];
    installable = false;
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
    file_contexts = "apex.test";
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
    file_contexts = "apex.test";
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
    file_contexts = "apex.test";
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
    file_contexts = "apex.test";
    key = "com.android.apex.cts.shim.key";
    prebuilts = ["hash_of_dev_null"];
    installable = false;
};

"com.android.apex.cts.shim.v2_with_post_install_hook" = apex {
    name = "com.android.apex.cts.shim.v2_with_post_install_hook";
    manifest = "manifest_v2_with_post_install_hook.json";
    file_contexts = "apex.test";
    key = "com.android.apex.cts.shim.key";
    prebuilts = ["hash_of_dev_null"];
    installable = false;
};

generate_hash_v1 = genrule {
    name = "generate_hash_v1";
    srcs = [
        ":com.android.apex.cts.shim.v2"
        ":com.android.apex.cts.shim.v2_additional_file"
        ":com.android.apex.cts.shim.v2_additional_folder"
        ":com.android.apex.cts.shim.v2_with_pre_install_hook"
        ":com.android.apex.cts.shim.v2_with_post_install_hook"
        ":com.android.apex.cts.shim.v3"
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
    file_contexts = "apex.test";
    key = "com.android.apex.cts.shim.key";
    prebuilts = ["hash_v1"];
    installable = false;
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
    file_contexts = "apex.test";
    key = "com.android.apex.cts.shim_not_pre_installed.key";
    prebuilts = ["hash_of_dev_null"];
    installable = false;
};

in { inherit "com.android.apex.cts.shim.key" "com.android.apex.cts.shim.pem" "com.android.apex.cts.shim.pubkey" "com.android.apex.cts.shim.v1" "com.android.apex.cts.shim.v2" "com.android.apex.cts.shim.v2_additional_file" "com.android.apex.cts.shim.v2_additional_folder" "com.android.apex.cts.shim.v2_with_post_install_hook" "com.android.apex.cts.shim.v2_with_pre_install_hook" "com.android.apex.cts.shim.v2_wrong_sha" "com.android.apex.cts.shim.v3" "com.android.apex.cts.shim_not_pre_installed" "com.android.apex.cts.shim_not_pre_installed.key" "com.android.apex.cts.shim_not_pre_installed.pem" "com.android.apex.cts.shim_not_pre_installed.pubkey" apex_shim_additional_file apex_shim_additional_folder empty_hash generate_empty_hash generate_hash_of_dev_null generate_hash_v1 hash_of_dev_null hash_v1; }
