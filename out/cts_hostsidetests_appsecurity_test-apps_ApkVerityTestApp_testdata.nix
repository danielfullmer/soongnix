{ filegroup, genrule, genrule_defaults }:
let

#  Copyright (C) 2020 The Android Open Source Project
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

#  A rule to collect apps for debugging purpose. See ApkVerityTestAppPrebuilt/README.md.
CtsApkVerityTestDebugFiles = genrule {
    name = "CtsApkVerityTestDebugFiles";
    srcs = [
        ":CtsApkVerityTestApp"
        ":CtsApkVerityTestAppFsvSig"
        ":CtsApkVerityTestAppDm"
        ":CtsApkVerityTestAppDmFsvSig"
        ":CtsApkVerityTestAppSplit"
        ":CtsApkVerityTestAppSplitFsvSig"
        ":CtsApkVerityTestAppSplitDm"
        ":CtsApkVerityTestAppSplitDmFsvSig"
    ];
    cmd = "echo $(in) > $(out)";
    out = ["CtsApkVerityTestDebugFiles.txt"];
};

CtsApkVerityTestAppDm = filegroup {
    name = "CtsApkVerityTestAppDm";
    srcs = ["CtsApkVerityTestApp.dm"];
};

CtsApkVerityTestAppSplitDm = filegroup {
    name = "CtsApkVerityTestAppSplitDm";
    srcs = ["CtsApkVerityTestAppSplit.dm"];
};

fsverity-debug-key = filegroup {
    name = "fsverity-debug-key";
    srcs = ["fsverity-debug-key.pem"];
};

fsverity-debug-cert = filegroup {
    name = "fsverity-debug-cert";
    srcs = ["fsverity-debug.x509.pem"];
};

cts_apk_verity_sig_gen_default = genrule_defaults {
    name = "cts_apk_verity_sig_gen_default";
    tools = ["fsverity"];
    tool_files = [
        ":fsverity-debug-key"
        ":fsverity-debug-cert"
    ];
    cmd = "$(location fsverity) sign $(in) $(out) " +
        "--key=$(location :fsverity-debug-key) " +
        "--cert=$(location :fsverity-debug-cert) " +
        "> /dev/null";
};

CtsApkVerityTestAppFsvSig = genrule {
    name = "CtsApkVerityTestAppFsvSig";
    defaults = ["cts_apk_verity_sig_gen_default"];
    srcs = [":CtsApkVerityTestApp"];
    out = ["CtsApkVerityTestApp.apk.fsv_sig"];
};

CtsApkVerityTestAppDmFsvSig = genrule {
    name = "CtsApkVerityTestAppDmFsvSig";
    defaults = ["cts_apk_verity_sig_gen_default"];
    srcs = [":CtsApkVerityTestAppDm"];
    out = ["CtsApkVerityTestApp.dm.fsv_sig"];
};

CtsApkVerityTestAppSplitFsvSig = genrule {
    name = "CtsApkVerityTestAppSplitFsvSig";
    defaults = ["cts_apk_verity_sig_gen_default"];
    srcs = [":CtsApkVerityTestAppSplit"];
    out = ["CtsApkVerityTestAppSplit.apk.fsv_sig"];
};

CtsApkVerityTestAppSplitDmFsvSig = genrule {
    name = "CtsApkVerityTestAppSplitDmFsvSig";
    defaults = ["cts_apk_verity_sig_gen_default"];
    srcs = [":CtsApkVerityTestAppSplitDm"];
    out = ["CtsApkVerityTestAppSplit.dm.fsv_sig"];
};

in { inherit CtsApkVerityTestAppDm CtsApkVerityTestAppDmFsvSig CtsApkVerityTestAppFsvSig CtsApkVerityTestAppSplitDm CtsApkVerityTestAppSplitDmFsvSig CtsApkVerityTestAppSplitFsvSig CtsApkVerityTestDebugFiles cts_apk_verity_sig_gen_default fsverity-debug-cert fsverity-debug-key; }
