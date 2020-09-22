{ filegroup, genrule, genrule_defaults }:
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

ApkVerityTestKeyPem = filegroup {
    name = "ApkVerityTestKeyPem";
    srcs = ["ApkVerityTestKey.pem"];
};

ApkVerityTestCertPem = filegroup {
    name = "ApkVerityTestCertPem";
    srcs = ["ApkVerityTestCert.pem"];
};

ApkVerityTestCertDer = filegroup {
    name = "ApkVerityTestCertDer";
    srcs = ["ApkVerityTestCert.der"];
};

ApkVerityTestAppDm = filegroup {
    name = "ApkVerityTestAppDm";
    srcs = ["ApkVerityTestApp.dm"];
};

ApkVerityTestAppSplitDm = filegroup {
    name = "ApkVerityTestAppSplitDm";
    srcs = ["ApkVerityTestAppSplit.dm"];
};

apk_verity_sig_gen_default = genrule_defaults {
    name = "apk_verity_sig_gen_default";
    tools = ["fsverity"];
    tool_files = [
        ":ApkVerityTestKeyPem"
        ":ApkVerityTestCertPem"
    ];
    cmd = "$(location fsverity) sign $(in) $(out) " +
        "--key=$(location :ApkVerityTestKeyPem) " +
        "--cert=$(location :ApkVerityTestCertPem) " +
        "> /dev/null";
};

ApkVerityTestAppFsvSig = genrule {
    name = "ApkVerityTestAppFsvSig";
    defaults = ["apk_verity_sig_gen_default"];
    srcs = [":ApkVerityTestApp"];
    out = ["ApkVerityTestApp.apk.fsv_sig"];
};

ApkVerityTestAppDmFsvSig = genrule {
    name = "ApkVerityTestAppDmFsvSig";
    defaults = ["apk_verity_sig_gen_default"];
    srcs = [":ApkVerityTestAppDm"];
    out = ["ApkVerityTestApp.dm.fsv_sig"];
};

ApkVerityTestAppSplitFsvSig = genrule {
    name = "ApkVerityTestAppSplitFsvSig";
    defaults = ["apk_verity_sig_gen_default"];
    srcs = [":ApkVerityTestAppSplit"];
    out = ["ApkVerityTestAppSplit.apk.fsv_sig"];
};

ApkVerityTestAppSplitDmFsvSig = genrule {
    name = "ApkVerityTestAppSplitDmFsvSig";
    defaults = ["apk_verity_sig_gen_default"];
    srcs = [":ApkVerityTestAppSplitDm"];
    out = ["ApkVerityTestAppSplit.dm.fsv_sig"];
};

in { inherit ApkVerityTestAppDm ApkVerityTestAppDmFsvSig ApkVerityTestAppFsvSig ApkVerityTestAppSplitDm ApkVerityTestAppSplitDmFsvSig ApkVerityTestAppSplitFsvSig ApkVerityTestCertDer ApkVerityTestCertPem ApkVerityTestKeyPem apk_verity_sig_gen_default; }
