{ filegroup }:
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

#  Prebuilts that are signed with corresponding key of
#  build/make/target/product/security/fsverity-release.x509.der

CtsApkVerityTestPrebuiltFiles = filegroup {
    name = "CtsApkVerityTestPrebuiltFiles";
    srcs = [
        "arm/CtsApkVerityTestApp2Prebuilt.apk"
        "arm/CtsApkVerityTestApp2Prebuilt.apk.fsv_sig"
        "arm/CtsApkVerityTestAppPrebuilt.apk"
        "arm/CtsApkVerityTestAppPrebuilt.apk.fsv_sig"
        "arm/CtsApkVerityTestAppPrebuilt.dm"
        "arm/CtsApkVerityTestAppPrebuilt.dm.fsv_sig"
        "arm/CtsApkVerityTestAppSplitPrebuilt.apk"
        "arm/CtsApkVerityTestAppSplitPrebuilt.apk.fsv_sig"
        "arm/CtsApkVerityTestAppSplitPrebuilt.dm"
        "arm/CtsApkVerityTestAppSplitPrebuilt.dm.fsv_sig"
        "arm64/CtsApkVerityTestApp2Prebuilt.apk"
        "arm64/CtsApkVerityTestApp2Prebuilt.apk.fsv_sig"
        "arm64/CtsApkVerityTestAppPrebuilt.apk"
        "arm64/CtsApkVerityTestAppPrebuilt.apk.fsv_sig"
        "arm64/CtsApkVerityTestAppPrebuilt.dm"
        "arm64/CtsApkVerityTestAppPrebuilt.dm.fsv_sig"
        "arm64/CtsApkVerityTestAppSplitPrebuilt.apk"
        "arm64/CtsApkVerityTestAppSplitPrebuilt.apk.fsv_sig"
        "arm64/CtsApkVerityTestAppSplitPrebuilt.dm"
        "arm64/CtsApkVerityTestAppSplitPrebuilt.dm.fsv_sig"
        "x86/CtsApkVerityTestApp2Prebuilt.apk"
        "x86/CtsApkVerityTestApp2Prebuilt.apk.fsv_sig"
        "x86/CtsApkVerityTestAppPrebuilt.apk"
        "x86/CtsApkVerityTestAppPrebuilt.apk.fsv_sig"
        "x86/CtsApkVerityTestAppPrebuilt.dm"
        "x86/CtsApkVerityTestAppPrebuilt.dm.fsv_sig"
        "x86/CtsApkVerityTestAppSplitPrebuilt.apk"
        "x86/CtsApkVerityTestAppSplitPrebuilt.apk.fsv_sig"
        "x86/CtsApkVerityTestAppSplitPrebuilt.dm"
        "x86/CtsApkVerityTestAppSplitPrebuilt.dm.fsv_sig"
        "x86_64/CtsApkVerityTestApp2Prebuilt.apk"
        "x86_64/CtsApkVerityTestApp2Prebuilt.apk.fsv_sig"
        "x86_64/CtsApkVerityTestAppPrebuilt.apk"
        "x86_64/CtsApkVerityTestAppPrebuilt.apk.fsv_sig"
        "x86_64/CtsApkVerityTestAppPrebuilt.dm"
        "x86_64/CtsApkVerityTestAppPrebuilt.dm.fsv_sig"
        "x86_64/CtsApkVerityTestAppSplitPrebuilt.apk"
        "x86_64/CtsApkVerityTestAppSplitPrebuilt.apk.fsv_sig"
        "x86_64/CtsApkVerityTestAppSplitPrebuilt.dm"
        "x86_64/CtsApkVerityTestAppSplitPrebuilt.dm.fsv_sig"
    ];
};

in { inherit CtsApkVerityTestPrebuiltFiles; }
