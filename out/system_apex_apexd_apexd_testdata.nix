{ apex, apex_key, sh_binary }:
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

#  These apex definitions will generate the prebuilt test data. The modules
#  are disabled so as not to pollute the build.

"com.android.apex.test_package.key" = apex_key {
    name = "com.android.apex.test_package.key";
    public_key = "com.android.apex.test_package.avbpubkey";
    private_key = "com.android.apex.test_package.pem";
    installable = false;
};

"apex.apexd_test" = apex {
    name = "apex.apexd_test";
    manifest = "manifest.json";
    file_contexts = "apex.test";
    prebuilts = ["sample_prebuilt_file"];
    key = "com.android.apex.test_package.key";
    installable = false;
};

"apex.apexd_test_v2" = apex {
    name = "apex.apexd_test_v2";
    manifest = "manifest_v2.json";
    file_contexts = "apex.test";
    prebuilts = ["sample_prebuilt_file"];
    key = "com.android.apex.test_package.key";
    installable = false;
};

"com.android.apex.test_package.preinstall.key" = apex_key {
    name = "com.android.apex.test_package.preinstall.key";
    public_key = "com.android.apex.test_package.preinstall.avbpubkey";
    private_key = "com.android.apex.test_package.preinstall.pem";
    installable = false;
};

"apex.apexd_test_preinstall" = apex {
    name = "apex.apexd_test_preinstall";
    manifest = "manifest_preinstall.json";
    file_contexts = "apex.test";
    prebuilts = ["sample_prebuilt_file"];
    key = "com.android.apex.test_package.preinstall.key";
    binaries = ["apex_test_preInstallHook"];
    installable = false;
};

"com.android.apex.test_package.postinstall.key" = apex_key {
    name = "com.android.apex.test_package.postinstall.key";
    public_key = "com.android.apex.test_package.postinstall.avbpubkey";
    private_key = "com.android.apex.test_package.postinstall.pem";
    installable = false;
};

"apex.apexd_test_postinstall" = apex {
    name = "apex.apexd_test_postinstall";
    manifest = "manifest_postinstall.json";
    file_contexts = "apex.test";
    prebuilts = ["sample_prebuilt_file"];
    key = "com.android.apex.test_package.postinstall.key";
    binaries = ["apex_test_postInstallHook"];
    installable = false;
};

"com.android.apex.test_package.prepostinstall.fail.key" = apex_key {
    name = "com.android.apex.test_package.prepostinstall.fail.key";
    public_key = "com.android.apex.test_package.prepostinstall.fail.avbpubkey";
    private_key = "com.android.apex.test_package.prepostinstall.fail.pem";
    installable = false;
};

"apex.apexd_test_prepostinstall.fail" = apex {
    name = "apex.apexd_test_prepostinstall.fail";
    manifest = "manifest_prepostinstall.fail.json";
    file_contexts = "apex.test";
    prebuilts = ["sample_prebuilt_file"];
    key = "com.android.apex.test_package.prepostinstall.fail.key";
    binaries = ["apex_test_prePostInstallHookFail"];
    installable = false;
};

"com.android.apex.test_package.no_inst_key.key" = apex_key {
    name = "com.android.apex.test_package.no_inst_key.key";
    public_key = "com.android.apex.test_package.no_inst_key.avbpubkey";
    private_key = "com.android.apex.test_package.no_inst_key.pem";
    installable = true; #  set to true to prevent bundling into the APEX
};

"apex.apexd_test_no_inst_key" = apex {
    name = "apex.apexd_test_no_inst_key";
    manifest = "manifest_no_inst_key.json";
    file_contexts = "apex.test";
    prebuilts = ["sample_prebuilt_file"];
    key = "com.android.apex.test_package.no_inst_key.key";
    installable = false;
};

"com.android.apex.test_package_2.key" = apex_key {
    name = "com.android.apex.test_package_2.key";
    public_key = "com.android.apex.test_package_2.avbpubkey";
    private_key = "com.android.apex.test_package_2.pem";
    installable = false;
};

"apex.apexd_test_different_app" = apex {
    name = "apex.apexd_test_different_app";
    manifest = "manifest_different_app.json";
    file_contexts = "apex.test";
    prebuilts = ["sample_prebuilt_file"];
    key = "com.android.apex.test_package_2.key";
    installable = false;
};

apex_test_preInstallHook = sh_binary {
    name = "apex_test_preInstallHook";
    src = "preInstallHook.sh";
};

apex_test_postInstallHook = sh_binary {
    name = "apex_test_postInstallHook";
    src = "postInstallHook.sh";
};

apex_test_prePostInstallHookFail = sh_binary {
    name = "apex_test_prePostInstallHookFail";
    src = "fail.sh";
};

in { inherit "apex.apexd_test" "apex.apexd_test_different_app" "apex.apexd_test_no_inst_key" "apex.apexd_test_postinstall" "apex.apexd_test_preinstall" "apex.apexd_test_prepostinstall.fail" "apex.apexd_test_v2" "com.android.apex.test_package.key" "com.android.apex.test_package.no_inst_key.key" "com.android.apex.test_package.postinstall.key" "com.android.apex.test_package.preinstall.key" "com.android.apex.test_package.prepostinstall.fail.key" "com.android.apex.test_package_2.key" apex_test_postInstallHook apex_test_preInstallHook apex_test_prePostInstallHookFail; }
