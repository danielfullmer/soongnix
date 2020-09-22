{ android_test, apex, apex_key, genrule, java_library_host, java_test_host }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

RollbackTest = android_test {
    name = "RollbackTest";
    manifest = "RollbackTest/AndroidManifest.xml";
    srcs = [
        "RollbackTest/src/com/android/tests/rollback/MultiUserRollbackTest.java"
        "RollbackTest/src/com/android/tests/rollback/NetworkStagedRollbackTest.java"
        "RollbackTest/src/com/android/tests/rollback/RollbackTest.java"
        "RollbackTest/src/com/android/tests/rollback/StagedRollbackTest.java"
    ];
    static_libs = [
        "androidx.test.rules"
        "cts-rollback-lib"
        "cts-install-lib"
    ];
    test_suites = ["general-tests"];
    test_config = "RollbackTest.xml";
    java_resources = [
        ":com.android.apex.apkrollback.test_v2"
        ":com.android.apex.apkrollback.test_v2Crashing"
    ];
};

StagedRollbackTest = java_test_host {
    name = "StagedRollbackTest";
    srcs = ["StagedRollbackTest/src/com/android/tests/rollback/host/StagedRollbackTest.java"];
    libs = ["tradefed"];
    static_libs = [
        "testng"
        "compatibility-tradefed"
        "RollbackTestLib"
    ];
    test_suites = ["general-tests"];
    test_config = "StagedRollbackTest.xml";
    data = [":com.android.apex.apkrollback.test_v1"];
};

NetworkStagedRollbackTest = java_test_host {
    name = "NetworkStagedRollbackTest";
    srcs = ["NetworkStagedRollbackTest/src/com/android/tests/rollback/host/NetworkStagedRollbackTest.java"];
    libs = ["tradefed"];
    static_libs = ["RollbackTestLib"];
    test_suites = ["general-tests"];
    test_config = "NetworkStagedRollbackTest.xml";
};

MultiUserRollbackTest = java_test_host {
    name = "MultiUserRollbackTest";
    srcs = ["MultiUserRollbackTest/src/com/android/tests/rollback/host/MultiUserRollbackTest.java"];
    libs = ["tradefed"];
    test_suites = ["general-tests"];
    test_config = "MultiUserRollbackTest.xml";
};

RollbackTestLib = java_library_host {
    name = "RollbackTestLib";
    srcs = ["lib/src/com/android/tests/rollback/host/WatchdogEventLogger.java"];
    libs = ["tradefed"];
};

"com.android.apex.apkrollback.test.pem" = genrule {
    name = "com.android.apex.apkrollback.test.pem";
    out = ["com.android.apex.apkrollback.test.pem"];
    cmd = "openssl genrsa -out $(out) 4096";
};

"com.android.apex.apkrollback.test.pubkey" = genrule {
    name = "com.android.apex.apkrollback.test.pubkey";
    srcs = [":com.android.apex.apkrollback.test.pem"];
    out = ["com.android.apex.apkrollback.test.pubkey"];
    tools = ["avbtool"];
    cmd = "$(location avbtool) extract_public_key --key $(in) --output $(out)";
};

"com.android.apex.apkrollback.test.key" = apex_key {
    name = "com.android.apex.apkrollback.test.key";
    private_key = ":com.android.apex.apkrollback.test.pem";
    public_key = ":com.android.apex.apkrollback.test.pubkey";
    installable = false;
};

"com.android.apex.apkrollback.test_v1" = apex {
    name = "com.android.apex.apkrollback.test_v1";
    manifest = "testdata/manifest_v1.json";
    androidManifest = "testdata/AndroidManifest.xml";
    file_contexts = ":apex.test-file_contexts";
    key = "com.android.apex.apkrollback.test.key";
    apps = ["TestAppAv1"];
    installable = false;
};

"com.android.apex.apkrollback.test_v2" = apex {
    name = "com.android.apex.apkrollback.test_v2";
    manifest = "testdata/manifest_v2.json";
    androidManifest = "testdata/AndroidManifest.xml";
    file_contexts = ":apex.test-file_contexts";
    key = "com.android.apex.apkrollback.test.key";
    apps = ["TestAppAv2"];
    installable = false;
};

"com.android.apex.apkrollback.test_v2Crashing" = apex {
    name = "com.android.apex.apkrollback.test_v2Crashing";
    manifest = "testdata/manifest_v2.json";
    androidManifest = "testdata/AndroidManifest.xml";
    file_contexts = ":apex.test-file_contexts";
    key = "com.android.apex.apkrollback.test.key";
    apps = ["TestAppACrashingV2"];
    installable = false;
};

in { inherit "com.android.apex.apkrollback.test.key" "com.android.apex.apkrollback.test.pem" "com.android.apex.apkrollback.test.pubkey" "com.android.apex.apkrollback.test_v1" "com.android.apex.apkrollback.test_v2" "com.android.apex.apkrollback.test_v2Crashing" MultiUserRollbackTest NetworkStagedRollbackTest RollbackTest RollbackTestLib StagedRollbackTest; }
